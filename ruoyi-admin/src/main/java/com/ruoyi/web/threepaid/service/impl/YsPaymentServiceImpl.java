package com.ruoyi.web.threepaid.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.exception.BusinessException;
import com.ruoyi.common.paying.Base64Util;
import com.ruoyi.common.paying.HttpOkkpClient;
import com.ruoyi.common.paying.PayDigestUtil;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.FaBankinfo;
import com.ruoyi.system.domain.ZxDfpayInfo;
import com.ruoyi.system.domain.ZxDfpayOrder;
import com.ruoyi.system.mapper.ZxDfpayInfoMapper;
import com.ruoyi.system.mapper.ZxDfpayOrderMapper;
import com.ruoyi.system.service.IFaBankinfoService;
import com.ruoyi.system.service.IZxDfpayOrderService;
import com.ruoyi.web.core.config.DfPayChanel;
import com.ruoyi.web.threepaid.service.IPaymentInterface;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.concurrent.TimeUnit;

/**
 * @author leo
 * @version 1.0
 * @desc
 * @date 2021/12/8 18:37
 */
@Slf4j
@Service("gpPaymentService")
public class GpPaymentServiceImpl implements IPaymentInterface {

    @Autowired
    private ZxDfpayInfoMapper zxDfpayInfoMapper;
    @Autowired
    private ZxDfpayOrderMapper zxDfpayOrderMapper;
    @Autowired
    private IFaBankinfoService faBankinfoService;
    @Autowired
    private IZxDfpayOrderService zxDfpayOrderService;

    @Override
    public AjaxResult createOrder(ZxDfpayOrder zxDfpayOrder) throws Exception {
        try {
            Long dfpayId = zxDfpayOrder.getDfpayId();
            //根据代付id 找代付通道
            ZxDfpayInfo zxDfpayInfo = zxDfpayInfoMapper.selectZxDfpayInfoById(dfpayId);
            //根据银行名称查找bankCode
            String bankName = zxDfpayOrder.getBank();
            String bankCode = "";
            if (zxDfpayInfo.getChannelName().equals(DfPayChanel.CHANEL_GP)) {
                FaBankinfo faBankinfo = faBankinfoService.selectBanckInfoByBankName(bankName);
                if (faBankinfo == null) {
                    throw new BusinessException("此银行在数据库中不存在");
                }
                bankCode = faBankinfo.getBankcode1();
            }
            if (StringUtils.isEmpty(bankCode)) {
                zxDfpayOrder.setIsSend(0);
                zxDfpayOrder.setIsNotify(0);
                zxDfpayOrderService.updateZxDfpayOrder(zxDfpayOrder);
                return AjaxResult.error("代付不支持或者找不到代付银行编码，请核对银行名称");
            }
            zxDfpayOrder.setBankCode(bankCode);
            zxDfpayOrderService.updateZxDfpayOrder(zxDfpayOrder);
            JSONObject jsonObject = new JSONObject(true);
            //商户号
            String merchant_no = zxDfpayInfo.getMchId();
            jsonObject.put("merchant_no", merchant_no);
            //商户订单号
            String order_no = zxDfpayOrder.getOrderNo();
            jsonObject.put("order_no", order_no);
            //银行卡号
            String card_no = zxDfpayOrder.getBankCard();
            jsonObject.put("card_no", card_no);
            //银行开户名   使用base64进行编码（UTF-8编码）
            String account_name = Base64Util.encodeData(zxDfpayOrder.getRelalName());
            jsonObject.put("account_name", account_name);
            jsonObject.put("bank_branch", "");
            jsonObject.put("cnaps_no", "");
            //银行代码
            String bank_code = zxDfpayOrder.getBankCode();
            jsonObject.put("bank_code", bank_code);
            //银行名称  参考银行代码对照表，使用base64进行编码（UTF-8编码）
            String bank_name = Base64Util.encodeData(zxDfpayOrder.getBank());
            jsonObject.put("bank_name", bank_name);
            //单位元（人民币），2位小数
            BigDecimal amount = new BigDecimal(zxDfpayOrder.getMoney()).setScale(2, BigDecimal.ROUND_HALF_EVEN);
            //金额
            jsonObject.put("amount", amount);
            log.info("jsonObject: " + jsonObject);
            //接口秘钥
            String key = zxDfpayInfo.getMchKey();
            //支付秘钥
            String pay_pwd = zxDfpayInfo.getSecret();
            //签名 结果小写
            String sign = PayDigestUtil.getSignGpMD5(jsonObject, pay_pwd, key);
            log.info("签名结果小写: " + sign);
            String content = "merchant_no=" + merchant_no + "&order_no=" + order_no + "&card_no=" + card_no + "&account_name=" + account_name
                    + "&bank_code=" + bank_code + "&bank_name=" + bank_name + "&amount=" + amount + "&sign=" + sign;
            log.info("传参内容:  " + content);
            //https://oa.beifeng777.com/withdraw/singleWithdraw
            String apiUrl = zxDfpayInfo.getApiUrl() + "/singleWithdraw";
            log.info("请求的地址:" + apiUrl);
            JSONObject jsonObject1 = HttpOkkpClient.postOkkp3(apiUrl, content);
            log.info(" GP 代付下单返回的jsonObject1:" + jsonObject1);
            if (jsonObject1.getString("result_code").equals("000000")) {
                log.info("代付订单提交成功");
                zxDfpayOrder = zxDfpayOrderMapper.selectZxDfpayOrderById(zxDfpayOrder.getId());
                zxDfpayOrder.setIsSend(1);
                zxDfpayOrder.setRemark("代付下单成功");
                zxDfpayOrderMapper.updateZxDfpayOrder(zxDfpayOrder);
                return AjaxResult.success();
            } else {
                String result_msg = jsonObject1.getString("result_msg");
                log.info("代付申请失败原因={}", result_msg);
                zxDfpayOrder = zxDfpayOrderMapper.selectZxDfpayOrderById(zxDfpayOrder.getId());
                zxDfpayOrder.setRemark(result_msg);
                zxDfpayOrderMapper.updateZxDfpayOrder(zxDfpayOrder);
                return AjaxResult.error(result_msg);
            }

        } catch (Exception e) {
            throw new BusinessException("代付下单失败：" + e.getMessage());
        }

    }

    @Override
    public Boolean checkOrderStaus(String orderNo) throws Exception {
        try {
            //根据订单号查询订单
            ZxDfpayOrder zxDfpayOrder = zxDfpayOrderMapper.selectZxDfpayOrderByOrderNo(orderNo);
            Long dfpayId = zxDfpayOrder.getDfpayId();
            //根据代付id 找代付通道
            ZxDfpayInfo zxDfpayInfo = zxDfpayInfoMapper.selectZxDfpayInfoById(dfpayId);
            JSONObject jsonObject = new JSONObject(true);
            //商户号
            String merchant_no = zxDfpayInfo.getMchId();
            jsonObject.put("merchant_no", merchant_no);
            //商户订单号
            String order_no = zxDfpayOrder.getOrderNo();
            jsonObject.put("order_no", order_no);
            //签名 结果小写
            //接口秘钥
            String key = zxDfpayInfo.getMchKey();
            String sign = PayDigestUtil.getSignGpCheck(jsonObject, key);
            log.info("签名结果小写: " + sign);
            String content = "merchant_no=" + merchant_no + "&order_no=" + order_no + "&sign=" + sign;
            log.info("传参内容:  " + content);
            //https://oa.beifeng777.com/withdraw/queryOrder
            String apiUrl = zxDfpayInfo.getApiUrl() + "/queryOrder";
            log.info("请求的地址:" + apiUrl);
            TimeUnit.SECONDS.sleep(1);
            JSONObject jsonObject1 = HttpOkkpClient.postOkkp3(apiUrl, content);
            System.out.println("jsonObject1:" + jsonObject1);
            if (jsonObject1.getString("result_code").equals("000000")) {
                String result = jsonObject1.getString("result");
                log.info("代付订单查询成功");
                if (result.equals("S")) {
                    log.info("代付成功");
                    return Boolean.TRUE;
                }
            }
        } catch (Exception e) {
            throw new BusinessException("查询不能太频繁(1分钟只能查询1次)");
        }
        return Boolean.FALSE;
    }

}

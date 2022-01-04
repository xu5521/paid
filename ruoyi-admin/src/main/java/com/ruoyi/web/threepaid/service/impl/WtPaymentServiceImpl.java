package com.ruoyi.web.threepaid.service.impl;

import cn.hutool.core.date.DateTime;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.exception.BusinessException;
import com.ruoyi.common.paying.Base64Util;
import com.ruoyi.common.paying.DateUtilZone;
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
 * @desc  永顺代付实现类
 * @date 2021/12/8 18:37
 */
@Slf4j
@Service("ysPaymentService")
public class YsPaymentServiceImpl implements IPaymentInterface {

    @Autowired
    private ZxDfpayInfoMapper zxDfpayInfoMapper;
    @Autowired
    private ZxDfpayOrderMapper zxDfpayOrderMapper;


    @Override
    public AjaxResult createOrder(ZxDfpayOrder zxDfpayOrder) throws Exception {
        try {
            Long dfpayId = zxDfpayOrder.getDfpayId();
            //根据代付id 找代付通道
            ZxDfpayInfo zxDfpayInfo = zxDfpayInfoMapper.selectZxDfpayInfoById(dfpayId);
            JSONObject jsonObject = new JSONObject(true);
            //商户号
            String mchId = zxDfpayInfo.getMchId();
            jsonObject.put("mchId", mchId);
            //商户订单号
            String mchOrderNo = zxDfpayOrder.getOrderNo();
            jsonObject.put("mchOrderNo", mchOrderNo);
            //金额 分
            int amount = new BigDecimal(zxDfpayOrder.getMoney()).multiply(new BigDecimal(100)).intValue();
            jsonObject.put("amount", amount);
            //银行名称
            String bankName = zxDfpayOrder.getBank();
            jsonObject.put("bankName", bankName);
            //收款人姓名
            String accountName = zxDfpayOrder.getRelalName();
            jsonObject.put("accountName", accountName);
            //收款人卡号
            String accountNo = zxDfpayOrder.getBankCard();
            jsonObject.put("accountNo", accountNo);
            //代付结果回调URL
            String notifyUrl = zxDfpayInfo.getNotifyUrl();
            jsonObject.put("notifyUrl", notifyUrl);
            //请求时间
            String reqTime = DateUtilZone.getYsTime(new DateTime());
            jsonObject.put("reqTime", reqTime);
            //请求时间
            String version = "1.0";
            jsonObject.put("version", version);
            //秘钥
            String key = zxDfpayInfo.getMchKey();
            String sign = PayDigestUtil.getSignDyMD5(jsonObject, key);
            log.info("签名结果小写: " + sign);
            String content = "mchId=" + mchId + "&mchOrderNo=" + mchOrderNo + "&amount=" + amount + "&bankName=" + bankName
                    + "&accountName=" + accountName + "&accountNo=" + accountNo + "&notifyUrl=" + notifyUrl + "&reqTime=" + reqTime
                    + "&version=" + version + "&sign=" + sign;
            log.info("传参内容:  " + content);
            String apiUrl = zxDfpayInfo.getApiUrl() + "/apply";
            log.info("请求的地址:" + apiUrl);
            JSONObject jsonObject1 = HttpOkkpClient.postOkkp3(apiUrl, content);
            System.out.println("jsonObject1:" + jsonObject1);
            if (jsonObject1.getString("retCode").equals("0")) {
                log.info("代付订单提交成功");
                zxDfpayOrder = zxDfpayOrderMapper.selectZxDfpayOrderById(zxDfpayOrder.getId());
                zxDfpayOrder.setIsSend(1);
                zxDfpayOrder.setRemark("代付下单成功");
                zxDfpayOrderMapper.updateZxDfpayOrder(zxDfpayOrder);
                return AjaxResult.success();
            } else {
                String retMsg = jsonObject1.getString("retMsg");
                log.info("代付申请失败原因={}", retMsg);
                zxDfpayOrder = zxDfpayOrderMapper.selectZxDfpayOrderById(zxDfpayOrder.getId());
                zxDfpayOrder.setRemark(retMsg);
                zxDfpayOrderMapper.updateZxDfpayOrder(zxDfpayOrder);
                return AjaxResult.error(retMsg);
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
            //
            JSONObject jsonObject = new JSONObject(true);
            //商户号
            String mchId = zxDfpayInfo.getMchId();
            jsonObject.put("mchId", mchId);
            //商户订单号
            String mchOrderNo = zxDfpayOrder.getOrderNo();
            jsonObject.put("mchOrderNo", mchOrderNo);
            String reqTime = DateUtilZone.getYsTime(new DateTime());
            jsonObject.put("reqTime", reqTime);
            String version = "1.0";
            jsonObject.put("version", version);
            //接口秘钥
            String key = zxDfpayInfo.getMchKey();
            String sign = PayDigestUtil.getSignDyMD5(jsonObject, key);
            log.info("签名结果小写: " + sign);
            String content = "mchId=" + mchId + "&mchOrderNo=" + mchOrderNo + "&reqTime=" + reqTime + "&version=" + version + "&sign=" + sign;
            log.info("传参内容:  " + content);
            //http://8.218.44.224:3020/api/agentpay/query_order
            //http://8.218.44.224:3020/api/agentpay/apply
            String apiUrl = zxDfpayInfo.getApiUrl() + "/query_order";
            log.info("请求的地址:" + apiUrl);
            JSONObject jsonObject1 = HttpOkkpClient.postOkkp3(apiUrl, content);
            System.out.println("jsonObject1:" + jsonObject1);
            if (jsonObject1.getString("retCode").equals("0")) {
                //状态:0-待处理,1-处理中,2-成功,3-失败,4-待人工处理
                String status = jsonObject1.getString("status");
                log.info("代付订单查询成功");
                if (status.equals("2")) {
                    log.info("代付成功");
                    return Boolean.TRUE;
                }
            }
        } catch (Exception e) {
            throw new BusinessException("查询不能太频繁,请稍后再试!!!" + e.getMessage());
        }
        log.info("代付失败");
        return Boolean.FALSE;
    }

}

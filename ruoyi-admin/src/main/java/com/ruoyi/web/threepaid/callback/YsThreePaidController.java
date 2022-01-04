package com.ruoyi.web.threepaid.callback;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.paying.HttpUtils;
import com.ruoyi.common.paying.PayDigestUtil;
import com.ruoyi.system.domain.ZxDfpayInfo;
import com.ruoyi.system.domain.ZxDfpayOrder;
import com.ruoyi.system.service.IZxDfpayInfoService;
import com.ruoyi.system.service.IZxDfpayOrderService;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Map;

/**
 * @author leo
 * @version 1.0
 * @desc 1.自动回调
 * @date 2021/12/8 13:23
 */
@Slf4j
@RestController
@RequestMapping("/yx")
public class YxThreePaidController extends BaseController {
    @Autowired
    private IZxDfpayInfoService zxDfpayInfoService;
    @Autowired
    private IZxDfpayOrderService zxDfpayOrderService;

    @RequestMapping(value = "/callback", method = {RequestMethod.GET, RequestMethod.POST})
    @Transactional
    @ApiOperation("永顺代付回调")
    public void callback(HttpServletRequest request, HttpServletResponse response) throws IOException {
        log.info("-----------------------永顺代付通知调用--------------------");
        String requestString = HttpUtils.getRequestString(request);
        log.info("requestString:" + requestString);
        JSONObject jsonObject = JSONObject.parseObject(requestString);
        //组装新的 加密对象
        JSONObject object = new JSONObject(true);
        JSONArray jsonArray = new JSONArray();
        log.info("jsonObject :" + jsonObject);
        String sign = jsonObject.getString("sign");
        jsonObject.remove("sign");
        //取出通知中的订单
        JSONArray orders = jsonObject.getJSONArray("orders");
        //商户号
        String merchant_no = jsonObject.getString("merchant_no");
        object.put("merchant_no", merchant_no);
        orders.stream().forEach(m -> {
            Map<String, Object> map = (Map) JSON.parseObject(m.toString(), Map.class);
            JSONObject order = new JSONObject(true);
            String order_no = map.get("order_no").toString();
            order.put("order_no", order_no);
            String mer_order_no = map.get("mer_order_no").toString();
            order.put("mer_order_no", mer_order_no);
            String result = map.get("result").toString();
            order.put("result", result);
            String amount = map.get("amount").toString();
            order.put("amount", amount);
            String withdraw_fee = map.get("withdraw_fee").toString();
            order.put("withdraw_fee", withdraw_fee);
            jsonArray.add(order);
        });
        object.put("orders", jsonArray);
        ZxDfpayInfo zxDfpayInfo = zxDfpayInfoService.selectZxDfpayInfoByMchId(merchant_no);
        //接口秘钥
        String key = zxDfpayInfo.getMchKey();
        //支付秘钥
        String secret = zxDfpayInfo.getSecret();
        String newSign = PayDigestUtil.getSignGpCallback(object, key);
        log.info("sign: " + sign + " ,newSign: " + newSign);
        if (!newSign.equals(sign)) {
            response.getWriter().write("FAIL");
            return;
        }
        orders.stream().forEach(o -> {
            Map<String, Object> map = (Map) JSON.parseObject(o.toString(), Map.class);
            String mer_order_no = map.get("mer_order_no").toString();
            //根据订单号查询订单
            ZxDfpayOrder zxDfpayOrder = zxDfpayOrderService.selectZxDfpayOrderByOrderNo(mer_order_no);
            if (zxDfpayOrder == null) {
                log.error("此订单不存在");
                return;
            }
            //代付状态
            if (zxDfpayOrder.getPayStatus() == 1 && zxDfpayOrder.getIsNotify() == 1) {
                log.info("此订单已完成");
                return;
            }
            //结果
            String result = map.get("result").toString();
            //S：成功 F：失败  H：处理中
            if (!"S".equals(result)) {
                return;
            }
            //商户钱包扣除金额
            String amount = map.get("amount").toString();
            //手续费
            String withdraw_fee = map.get("withdraw_fee").toString();
            double v = new BigDecimal(amount).subtract(new BigDecimal(withdraw_fee)).doubleValue();
            Double money = zxDfpayOrder.getMoney();
            double difference = v - money;
            //如果 金额相差太大,则不算成功
            if (Math.abs(difference) > 5) {
                return;
            }
            //表示此订单没有发送代付
            if (zxDfpayOrder.getIsSend() != 1){
                return;
            }
            //支付状态0 表示成功
            zxDfpayOrder.setPayStatus(1);
            zxDfpayOrder.setIsNotify(1);
            zxDfpayOrder.setPayResult("SUCCESS");
            zxDfpayOrder.setRemark("回调成功,代付成功");
            zxDfpayOrder.setPayTime(new Date());
            zxDfpayOrderService.updateZxDfpayOrder(zxDfpayOrder);
        });
        response.getWriter().write("SUCCESS");
    }
}

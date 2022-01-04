package com.ruoyi.web.threepaid.callback;

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
import java.util.Date;
import java.util.Optional;
import java.util.SortedMap;

/**
 * @author leo
 * @version 1.0
 * @desc 1.自动回调
 * @date 2021/12/8 13:23
 */
@Slf4j
@RestController
@RequestMapping("/ys")
public class YsThreePaidController extends BaseController {
    @Autowired
    private IZxDfpayInfoService zxDfpayInfoService;
    @Autowired
    private IZxDfpayOrderService zxDfpayOrderService;

    @RequestMapping(value = "/callback", method = {RequestMethod.GET, RequestMethod.POST})
    @Transactional
    @ApiOperation("永顺代付回调")
    public void callback(HttpServletRequest request, HttpServletResponse response) throws IOException {
        log.info("-----------------------永顺代付通知调用--------------------");
        SortedMap<String, String> sortedMap = HttpUtils.getFormData(request);
        log.info("requestString:" + sortedMap);
        String requestBody = JSONObject.toJSONString(sortedMap);
        JSONObject jsonObject = JSONObject.parseObject(requestBody);
        log.info("jsonObject :" + jsonObject);
        String sign = Optional.ofNullable(jsonObject.getString("sign")).orElse("");
        jsonObject.remove("sign");
        String mchOrderNo = jsonObject.getString("mchOrderNo");
        //根据订单号查询订单
        ZxDfpayOrder zxDfpayOrder = zxDfpayOrderService.selectZxDfpayOrderByOrderNo(mchOrderNo);
        if (zxDfpayOrder == null) {
            log.error("此订单不存在");
            return;
        }
        ZxDfpayInfo zxDfpayInfo = zxDfpayInfoService.selectZxDfpayInfoById(zxDfpayOrder.getDfpayId());
        //代付状态
        if (zxDfpayOrder.getPayStatus() == 1 && zxDfpayOrder.getIsNotify() == 1) {
            log.info("此订单已完成");
            return;
        }
        //表示此订单没有发送代付
        if (zxDfpayOrder.getIsSend() != 1) {
            return;
        }
        //状态:0-待处理,1-处理中,2-成功,3-失败,4-待人工处理
        String status = jsonObject.getString("status");
        //接口秘钥
        String key = zxDfpayInfo.getMchKey();
        String newSign = PayDigestUtil.getSignDyMD5(jsonObject, key);
        log.info("sign: " + sign + " ,newSign: " + newSign);
        if (newSign.equals(sign)) {
            if ("2".equals(status)) {
                //支付状态2 表示成功
                zxDfpayOrder.setPayStatus(1);
                zxDfpayOrder.setIsNotify(1);
                zxDfpayOrder.setPayResult("SUCCESS");
                zxDfpayOrder.setRemark("回调成功,代付成功");
                zxDfpayOrder.setPayTime(new Date());
                zxDfpayOrderService.updateZxDfpayOrder(zxDfpayOrder);
                response.getWriter().write("success");
                return;
            }
        }
        response.getWriter().write("fail");
        return;
    }
}

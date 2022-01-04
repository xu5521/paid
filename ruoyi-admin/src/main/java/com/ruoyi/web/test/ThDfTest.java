package com.ruoyi.web.test;

import cn.hutool.core.date.DateTime;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.paying.Base64Util;
import com.ruoyi.common.paying.DateUtilZone;
import com.ruoyi.common.paying.HttpOkkpClient;
import com.ruoyi.common.paying.PayDigestUtil;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;

import java.math.BigDecimal;

@Slf4j
public class YsDfTest {
    /**
     * 永顺代付
     * 永顺代付
     * 链接：http://8.218.44.224:56703/x_mch/start/index.html#/
     * 登录名：guli1
     * 登录密码：aa123456
     * 商户Id： 20000057
     * 商户ID: 20000057
     * 秘钥：3F3LN2JPGFUDCIOMAMNSYHGEI9G4UU0OOJPLXN88CSRVU5V3OJTZKJIBKRF3UAOJ76YACHM0TWYAD0NWKL88JTU9BTOYZRIVYUHONR40NR10ZFRCO1Y9EZMOWQVCPXZT
     */

    public static String mchId = "20000057";
    //接口秘钥
    public static String key = "3F3LN2JPGFUDCIOMAMNSYHGEI9G4UU0OOJPLXN88CSRVU5V3OJTZKJIBKRF3UAOJ76YACHM0TWYAD0NWKL88JTU9BTOYZRIVYUHONR40NR10ZFRCO1Y9EZMOWQVCPXZT";
    //网关
    public static String url = "http://8.218.44.224:3020/api/agentpay";


    //支付
    @Test
    public void createOrder() throws Exception {
        JSONObject jsonObject = new JSONObject(true);
        //商户号
        jsonObject.put("mchId", mchId);
        //商户订单号
        String mchOrderNo = String.valueOf(System.currentTimeMillis());
        jsonObject.put("mchOrderNo", mchOrderNo);
        //金额 分
        int amount = new BigDecimal(20.05).multiply(new BigDecimal(100)).intValue();
        jsonObject.put("amount", amount);
        //银行名称
        String bankName = "中国工商银行";
        jsonObject.put("bankName", bankName);
        //收款人姓名
        String accountName = "雷奥";
        jsonObject.put("accountName", accountName);
        //收款人卡号
        String accountNo = "6222021204065895456";
        jsonObject.put("accountNo", accountNo);
        //代付结果回调URL
        String notifyUrl = "http://5fac-103-139-17-28.ngrok.io/ys/callback";
        jsonObject.put("notifyUrl", notifyUrl);
        //请求时间
        String reqTime = DateUtilZone.getYsTime(new DateTime());
        jsonObject.put("reqTime", reqTime);
        //请求时间
        String version = "1.0";
        jsonObject.put("version", version);
        String sign = PayDigestUtil.getSignDyMD5(jsonObject, key);
        log.info("签名结果小写: " + sign);
        String content = "mchId=" + mchId + "&mchOrderNo=" + mchOrderNo + "&amount=" + amount + "&bankName=" + bankName
                + "&accountName=" + accountName + "&accountNo=" + accountNo + "&notifyUrl=" + notifyUrl + "&reqTime=" + reqTime
                + "&version=" + version + "&sign=" + sign;
        log.info("传参内容:  " + content);
        String apiUrl = url + "/apply";
        log.info("请求的地址:" + apiUrl);
        JSONObject jsonObject1 = HttpOkkpClient.postOkkp3(apiUrl, content);
        System.out.println("jsonObject1:" + jsonObject1);
        if (jsonObject1.getString("retCode").equals("0")) {
            log.info("代付订单提交成功");
        } else {
            String retMsg = jsonObject1.getString("retMsg");
            log.info("代付申请失败原因={}", retMsg);
        }
    }


    /**
     * 代付状态查询接口
     */
    @Test
    public void getOrder() throws Exception {
        JSONObject jsonObject = new JSONObject(true);
        //商户号
        jsonObject.put("mchId", mchId);
        //商户订单号
        String mchOrderNo = "1639126350195";
        jsonObject.put("mchOrderNo", mchOrderNo);
        String reqTime = DateUtilZone.getYsTime(new DateTime());
        jsonObject.put("reqTime", reqTime);
        String version = "1.0";
        jsonObject.put("version", version);
        String sign = PayDigestUtil.getSignDyMD5(jsonObject, key);
        log.info("签名结果小写: " + sign);
        String content = "mchId=" + mchId + "&mchOrderNo=" + mchOrderNo + "&reqTime=" + reqTime + "&version=" + version + "&sign=" + sign;
        log.info("传参内容:  " + content);
        //http://8.218.44.224:3020/api/agentpay/query_order
        //http://8.218.44.224:3020/api/agentpay/apply
        String apiUrl = url + "/query_order";
        log.info("请求的地址:" + apiUrl);
        JSONObject jsonObject1 = HttpOkkpClient.postOkkp3(apiUrl, content);
        System.out.println("jsonObject1:" + jsonObject1);
        if (jsonObject1.getString("retCode").equals("0")) {
            //状态:0-待处理,1-处理中,2-成功,3-失败,4-待人工处理
            String status = jsonObject1.getString("status");
            log.info("代付订单查询成功");
            if (status.equals("2")) {
                log.info("代付成功");
                return;
            }
        }
        log.info("代付失败");
    }

}

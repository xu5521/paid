package com.ruoyi.web.test;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.paying.Base64Util;
import com.ruoyi.common.paying.HttpOkkpClient;
import com.ruoyi.common.paying.PayDigestUtil;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;

import java.math.BigDecimal;

@Slf4j
public class YxDfTest {
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
    //支付秘钥
    public static String pay_pwd = "0B5469C3C02B18EEE5DFC4546D4DBA7C33343478704C";
    //接口秘钥
    public static String key = "3F3LN2JPGFUDCIOMAMNSYHGEI9G4UU0OOJPLXN88CSRVU5V3OJTZKJIBKRF3UAOJ76YACHM0TWYAD0NWKL88JTU9BTOYZRIVYUHONR40NR10ZFRCO1Y9EZMOWQVCPXZT";
    //下单地址 代付
    public static String url = "http://8.218.44.224:3020/api/agentpay/apply";


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
        String notifyUrl = Base64Util.encodeData("中国工商银行");
        jsonObject.put("notifyUrl", notifyUrl);
        //单位元（人民币），2位小数
//        BigDecimal amount = new BigDecimal(20).setScale(2, BigDecimal.ROUND_HALF_EVEN);
//        //金额
//        jsonObject.put("amount", amount);
//        log.info("jsonObject: " + jsonObject);
//        //签名 结果小写
//        String sign = PayDigestUtil.getSignGpMD5(jsonObject, pay_pwd, key);
//        log.info("签名结果小写: " + sign);
//        String content = "merchant_no=" + mchId + "&order_no=" + order_no + "&card_no=" + card_no + "&account_name=" + account_name
//                + "&bank_code=" + bank_code + "&bank_name=" + bank_name + "&amount=" + amount + "&sign=" + sign;
//        log.info("传参内容:  " + content);
//        //https://oa.beifeng777.com/withdraw/singleWithdraw?merchant_no=xxx&order_no=xxx&card_no=xxx&account_name=xxx&bank_branch=xxx&cnaps_no=xxx&bank_code=xxx&bank_name=xxx&amount=xxx&sign=xxx
//        String apiUrl = url + "/singleWithdraw";
//        log.info("请求的地址:" + apiUrl);
//        JSONObject jsonObject1 = HttpOkkpClient.postOkkp3(apiUrl, content);
//        System.out.println("jsonObject1:" + jsonObject1);
//        if (jsonObject1.getString("result_code").equals("000000")) {
//            log.info("代付订单提交成功");
//        } else {
//            String result_msg = jsonObject1.getString("result_msg");
//            log.info("代付申请失败原因={}", result_msg);
//        }
    }


    /**
     * 代付状态查询接口
     */
    @Test
    public void getOrder() throws Exception {
        JSONObject jsonObject = new JSONObject(true);
        //商户号
        jsonObject.put("merchant_no", mchId);
        //商户订单号
        String order_no = "185952455623815858995";
        jsonObject.put("order_no", order_no);
        log.info("jsonObject: " + jsonObject);
        //签名 结果小写
        String sign = PayDigestUtil.getSignGpCheck(jsonObject, key);
        log.info("签名结果小写: " + sign);
        String content = "merchant_no=" + mchId + "&order_no=" + order_no + "&sign=" + sign;
        log.info("传参内容:  " + content);
        //https://oa.beifeng777.com/withdraw/queryOrder
        String apiUrl = url + "/queryOrder";
        log.info("请求的地址:" + apiUrl);
        JSONObject jsonObject1 = HttpOkkpClient.postOkkp3(apiUrl, content);
        System.out.println("jsonObject1:" + jsonObject1);
        if (jsonObject1.getString("result_code").equals("000000")) {
            String result = jsonObject1.getString("result");
            log.info("代付订单查询成功");
            if (result.equals("S")) {
                log.info("代付成功");
                return;
            }
        }
        log.info("代付失败");
    }

}

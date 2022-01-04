package com.ruoyi.web.test;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.paying.Base64Util;
import com.ruoyi.common.paying.HttpOkkpClient;
import com.ruoyi.common.paying.PayDigestUtil;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;

import java.math.BigDecimal;

@Slf4j
public class GpDfTest {
    /**
     * GP代付
     * https://items.nolan2077.net/merchant/index.jsp
     * 登录名：chongzhi666
     * 密码：aa123123
     * <p>
     * 接口密钥：  172956ba-4135-11ec-ace9-675296533690
     * 支付秘钥：0B5469C3C02B18EEE5DFC4546D4DBA7C33343478704C
     * <p>
     * 商户名（登录账户）：GP166111041807
     */

    public static String merchant_no = "GP166111041807";
    //支付秘钥
    public static String pay_pwd = "0B5469C3C02B18EEE5DFC4546D4DBA7C33343478704C";
    //接口秘钥
    public static String key = "172956ba-4135-11ec-ace9-675296533690";
    //下单地址
    //public static String url = "https://oa.beifeng777.com/withdraw/singleWithdraw";
    //public static String url = "https://oa.beifeng777.com/withdraw/queryOrder";
    public static String url = "https://oa.beifeng777.com/withdraw";


    //支付
    @Test
    public void createOrder() throws Exception {
        JSONObject jsonObject = new JSONObject(true);
        //商户号
        jsonObject.put("merchant_no", merchant_no);
        //商户订单号
        String order_no = String.valueOf(System.currentTimeMillis());
        jsonObject.put("order_no", order_no);
        //银行卡号
        String card_no = "6222021204065895285";
        jsonObject.put("card_no", card_no);
        //银行开户名   使用base64进行编码（UTF-8编码）
        String account_name = Base64Util.encodeData("雷奥");
        jsonObject.put("account_name", account_name);
        jsonObject.put("bank_branch", "");
        jsonObject.put("cnaps_no", "");
        //银行代码
        String bank_code = "ICBC";
        jsonObject.put("bank_code", bank_code);
        //银行名称  参考银行代码对照表，使用base64进行编码（UTF-8编码）
        String bank_name = Base64Util.encodeData("中国工商银行");
        jsonObject.put("bank_name", bank_name);
        //单位元（人民币），2位小数
        BigDecimal amount = new BigDecimal(20).setScale(2, BigDecimal.ROUND_HALF_EVEN);
        //金额
        jsonObject.put("amount", amount);
        log.info("jsonObject: " + jsonObject);
        //签名 结果小写
        String sign = PayDigestUtil.getSignGpMD5(jsonObject, pay_pwd, key);
        log.info("签名结果小写: " + sign);
        String content = "merchant_no=" + merchant_no + "&order_no=" + order_no + "&card_no=" + card_no + "&account_name=" + account_name
                + "&bank_code=" + bank_code + "&bank_name=" + bank_name + "&amount=" + amount + "&sign=" + sign;
        log.info("传参内容:  " + content);
        //https://oa.beifeng777.com/withdraw/singleWithdraw?merchant_no=xxx&order_no=xxx&card_no=xxx&account_name=xxx&bank_branch=xxx&cnaps_no=xxx&bank_code=xxx&bank_name=xxx&amount=xxx&sign=xxx
        String apiUrl = url + "/singleWithdraw";
        log.info("请求的地址:" + apiUrl);
        JSONObject jsonObject1 = HttpOkkpClient.postOkkp3(apiUrl, content);
        System.out.println("jsonObject1:" + jsonObject1);
        if (jsonObject1.getString("result_code").equals("000000")) {
            log.info("代付订单提交成功");
        } else {
            String result_msg = jsonObject1.getString("result_msg");
            log.info("代付申请失败原因={}", result_msg);
        }
    }


    /**
     * 代付状态查询接口
     */
    @Test
    public void getOrder() throws Exception {
        JSONObject jsonObject = new JSONObject(true);
        //商户号
        jsonObject.put("merchant_no", merchant_no);
        //商户订单号
        String order_no = "185952455623815858995";
        jsonObject.put("order_no", order_no);
        log.info("jsonObject: " + jsonObject);
        //签名 结果小写
        String sign = PayDigestUtil.getSignGpCheck(jsonObject, key);
        log.info("签名结果小写: " + sign);
        String content = "merchant_no=" + merchant_no + "&order_no=" + order_no + "&sign=" + sign;
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

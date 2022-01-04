package com.pig4cloud.pigx.admin.df;

import com.alibaba.fastjson.JSONObject;
import com.pig4cloud.pigx.admin.escrow.zxown.PayDigestUtil;
import com.pig4cloud.pigx.common.core.exception.BizException;
import lombok.extern.slf4j.Slf4j;
import okhttp3.*;
import org.junit.Test;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Slf4j
public class GlobalDfTest {
    /**
     * 支付网关（更新）
     * http://gyials.gdsua.com
     * <p>
     * 代付网关（更新）
     * http://njsyal.gdsua.com
     * <p>
     * **以下商户只能用于测试,切勿放到正式环境使用,测试号有接口频率限制,请勿频繁调用,否则请求ip会自动拉黑**
     * <p>
     * 商户测试号
     * 商户号：gm761100000033104
     * 密匙：EE7DBB17BF1B237973FAAD1EAF6A5AA6
     */


    public static String mchId = "gm761100000032380";
    public static String key = "FF7F733FFB6932224C2A8BEF241FA43E";
    public static String gatewayUrl = "http://gyials.gdsua.com";


    public static String createOrderUrl = "http://www.koipayment.net:8896/api/order/create";

    public static String queryUrl = "http://www.koipayment.net:8896/api/order/query";

    private static final List<String> bankCodeList = new ArrayList<>();

    static {
        bankCodeList.add("SCB");
        bankCodeList.add("KBANK");
        bankCodeList.add("KTB");
        bankCodeList.add("BBL");
        bankCodeList.add("TMB");
        bankCodeList.add("GSB");
        bankCodeList.add("BAY");
        bankCodeList.add("CIMB");
        bankCodeList.add("TBNK");
        bankCodeList.add("BAAC");
        bankCodeList.add("LHBA");
        bankCodeList.add("GHB");
    }



    //支付
    @Test
    public void createOrder() throws Exception {

        JSONObject jsonObject = new JSONObject(true);
        //商户id
        String mer_no = mchId;
        jsonObject.put("mer_no", mer_no);
        //商户订单号
        String mer_order_no = String.valueOf(System.currentTimeMillis());
        jsonObject.put("mer_order_no", mer_order_no);
        //收款账号
        String acc_no = "0693811546";
        jsonObject.put("acc_no", acc_no);
        //收款姓名
        String acc_name = "ธนาคารกสิกรไทย";
        jsonObject.put("acc_name", acc_name);
        //币种
        String ccy_no = "THB";
        jsonObject.put("ccy_no", ccy_no);
        //单位元（人民币），2位小数
        BigDecimal bigDecimal = new BigDecimal(200).setScale(2, BigDecimal.ROUND_HALF_EVEN);
        boolean b = bigDecimal.remainder(new BigDecimal("1")).compareTo(BigDecimal.ZERO) == 0;
        //金额整数限制
        if (!b) {
            throw new BizException("金额必须为整数");
        }
        String order_amount = bigDecimal.toString();
        //金额
        jsonObject.put("order_amount", order_amount);
        //银行编码
        String bank_code = "BAAC";
        jsonObject.put("bank_code", bank_code);
        if(!bankCodeList.contains(bank_code)){
            throw new BizException("不支持的银行");
        }
        //手机号
        String mobile_no = "0158943";
        jsonObject.put("mobile_no", mobile_no);
        //回调地址
        String notifyUrl = "http://03307f5346fe.ngrok.io/admin/api/globalPay/callback";
        jsonObject.put("notifyUrl", notifyUrl);
        //备注
        String summary = "1111";
        jsonObject.put("summary", summary);
        //签名
        String sign = PayDigestUtil.getSignDyMD5(jsonObject, key).toLowerCase();
        jsonObject.put("sign", sign);
        //http://njsyal.gdsua.com
        String url = "http://njsyal.gdsua.com/withdraw/singleOrder";
        log.info("请求的地址:" + url);
        log.info("-----------jsonObject-----------:" + jsonObject.toString());
        JSONObject jsonObject1 = postOkkpJson(url, jsonObject.toString());
        log.info("jsonObject1:" + jsonObject1);
        if (jsonObject1.getString("status").equalsIgnoreCase("SUCCESS")) {
            log.info("代付订单提交成功");
        }
    }

//    public static void main(String[] args) {
//        String mer_no = "+998841411";
//        if(mer_no.startsWith("+")){
//           mer_no = mer_no.replace("+","");
//            System.out.println("号码:" + mer_no);
//        }
//    }


    /**
     * 订单查询
     */
    @Test
    public void getOrder() throws Exception {
        JSONObject jsonObject = new JSONObject(true);
        //商户号
        String merchantid = mchId;
        //商户id
        jsonObject.put("merchantid", merchantid);
        String orderid = "1623727501248";
        //商户订单号
        jsonObject.put("orderid", orderid);
        //签名
        String sign = PayDigestUtil.getSignJl(jsonObject, key).toLowerCase();
        String content = "merchantid=" + merchantid + "&orderid=" + orderid +
                "&sign=" + sign;
        String url = queryUrl;
        JSONObject jsonObject1 = postOkkp(url, content);
        System.out.println("jsonObject1:" + jsonObject1);
        if (jsonObject1.getInteger("code") == 0) {
            String status = jsonObject1.getJSONObject("data").getString("status");
            if ("2".equals(status)) {
                System.out.println("已支付");
            } else {
                System.out.println("未支付");
            }
        } else {
            System.out.println("未支付");
        }
    }


    public JSONObject postOkkp(String url, String content) throws Exception {
        OkHttpClient client = new OkHttpClient().newBuilder()
                .build();
        MediaType mediaType = MediaType.parse("application/x-www-form-urlencoded");
        //拼接 vendor_id=ph3uvxhved&vendor_member_id=tdm_ZH_551_test&operatorId=tdm&username=tdm_ZH_551_test&oddstype=1&currency=20&maxtransfer=100000000&mintransfer=1
        RequestBody body = RequestBody.create(mediaType, content);
        Request request = new Request.Builder()
                .url(url)
                .method("POST", body)
                .addHeader("Content-Type", "application/x-www-form-urlencoded")
                .build();
        Response response = client.newCall(request).execute();
        String result = response.body().string();
        System.out.println("result:" + result);
        JSONObject jsonObject = JSONObject.parseObject(result);
        return jsonObject;
    }

    public JSONObject postOkkpJson(String url, String json) throws Exception {
        OkHttpClient client = new OkHttpClient().newBuilder()
                .build();
        MediaType mediaType = MediaType.parse("application/json");
        RequestBody body = RequestBody.create(mediaType, json);
        Request request = new Request.Builder()
                .url(url)
                .method("POST", body)
                .addHeader("Content-Type", "application/json")
                .build();
        Response response = client.newCall(request).execute();
        String result = response.body().string();
        System.out.println("result:" + result);
        JSONObject jsonObject = JSONObject.parseObject(result);
        return jsonObject;
    }


}

package com.pig4cloud.pigx.admin.escrow.zxown;

import cn.hutool.crypto.digest.MD5;
import com.alibaba.fastjson.JSONObject;
import com.pig4cloud.pigx.admin.escrow.model.ApiParamModel;
import com.pig4cloud.pigx.admin.util.MD5Helper;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Field;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.*;
import java.util.stream.Collectors;

/**
 * @author dingzhiwei jmdhappy@126.com
 * @version V1.0
 * @Description:
 * @date 2017-07-05
 * @Copyright: www.xxpay.org
 */
@Slf4j
public class PayDigestUtil {

    //private static final MyLog _log = MyLog.getLog(PayDigestUtil.class);
    private static String encodingCharset = "UTF-8";

    /**
     * @param aValue
     * @param aKey
     * @return
     */
    public static String hmacSign(String aValue, String aKey) {
        byte k_ipad[] = new byte[64];
        byte k_opad[] = new byte[64];
        byte keyb[];
        byte value[];
        try {
            keyb = aKey.getBytes(encodingCharset);
            value = aValue.getBytes(encodingCharset);
        } catch (UnsupportedEncodingException e) {
            keyb = aKey.getBytes();
            value = aValue.getBytes();
        }

        Arrays.fill(k_ipad, keyb.length, 64, (byte) 54);
        Arrays.fill(k_opad, keyb.length, 64, (byte) 92);
        for (int i = 0; i < keyb.length; i++) {
            k_ipad[i] = (byte) (keyb[i] ^ 0x36);
            k_opad[i] = (byte) (keyb[i] ^ 0x5c);
        }

        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e) {

            return null;
        }
        md.update(k_ipad);
        md.update(value);
        byte dg[] = md.digest();
        md.reset();
        md.update(k_opad);
        md.update(dg, 0, 16);
        dg = md.digest();
        return toHex(dg);
    }

    public static String toHex(byte input[]) {
        if (input == null) {
            return null;
        }
        StringBuffer output = new StringBuffer(input.length * 2);
        for (int i = 0; i < input.length; i++) {
            int current = input[i] & 0xff;
            if (current < 16) {
                output.append("0");
            }
            output.append(Integer.toString(current, 16));
        }

        return output.toString();
    }

    /**
     * @param args
     * @param key
     * @return
     */
    public static String getHmac(String[] args, String key) {
        if (args == null || args.length == 0) {
            return (null);
        }
        StringBuffer str = new StringBuffer();
        for (int i = 0; i < args.length; i++) {
            str.append(args[i]);
        }
        return (hmacSign(str.toString(), key));
    }

    /**
     * @param aValue
     * @return
     */
    public static String digest(String aValue) {
        aValue = aValue.trim();
        byte value[];
        try {
            value = aValue.getBytes(encodingCharset);
        } catch (UnsupportedEncodingException e) {
            value = aValue.getBytes();
        }
        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance("SHA");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
        return toHex(md.digest(value));

    }

    public static String md5(String value, String charset) {
        MessageDigest md = null;
        try {
            byte[] data = value.getBytes(charset);
            md = MessageDigest.getInstance("MD5");
            byte[] digestData = md.digest(data);
            return toHex(digestData);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static String getSign(Object o, String key) throws IllegalAccessException {
        if (o instanceof Map) {
            return getSign((Map<String, Object>) o, key);
        }
        ArrayList<String> list = new ArrayList<String>();
        Class cls = o.getClass();
        Field[] fields = cls.getDeclaredFields();
        for (Field f : fields) {
            f.setAccessible(true);
            if (f.get(o) != null && !"".equals(f.get(o))) {
                list.add(f.getName() + "=" + f.get(o) + "&");
            }
        }
        int size = list.size();
        String[] arrayToSort = list.toArray(new String[size]);
        Arrays.sort(arrayToSort, String.CASE_INSENSITIVE_ORDER);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < size; i++) {
            sb.append(arrayToSort[i]);
        }
        String result = sb.toString();
        result += "key=" + key;
        //_log.debug("Sign Before MD5:" + result);
        result = md5(result, encodingCharset).toUpperCase();
        //_log.debug("Sign Result:" + result);
        return result;
    }

    public static String getSign(Map<String, Object> map, String key) {
        ArrayList<String> list = new ArrayList<String>();
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            if (!"".equals(entry.getValue()) && null != entry.getValue()) {
                list.add(entry.getKey() + "=" + entry.getValue() + "&");
            }
        }
        int size = list.size();
        String[] arrayToSort = list.toArray(new String[size]);
        Arrays.sort(arrayToSort, String.CASE_INSENSITIVE_ORDER);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < size; i++) {
            sb.append(arrayToSort[i]);
        }
        String result = sb.toString();
        result += "key=" + key;
        System.out.println("Sign Before MD5:" + result);
        //_log.debug("Sign Before MD5:" + result);
        result = md5(result, encodingCharset).toUpperCase();
        //_log.debug("Sign Result:" + result);
        System.out.println("Sign Result :" + result);
        return result;
    }


    /**
     * 不能删,对签名进行加密处理
     *
     * @param map
     * @param key
     * @return
     */
    public static String getSignLeo(Map<String, Object> map, String key) {
        ArrayList<String> list = new ArrayList<String>();
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            if (!"".equals(entry.getValue()) && null != entry.getValue()) {
                list.add(entry.getKey() + "=" + entry.getValue() + "&");
            }
        }
        int size = list.size();
        String[] arrayToSort = list.toArray(new String[size]);
        Arrays.sort(arrayToSort, String.CASE_INSENSITIVE_ORDER);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < size; i++) {
            sb.append(arrayToSort[i]);
        }
        String result = sb.toString().substring(0, sb.length() - 1);
        result += key;
        System.out.println("Sign Before MD5:" + result);
        //_log.debug("Sign Before MD5:" + result);
        result = md5(result, encodingCharset).toUpperCase();
        //_log.debug("Sign Result:" + result);
        System.out.println("Sign Result :" + result);
        return result;
    }

    /**
     * 参数加密
     *
     * @param map
     * @return
     */
    public static String getSignMD5(Map<String, Object> map) {
        ArrayList<String> list = new ArrayList<String>();
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            if (!"".equals(entry.getValue()) && null != entry.getValue()) {
                list.add(entry.getValue() + ",");
            }
        }
        int size = list.size();
        String[] arrayToSort = list.toArray(new String[size]);
//        Arrays.sort(arrayToSort, String.CASE_INSENSITIVE_ORDER);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < size; i++) {
            sb.append(arrayToSort[i]);
        }
        String result = sb.toString().substring(0, sb.length() - 1);
        System.out.println("Sign Before MD5:" + result);
        //_log.debug("Sign Before MD5:" + result);
        result = md5(result, encodingCharset).toLowerCase();
        //_log.debug("Sign Result:" + result);
        System.out.println("Sign Result :" + result);
        return result;
    }

    public static String digestMD5(JSONObject jsonObject, String secret_key) {
        MD5 md5 = MD5.create();
        // jsonobject转按字典顺序排序好的map
        SortedMap<String, Object> map = JSONObject.parseObject(jsonObject.toJSONString(), TreeMap.class);
        // key=value+&拼接
        String collect = map.entrySet()
                .stream()
                .map(entry -> entry.getKey() + "=" + entry.getValue())
                .collect(Collectors.joining("&")) + "&key=" + secret_key;
        log.info("字符串：{}", collect);
        return md5.digestHex(collect);
    }

    public static String digestMD5(Map map, String secret_key) {
        MD5 md5 = MD5.create();
        // key=value+&拼接
        String collect = map.keySet()
                .stream()
                .map(key -> key + "=" + map.get(key))
                .collect(Collectors.joining("&")) + "&key=" + secret_key;
        log.info("字符串：{}", collect);
        return md5.digestHex(collect);
    }

    /**
     * @param map
     * @param key
     * @param notContains 不包含的签名字段
     * @return
     */
    public static String getSign(Map<String, Object> map, String key, String... notContains) {
        Map<String, Object> newMap = new HashMap<String, Object>();
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            boolean isContain = false;
            for (int i = 0; i < notContains.length; i++) {
                if (entry.getKey().equals(notContains[i])) {
                    isContain = true;
                    break;
                }
            }
            if (!isContain) {
                newMap.put(entry.getKey(), entry.getValue());
            }
        }
        return getSign(newMap, key);
    }

    /**
     * 获取签名完全按ascii排序
     *
     * @param map
     * @return
     */
    public static String getSign(Map<String, Object> map) {
        ArrayList<String> list = new ArrayList<String>();
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            if (!"".equals(entry.getValue()) && null != entry.getValue()) {
                list.add(entry.getKey() + "=" + entry.getValue() + "&");
            }
        }
        int size = list.size();
        String[] arrayToSort = list.toArray(new String[size]);
        Arrays.sort(arrayToSort, String.CASE_INSENSITIVE_ORDER);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < size; i++) {
            sb.append(arrayToSort[i]);
        }
        String result = sb.substring(0, sb.lastIndexOf("&"));
        System.out.println("Sign Before MD5:" + result);
        //_log.debug("Sign Before MD5:" + result);
        result = md5(result, encodingCharset).toUpperCase();
        //_log.debug("Sign Result:" + result);
        return result;
    }

    /**
     * 雄支付
     *
     * @param map
     * @param key
     * @return
     */
    public static String getSignXf(Map<String, Object> map, String key) {
        ArrayList<String> list = new ArrayList<String>();
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            if (!"".equals(entry.getValue()) && null != entry.getValue()) {
                list.add(entry.getKey() + "=" + entry.getValue() + "&");
            }
        }
        int size = list.size();
        String[] arrayToSort = list.toArray(new String[size]);
        Arrays.sort(arrayToSort, String.CASE_INSENSITIVE_ORDER);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < size; i++) {
            sb.append(arrayToSort[i]);
        }
        String result = sb.toString().substring(0, sb.length() - 1);
        System.out.println("result:" + result);
        //加上&
        String data = result + "&key=" + key;
        System.out.println("Sign Before MD5:" + data);
        //_log.debug("Sign Before MD5:" + result);
        //改
//        result = md5(data, encodingCharset).toUpperCase();
        String rest = md5(data, encodingCharset).toUpperCase();
        //_log.debug("Sign Result:" + result);
        System.out.println("Sign Result :" + rest);
        return rest;
    }

    /**
     * 盛联 支付
     *
     * @param map
     * @param key
     * @return
     */
    public static String getSignSl(Map<String, Object> map, String key) {
        ArrayList<String> list = new ArrayList<String>();
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            if (!"".equals(entry.getValue()) && null != entry.getValue()) {
                list.add(entry.getKey() + "=" + entry.getValue() + "&");
            }
        }
        int size = list.size();
        String[] arrayToSort = list.toArray(new String[size]);
        Arrays.sort(arrayToSort, String.CASE_INSENSITIVE_ORDER);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < size; i++) {
            sb.append(arrayToSort[i]);
        }
        String result = sb.toString().substring(0, sb.length() - 1);
        System.out.println("result:" + result);
        //加上&
        String data = result + key;
        System.out.println("Sign Before MD5:" + data);
        String rest = md5(data, encodingCharset).toUpperCase();
        System.out.println("Sign Result :" + rest);
        return rest;
    }

    /**
     * 大风车
     *
     * @param map
     * @param key
     * @return
     */
    public static String getSignDfc(Map<String, Object> map, String key) {
        ArrayList<String> list = new ArrayList<String>();
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            list.add(entry.getKey() + "=" + entry.getValue() + "&");
        }
        int size = list.size();
        String[] arrayToSort = list.toArray(new String[size]);
        Arrays.sort(arrayToSort, String.CASE_INSENSITIVE_ORDER);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < size; i++) {
            sb.append(arrayToSort[i]);
        }
        String result = sb.toString().substring(0, sb.length() - 1);
        System.out.println("result:" + result);
        //加上&
        String data = result + "&key=" + key;
        System.out.println("Sign Before MD5:" + data);
        //_log.debug("Sign Before MD5:" + result);
        //改
//        result = md5(data, encodingCharset).toUpperCase();
        String rest = md5(data, encodingCharset).toUpperCase();
        //_log.debug("Sign Result:" + result);
        System.out.println("Sign Result :" + rest);
        return rest;
    }

    /**
     * df支付签名
     *
     * @param map
     * @return
     */
    public static String getSignDyMD5(Map<String, Object> map, String key) {
        ArrayList<String> list = new ArrayList<String>();
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            if (!"".equals(entry.getValue()) && null != entry.getValue()) {
                list.add(entry.getKey() + "=" + entry.getValue() + "&");
            }
        }
        int size = list.size();
        String[] arrayToSort = list.toArray(new String[size]);
        Arrays.sort(arrayToSort, String.CASE_INSENSITIVE_ORDER);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < size; i++) {
            sb.append(arrayToSort[i]);
        }
        String result = sb + "key=" + key;
        System.out.println("Sign Before MD5:" + result);
        result = md5(result, encodingCharset).toUpperCase();
        System.out.println("Sign After MD5:" + result);
        return result;
    }

    /**
     * 环球支付签名
     * @param map
     * @return
     */
    public static String getSignHq(Map<String, Object> map, String key) {
        List<String> list = new LinkedList<String>();
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            if (!"".equals(entry.getValue()) && null != entry.getValue()) {
                list.add(entry.getKey() + "=" + entry.getValue() + "&");
            }
        }
        int size = list.size();
        String[] arrayToSort = list.toArray(new String[size]);
        Arrays.sort(arrayToSort, String.CASE_INSENSITIVE_ORDER);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < size; i++) {
            sb.append(arrayToSort[i]);
        }
        String result = sb + "key=" + key;
        System.out.println("Sign Before MD5:" + result);
        result = md5(result, encodingCharset).toUpperCase();
        System.out.println("Sign After MD5:" + result);
        return result;
    }

    /**
     * Xcf 支付签名
     *
     * @param map
     * @return
     */
    public static String getSignXcfMD5(Map<String, Object> map, String key) {
        ArrayList<String> list = new ArrayList<String>();
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            if (!"".equals(entry.getValue()) && null != entry.getValue()) {
                list.add(entry.getKey() + "=" + entry.getValue() + "&");
            }
        }
        int size = list.size();
        String[] arrayToSort = list.toArray(new String[size]);
//        Arrays.sort(arrayToSort, String.CASE_INSENSITIVE_ORDER);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < size; i++) {
            sb.append(arrayToSort[i]);
        }
        String result = sb + key;
        System.out.println("result={}," + result);
        System.out.println("Sign Before MD5:" + result);
        result = md5(result, encodingCharset).toUpperCase();
        System.out.println("Sign After MD5:" + result);
        return result;
    }

    /**
     * 米宝支付签名
     * @param map
     * @return
     */
    public static String getSignMibao(Map<String, Object> map, String key) {
        List<String> list = new ArrayList<String>();
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            if (!"".equals(entry.getValue()) && null != entry.getValue()) {
                list.add(entry.getKey() + "=" + entry.getValue() + "&");
            }
        }
        int size = list.size();
        String[] arrayToSort = list.toArray(new String[size]);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < size; i++) {
            sb.append(arrayToSort[i]);
        }
        String result = sb + "key=" + key;
        System.out.println("result={}," + result);
        System.out.println("Sign Before MD5:" + result);
        String sign = MD5Helper.sign(result, encodingCharset);
        System.out.println("Sign After MD5:" + sign);
        return sign;
    }

    /**
     * 鸿运通支付签名
     *
     * @param map
     * @param key
     * @return
     */
    public static String getSignHyt(Map<String, Object> map, String key) {
        List<String> list = new ArrayList<String>();
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            list.add(entry.getKey() + "=" + entry.getValue() + "&");
        }
        int size = list.size();
        String[] arrayToSort = list.toArray(new String[size]);
        Arrays.sort(arrayToSort, String.CASE_INSENSITIVE_ORDER);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < size; i++) {
            sb.append(arrayToSort[i]);
        }
        String getUrl = StringUtils.removeEnd(sb.toString(), "&");
        String result = getUrl + key;
        log.info("result={}," + result);
        log.info("Sign Before MD5:" + result);
        result = md5(result, encodingCharset).toLowerCase();
        log.info("Sign After MD5:" + result);
        return result;
    }


    /**
     * 锦鲤支付签名
     * @param map
     * @param key
     * @return
     */
    public static String getSignJl(Map<String, Object> map, String key) {
        List<String> list = new ArrayList<String>();
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            list.add(entry.getKey() + "=" + entry.getValue() + "&");
        }
        int size = list.size();
        String[] arrayToSort = list.toArray(new String[size]);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < size; i++) {
            sb.append(arrayToSort[i]);
        }
        String getUrl = StringUtils.removeEnd(sb.toString(), "&");
        String result = getUrl + key;
        log.info("result={}," + result);
        log.info("Sign Before MD5:" + result);
        result = md5(result, encodingCharset).toLowerCase();
        log.info("Sign After MD5:" + result);
        return result;
    }



    /**
     * 香蕉代收 签名
     *
     * @param map
     * @param key
     * @return
     */
    public static String getMD5ByBananaPay(Map<String, Object> map, String key) {
        ArrayList<String> list = new ArrayList<String>();
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            list.add(entry.getKey() + "=" + entry.getValue() + "&");
        }
        int size = list.size();
        String[] arrayToSort = list.toArray(new String[size]);
        Arrays.sort(arrayToSort, String.CASE_INSENSITIVE_ORDER);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < size; i++) {
            sb.append(arrayToSort[i]);
        }
        StringBuilder stringBuilder = sb.deleteCharAt(sb.length() - 1);
        StringBuilder append = stringBuilder.append(key);
        System.out.println("result={}," + append.toString());
        System.out.println("Sign Before MD5:" + append.toString());
        String result = md5(append.toString(), encodingCharset).toUpperCase();
        System.out.println("Sign After MD5:" + result);
        return result;
    }

    /**
     * @param map
     * @param
     * @return
     */
    public static String getMD5ByBananaPay02(Map<String, Object> map) {
        ArrayList<String> list = new ArrayList<String>();
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            list.add(entry.getKey() + "=" + entry.getValue() + "&");
        }
        int size = list.size();
        String[] arrayToSort = list.toArray(new String[size]);
        Arrays.sort(arrayToSort, String.CASE_INSENSITIVE_ORDER);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < size; i++) {
            sb.append(arrayToSort[i]);
        }
        StringBuilder stringBuilder = sb.deleteCharAt(sb.length() - 1);

        System.out.println("result={}," + stringBuilder.toString());
        System.out.println("Sign Before MD5:" + stringBuilder.toString());
        String result = md5(stringBuilder.toString(), encodingCharset).toUpperCase();
        System.out.println("Sign After MD5:" + result);
        return result;
    }

    public static String getMD5ByBananaPay03(String key, String md5One) {
        String md5Before = md5One + key;
        System.out.println("Sign Before MD5:" + md5Before);
        String result = md5(md5Before, encodingCharset).toUpperCase();
        System.out.println("Sign After MD5:" + result);
        return result;
    }

    /**
     * 校验内部接口签名
     *
     * @param paramModel
     * @param businessSecret
     * @return
     */
    public static boolean checkInnerSign(ApiParamModel paramModel, String businessSecret) {
        JSONObject apiParams = JSONObject.parseObject(JSONObject.toJSONString(paramModel));
        String apiSign = apiParams.getString("sign");
        apiParams.remove("sign");
        String myApiSign = PayDigestUtil.getSign(apiParams, businessSecret);
        return apiSign.equals(myApiSign);
    }

    public static String pingGetUrl(Map<String, String> map, String apiUrl) {
        ArrayList<String> list = new ArrayList<String>();
        for (Map.Entry<String, String> entry : map.entrySet()) {
            if (!"".equals(entry.getValue()) && null != entry.getValue()) {
                list.add(entry.getKey() + "=" + entry.getValue() + "&");
            }
        }
        int size = list.size();
        String[] arrayToSort = list.toArray(new String[size]);
        Arrays.sort(arrayToSort, String.CASE_INSENSITIVE_ORDER);
        StringBuilder sb = new StringBuilder(apiUrl);
        sb.append("?");
        for (int i = 0; i < size; i++) {
            sb.append(arrayToSort[i]);
        }
        String getUrl = StringUtils.removeEnd(sb.toString(), "&");
        return getUrl;
    }

    /**
     * 支付宝请求支付签名
     *
     * @param map
     * @param key
     * @return
     */
    public static String getAlipaySign(Map<String, String> map, String key) {
        ArrayList<String> list = new ArrayList<String>();
        for (Map.Entry<String, String> entry : map.entrySet()) {
            if (!"".equals(entry.getValue()) && null != entry.getValue()) {
                list.add(entry.getKey() + "=" + entry.getValue() + "&");
            }
        }
        int size = list.size();
        String[] arrayToSort = list.toArray(new String[size]);
        Arrays.sort(arrayToSort, String.CASE_INSENSITIVE_ORDER);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < size; i++) {
            sb.append(arrayToSort[i]);
        }
        String result = StringUtils.removeEnd(sb.toString(), "&");
        result = result + key;
        System.out.println("Sign Before MD5:" + result);
        result = md5(result, encodingCharset);
        System.out.println("Sign Result :" + result);
        return result;
    }

    public static String getAlipaySignDF(Map<String, String> map, String key) {
        ArrayList<String> list = new ArrayList<String>();
        for (Map.Entry<String, String> entry : map.entrySet()) {
            if (!"".equals(entry.getValue()) && null != entry.getValue()) {
                list.add(entry.getKey() + "=" + entry.getValue() + "&");
            }
        }
        int size = list.size();
        String[] arrayToSort = list.toArray(new String[size]);
        Arrays.sort(arrayToSort);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < size; i++) {
            sb.append(arrayToSort[i]);
        }
        String result = StringUtils.removeEnd(sb.toString(), "&");
        result = result + key;
        System.out.println("Sign Before MD5:" + result);
        result = md5(result, encodingCharset);
        System.out.println("Sign Result :" + result);
        return result;
    }

    /**
     * 大象代付簽名
     *
     * @param map
     * @param key
     * @return
     */
    public static String getDxSign(Map<String, String> map, String key) {
        ArrayList<String> list = new ArrayList<String>();
        for (Map.Entry<String, String> entry : map.entrySet()) {
/*            try {
                list.add(entry.getKey() + "=" + URLEncoder.encode(entry.getValue().toString(),"UTF8").toLowerCase() + "&");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();

            }*/
            list.add(entry.getKey() + "=" + entry.getValue() + "&");
        }
        int size = list.size();
        String[] arrayToSort = list.toArray(new String[size]);
        Arrays.sort(arrayToSort, String.CASE_INSENSITIVE_ORDER);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < size; i++) {
            sb.append(arrayToSort[i]);
        }
        String result = sb.toString();
        result += "secret=" + key;
        System.out.println("Sign Before MD5:" + result);
        //_log.debug("Sign Before MD5:" + result);
        result = md5(result, encodingCharset).toLowerCase();
        //_log.debug("Sign Result:" + result);
        System.out.println("Sign Result :" + result);
        return result;
    }

    public static String getDxSign_(Map<String, String> map, String key) {
        ArrayList<String> list = new ArrayList<String>();
        for (Map.Entry<String, String> entry : map.entrySet()) {
            try {
                list.add(entry.getKey() + "=" + URLEncoder.encode(entry.getValue().toString(), "UTF8").toLowerCase() + "&");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();

            }
        }
        int size = list.size();
        String[] arrayToSort = list.toArray(new String[size]);
        Arrays.sort(arrayToSort, String.CASE_INSENSITIVE_ORDER);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < size; i++) {
            sb.append(arrayToSort[i]);
        }
        String result = sb.toString();
        result += "secret=" + key;
        System.out.println("Sign Before MD5:" + result);
        //_log.debug("Sign Before MD5:" + result);
        result = md5(result, encodingCharset).toLowerCase();
        //_log.debug("Sign Result:" + result);
        System.out.println("Sign Result :" + result);
        return result;
    }

    public static String getDxSign__(Map<String, String> map, String key) {
        ArrayList<String> list = new ArrayList<String>();
        for (Map.Entry<String, String> entry : map.entrySet()) {
            try {
                if (!"".equals(entry.getValue()) && null != entry.getValue()) {
                    list.add(entry.getKey() + "=" + URLEncoder.encode(entry.getValue().toString(), "UTF8").toLowerCase() + "&");
                } else {
                    list.add(entry.getKey() + "=" + entry.getValue().toString() + "&");
                }
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();

            }
        }
        int size = list.size();
        String[] arrayToSort = list.toArray(new String[size]);
        Arrays.sort(arrayToSort, String.CASE_INSENSITIVE_ORDER);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < size; i++) {
            sb.append(arrayToSort[i]);
        }
        String result = sb.toString();
        result += "secret=" + key;
        System.out.println("Sign Before MD5:" + result);
        //_log.debug("Sign Before MD5:" + result);
        result = md5(result, encodingCharset).toLowerCase();
        //_log.debug("Sign Result:" + result);
        System.out.println("Sign Result :" + result);
        return result;
    }

    /**
     * @param map
     * @param key
     * @return
     */
    public static String getSignJd(Map<String, Object> map, String key) {
        ArrayList<String> list = new ArrayList<String>();
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            try {
                if (!"".equals(entry.getValue()) && null != entry.getValue()) {
                    list.add(entry.getKey() + "=" + URLEncoder.encode(entry.getValue().toString(), "UTF8").toLowerCase() + "&");
                } else {
                    list.add(entry.getKey() + "=" + entry.getValue().toString() + "&");
                }
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();

            }
        }
        int size = list.size();
        String[] arrayToSort = list.toArray(new String[size]);
        Arrays.sort(arrayToSort, String.CASE_INSENSITIVE_ORDER);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < size; i++) {
            sb.append(arrayToSort[i]);
        }
        String result = sb.toString();
        result += "secret=" + key;
        log.info("getSignJd Sign Before MD5:" + result);
        //_log.debug("Sign Before MD5:" + result);
        result = md5(result, encodingCharset).toLowerCase();
        //_log.debug("Sign Result:" + result);
        log.info("getSignJd Sign Result :" + result);
        return result;
    }

    /**
     * 如意代收签名
     * @param map
     * @param key
     * @return
     */
    public static String getSignRy(Map<String, Object> map, String key) {
        ArrayList<String> list = new ArrayList<String>();
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            if (!"".equals(entry.getValue()) && null != entry.getValue()) {
                list.add(entry.getKey() + "=" + entry.getValue() + "&");
            }
        }
        int size = list.size();
        String[] arrayToSort = list.toArray(new String[size]);
        Arrays.sort(arrayToSort, String.CASE_INSENSITIVE_ORDER);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < size; i++) {
            sb.append(arrayToSort[i]);
        }
        String result = sb + "paySecret=";
        result += key;
        log.info("Sign Before MD5:" + result);
        result = md5(result, encodingCharset).toUpperCase();
        log.info("Sign Result :" + result);
        return result;
    }
}

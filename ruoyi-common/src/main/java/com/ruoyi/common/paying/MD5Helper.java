package com.pig4cloud.pigx.admin.util;


import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Helper {

    public static String sign(String text,String charset) {
    	try
    	{
	    	 MessageDigest md = MessageDigest.getInstance("MD5");
	         md.update(text.getBytes(charset));
	         byte b[] = md.digest();
	         int i;
	         StringBuffer buf = new StringBuffer("");
	         for (int offset = 0; offset < b.length; offset++) {
	          i = b[offset];
	          if (i < 0)
	           i += 256;
	          if (i < 16)
	           buf.append("0");
	          buf.append(Integer.toHexString(i));
         }
         return buf.toString();
        } catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
         e.printStackTrace();
        }
    	return null;
    }
    
}
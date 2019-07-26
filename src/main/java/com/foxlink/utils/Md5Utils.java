package com.foxlink.utils;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Md5Utils {

	   static String convertToHexString(byte data[]) {
		  StringBuffer strBuffer = new StringBuffer();
		  for (int i = 0; i < data.length; i++) {
		   strBuffer.append(Integer.toHexString(0xff & data[i]));
		 
		  }
		  return strBuffer.toString();
		 }
	  public static boolean compareValue(String pwd,CharSequence database){
		 
		  return (encryptString(pwd)).equals(database);
	  }
	  public static String encryptString(String text){
		  byte data[] = null;
		  MessageDigest m;
		  try {
		   data = text.getBytes("UTF8");
		   m = MessageDigest.getInstance("MD5");
		   m.update(data);
		   byte resultData[] = m.digest();
		  return convertToHexString(resultData);
		  } catch (NoSuchAlgorithmException e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
		  } catch (UnsupportedEncodingException e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
		  }
		  return null;
		  
	  }
}
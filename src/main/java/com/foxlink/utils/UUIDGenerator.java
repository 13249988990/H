package com.foxlink.utils;

import java.util.UUID;
/**
 * 主鍵生成器
 *
 */
public final class UUIDGenerator {

    private UUIDGenerator() { 
    } 
    /** 
     * 获得一个UUID 
     * @return String UUID 
     */ 
    public static String getUUID(){ 
        return UUID.randomUUID().toString().replaceAll("-", "");
    } 
    /** 
     * 获得指定数目的UUID 
     * @param number int 需要获得的UUID数量 
     * @return String[] UUID数组 
     */ 
    public static String[] getUUID(int number){ 
        if(number < 1){ 
            return null; 
        } 
        String[] ids = new String[number]; 
        for(int i=0;i<number;i++){ 
        	ids[i] = getUUID(); 
        } 
        return ids; 
    } 
}

package com.foxlink.utils;

import java.io.IOException;
import java.util.Map.Entry;
import java.util.Comparator;
import java.util.Properties;
import java.util.Set;
import java.util.TreeSet;


import org.apache.commons.lang.builder.CompareToBuilder;

public final class SystemConfig {
	private static  Properties pallet = new Properties();
	private static Properties authorities = new Properties();
	private static Properties model = new Properties();
	private static Properties box = new Properties();
	private static final String PALLET_FILE = "pallet.properties";
	private static final String AUTHORITIES_FILE = "authorities.properties";
	private static final String model_FILE = "model.properties";
	private static final String BOX_FILE = "box.properties";
	
	
	private SystemConfig() {
	}
	
	static {
		try {
			pallet.load(SystemConfig.class.getClassLoader().getResourceAsStream(PALLET_FILE));
			authorities.load(SystemConfig.class.getClassLoader().getResourceAsStream(AUTHORITIES_FILE));
			model.load(SystemConfig.class.getClassLoader().getResourceAsStream(model_FILE));
			//box.load(SystemConfig.class.getClassLoader().getResourceAsStream(BOX_FILE));
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException("初始化系統參數時出錯!",e);
		}
	}
	
	public static String getPallet(String key){
		return pallet.getProperty(key);
	}
	
	public static String geMachineName(String key){
		return model.getProperty(key);
	}
	public static String getBox(String key){
		return box.getProperty(key);
	}
	
	public static TreeSet<Entry<Object,Object>> getAuthorities(){
		Set<Entry<Object,Object>> entrys =  authorities.entrySet();
		TreeSet<Entry<Object,Object>> tree = new TreeSet<Entry<Object,Object>>(new Comparator<Entry<Object,Object>>() {
			@Override
			public int compare(Entry<Object, Object> o1, Entry<Object, Object> o2) {
				return new CompareToBuilder().append(o1.getKey(), o2.getKey()).toComparison();
			}
		});
		tree.addAll(entrys);
		return tree;
	}
}

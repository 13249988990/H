package com.foxlink.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public final class DateUtil {
	private static final  Calendar c = Calendar.getInstance(); 
	public static SimpleDateFormat sdf;
	private DateUtil(){
		
	}
	/**
	 * 返回小时
	 * 
	 * @param date   日期
	 * @return 返回小时
	 */
	public static int getHour(java.util.Date date) {
		c.setTime(date);
		return c.get(java.util.Calendar.HOUR_OF_DAY);
	}

	/**
	 * 返回分钟
	 * 
	 * @param date   日期
	 * @return 返回分钟
	 */
	public static int getMinute(java.util.Date date) {
		c.setTime(date);
		return c.get(java.util.Calendar.MINUTE);
	}
	
	public static int getHourAndMinute(Date date){
		c.setTime(date);
		return c.get(Calendar.HOUR_OF_DAY)*100+c.get(Calendar.MINUTE);
	}
	
	/**
	 * 返回當前小時和分種的的總分鐘數
	 * @param date
	 * @return
	 */
	public static int getCurrentTime(Date date){
		c.setTime(date);
		return c.get(java.util.Calendar.HOUR_OF_DAY) * 60 + c.get(java.util.Calendar.MINUTE);
		
	}
	
	
	
	/**
	 * 返加年月日,不包含時間
	 * @return
	 */
	public static  Date getDate(Date date){
		c.setTime(date);
		c.set(Calendar.HOUR_OF_DAY,0);
		c.set(Calendar.MINUTE,0);
		c.set(Calendar.SECOND, 0);
		c.set(Calendar.MILLISECOND, 0);
		return c.getTime();
	}
	
	public static Date add(Date date, int hour, int minute){
		c.setTime(date);
		c.add(Calendar.HOUR_OF_DAY, hour);
		c.add(Calendar.MINUTE, minute);
		return c.getTime();
	}

	public static Date getYesterday(Date date) {
		c.setTime(date);
		c.add(Calendar.DAY_OF_MONTH, -1);
		return c.getTime();
	}

	public static int getDay() {
		c.setTime(new Date());
		return c.getFirstDayOfWeek();
	}

	public static int getYear() {
		c.setTime(new Date());
		return c.get(Calendar.YEAR);
	}
	public static int getMonth() {
		c.setTime(new Date());
		return c.get(Calendar.MONTH);
	}
	
	public static Date getTomorrow(Date date) {
		c.setTime(date);
		c.add(Calendar.DAY_OF_MONTH, 1);
		return c.getTime();
	}
	public SimpleDateFormat SDF(){
		return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	}
}

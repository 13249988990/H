package com.foxlink.utils;
import java.util.regex.Pattern;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foxlink.mes.bean.Admin;

public final class WebUtil {
	public static String RoomrepairInRepairUrl="http://10.0.101.172/MRecords/repair/toInRepair.html?";
	public static String RoomrepairOutRepairUrl="http://10.0.101.172/MRecords/repair/toOutRepair.html?";
	public static String LinerepairInRepairUrl="http://192.168.1.118/MRecords/repair/toInRepair.html?";
	public static String LinerepairOutRepairUrl="http://192.168.1.118/MRecords/repair/toOutRepair.html?";
	public static Admin getAdmin(HttpServletRequest request){
		return (Admin)request.getSession().getAttribute(Admin.USERNAME);
	}
	
	public static String getIP(HttpServletRequest request){
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
	public static String getFirstIP(String ips){
		/*System.out.println(ips);
		String [] ip = ips.split("\\.");
		for (int i = 0; i < ip.length; i++) {
			System.out.println(ip[0]+"-----");
		}*/
		return ips.split("\\.")[0];
	}
	
	public static String getIpPrefix(HttpServletRequest request){
	
		return getIP(request).split("\\.")[0];
	}
	/**
	 * 正常时间格式转换为yyyy_mm_dd_hh_mm_ss
	 * @param simple
	 * @return
	 * @throws Exception 
	 */
	public static String dateFomart(String simple) throws Exception{
		String date = "";
		String dateRegex = "\\d{4}-\\d{2}-\\d{2}\\s+\\d{2}:\\d{2}:\\d{2}";
		if (!Pattern.matches(dateRegex, simple)) {
			throw new Exception("传入时间格式错误!");
		} else {
			if (simple.contains("-")) {
				String[] args = simple.split(" ");
				String part1[] = args[0].split("-");
				String part2[] = args[1].split(":");
				String total[] = new String[part1.length + part2.length];
				System.arraycopy(part1, 0, total, 0, part1.length);
				System.arraycopy(part2, 0, total, part1.length, part2.length);
				for (int i = 0; i < total.length; i++) {
					if (i < total.length - 1) {
						date += total[i] + "_";
					} else {
						date += total[i];
					}
				}
			}
		}

		return date;
	}
	public static String getRequestUrl(HttpServletRequest request,HttpServletResponse response){
		
		// request.getScheme() http
		//request.getServerName() 10.0.17.214
		//request.getServerPort() 8080
		
		return request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getRequestURI();
		
	}
	
	public static boolean isNull(String parameter){
		if("".equals(parameter)||parameter==null){
			return true;
		}else{
			return false;
		}
	}
	
}

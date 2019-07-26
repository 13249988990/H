package com.foxlink.utils;
@SuppressWarnings("all")
public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//System.out.println(Md5Utils.encryptString("Foxlink@2015"));
		//5CF3704B1481 
		//String hex="5CF3704B1481";
		//Long x = Long.parseLong(hex, 16);
		System.out.println(Long.parseLong("5CF3704CBA67", 16));
		System.out.println("5C:F3:70:4B:20:38".replaceAll(":", ""));
		System.out.println(test("5C:F3:70:4C:BD:C5",1));;
		System.out.println(Long.parseLong("5CF3704CD1D6", 16));
		//5C:F3:70:4C:BD:C5
		
	}
	public static String test(String mac1,int type){
		Long start1=Long.parseLong("5CF3704B1481", 16);
		Long end1=Long.parseLong("5CF3704B2038", 16);
		Long start2=Long.parseLong("5CF3704CBA67", 16);
		Long end2=Long.parseLong("5CF3704CD1D6", 16);
		Long mac=Long.parseLong(mac1.replaceAll(":", ""), 16);
		String message=null;
		
		if(type==1){
			if((start1<=mac&&end1>=mac)||(start2<=mac&&end2>=mac)){
				message=mac+" 不能介于[5CF3704B1481-5CF3704B2038]或者[5CF3704CBA67-5CF3704CD1D6]区间!";
				
			}
		}else{
			if(message==null){
				if((start1<=mac&&end1>=mac)||(start2<=mac&&end2>=mac)){
					
				}else{
					message=mac+" 只能在[5CF3704B1481-5CF3704B2038]或者[5CF3704CBA67-5CF3704CD1D6]区间!";
					
				}
			}
		}
		
		
		return message;
	}

}

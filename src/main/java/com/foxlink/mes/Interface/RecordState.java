package com.foxlink.mes.Interface;

public interface RecordState {
	public static final int UNDEFINED=-1;
	
	public static final int ZERO=0;//主管填写完成
	
	public static final int ONE=1;//主管提交待稽核
	
	public static final int TWO=2;//稽核提交待复核
	
	public static final int THREE=3;//复核完成

}

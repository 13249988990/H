package com.foxlink.mes.service.impl;

import javax.persistence.Column;

import org.springframework.stereotype.Service;

import com.foxlink.mes.bean.PerformanceRecords;
import com.foxlink.mes.service.PerformanceRecordsService;
import com.foxlink.utils.SqlText;
@Service
public class PerformanceRecordsServiceBean extends BaseServiceBean<PerformanceRecords> implements PerformanceRecordsService{
	
	
	/*private Integer userId;//用户id
	private String userName;//用户名称
	private Integer year;//考核年份
	private Integer numVaue;//其它值，年度{0}、半年考核值{0,1}、季度值{0,1,2,3}、月份值{0,1,2 ...,10,11}
	private Integer type;//考核类型{0:"年度",1:"上半年，下半年"，2："季度考核",3:"月份考核"}
	@ov
*/	@Override
	public boolean userIsFinish(int userId,int type,int year,int numVlaue){
		
		return getCount(new SqlText("where o.userId=? and o.type=? and o.year=? and o.numVaue=?", userId,type,year,numVlaue))>0;
	}

}

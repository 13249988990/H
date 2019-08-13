package com.foxlink.mes.service;

import java.util.List;
import java.util.Map;

import com.foxlink.mes.bean.PerformanceRecords;

public interface PerformanceRecordsService extends BaseService<PerformanceRecords>{

	boolean userIsFinish(int userId, int type, int year, int numVlaue);

	String saveCore(int type, int year, int otherInfo, int[] ids, int[] cores, int userId,int departmentId,int basicMoney);

	boolean curretUserIsFinish(int type, int year, int otherInfo, int userId);
	
	int getCheckState(int userId, int type, int year, int numVlaue);

	int getCheckTotalCore(int userId, int type, int year, int numVlaue);

	String commitRecords(int userId, int type, int year, int numVlaue, int[] ids) throws Exception;

	String getDepartmentState(int departmentId, int year, int type, int otherInfo);

	List<Map<String, Object>> getDepartmentPerformanceInfo(int type, int year, int otherInfo, int departmentId);

}

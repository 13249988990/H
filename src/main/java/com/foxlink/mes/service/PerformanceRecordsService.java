package com.foxlink.mes.service;

import com.foxlink.mes.bean.PerformanceRecords;

public interface PerformanceRecordsService extends BaseService<PerformanceRecords>{

	boolean userIsFinish(int userId, int type, int year, int numVlaue);

	String saveCore(int type, int year, int otherInfo, int[] ids, int[] cores, int userId,int departmentId,int basicMoney);

	boolean curretUserIsFinish(int type, int year, int otherInfo, int userId);

}

package com.foxlink.mes.service;

import com.foxlink.mes.bean.PerformanceRecords;

public interface PerformanceRecordsService extends BaseService<PerformanceRecords>{

	boolean userIsFinish(int userId, int type, int year, int numVlaue);

}

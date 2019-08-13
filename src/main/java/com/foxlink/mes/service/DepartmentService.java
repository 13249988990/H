package com.foxlink.mes.service;

import java.util.List;
import java.util.Map;

import com.foxlink.mes.bean.Department;

public interface DepartmentService extends BaseService<Department>{

	void allowcationUser(Integer departmentId, Integer[] userIds);

	boolean isLeader(String accountId);

	List<Department> getPerformanceDepartmentList(String accountId);

	List<Map<String, Object>> getPerformanceUserAndState(Integer departmentId, int type, int year, int numValue);

	boolean checkIsFinish(int departmentId, int type, int year, int otherInfo);

	int getDepartmentStateForCurrentUser(int userId);

	List<Map<String, Object>> getDepartmentsRecords(int type, int year, int otherInfo);

}

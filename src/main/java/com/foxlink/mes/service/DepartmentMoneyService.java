package com.foxlink.mes.service;

import com.foxlink.mes.bean.DepartmentMoney;

public interface DepartmentMoneyService extends BaseService<DepartmentMoney>{

	String saveMoney(int type, int year, int otherInfo, int[] ids, int[] moneys) throws Exception;

}

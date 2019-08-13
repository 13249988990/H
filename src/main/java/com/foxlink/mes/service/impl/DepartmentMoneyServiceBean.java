package com.foxlink.mes.service.impl;



import org.springframework.stereotype.Service;

import com.foxlink.mes.bean.DepartmentMoney;
import com.foxlink.mes.service.DepartmentMoneyService;
import com.foxlink.utils.SqlText;

@Service
//@Transactional
public class DepartmentMoneyServiceBean extends BaseServiceBean<DepartmentMoney> implements DepartmentMoneyService{
	
	@Override
	@org.springframework.transaction.annotation.Transactional(rollbackFor=Exception.class)
	public String saveMoney(int type ,int year ,int otherInfo,int [] ids,int [] moneys) throws Exception{
		String message=null;
		for (int i = 0; i < moneys.length; i++) {
			DepartmentMoney departmentMoney = get(new SqlText("where o.type=? and o.year=? and o.numValue=? and o.departmentId=?", type,year,otherInfo,ids[i]));
		
				if(departmentMoney!=null){
					message="同类型的部门金额设置已存档，请勿重复设置";
					
						throw new Exception("");
					
				}else{
					save(new DepartmentMoney(ids[i], type, year, otherInfo, moneys[i]));
				}
			
		}
		message=message==null?"金额设置已完成":message;
		return message;
	}
	@Override
	public boolean departmentMoneyIsSet(int type ,int year ,int otherInfo){
		return getCount(new SqlText("where o.type=? and o.year=? and o.numValue=?", type,year,otherInfo))>0;
	}
}

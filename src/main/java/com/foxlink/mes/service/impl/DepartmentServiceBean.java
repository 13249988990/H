package com.foxlink.mes.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.foxlink.mes.bean.Admin;
import com.foxlink.mes.bean.Department;
import com.foxlink.mes.service.AdminService;
import com.foxlink.mes.service.DepartmentService;
@Service
public class DepartmentServiceBean extends BaseServiceBean<Department> implements DepartmentService {
	@Resource
	AdminService adminService;
	Logger log = Logger.getLogger(DepartmentServiceBean.class);
	@Override
	@SuppressWarnings("all")
	public void allowcationUser(Integer departmentId,Integer ...userIds){
		Department department = find(departmentId);
		department.setAdminList(null);
		update(department);
		log.error("清空了部门下面所有人员");
		List<Admin> adminList= new ArrayList<Admin>();
		for (int i = 0; i < userIds.length; i++) {
			adminList.add(adminService.find(userIds[i]));
		}
		department.setAdminList(adminList);
		saveOrUpdate(department);
		log.error("新增了很多用户");
	}
	
}

package com.foxlink.mes.service.impl;

import org.springframework.stereotype.Service;

import com.foxlink.mes.bean.Admin;
import com.foxlink.mes.service.AdminService;
import com.foxlink.utils.SqlText;
@Service
public class AdminServiceBean  extends BaseServiceBean<Admin> implements AdminService{

	@Override
	public Admin login(String username, String password) {
		return get(new SqlText("where o.username=? and o.password=?", username, password));
	}

	@Override
	public Admin findByUsername(String username) {
		return get(new SqlText("where o.username=?", username));
	}

}

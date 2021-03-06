package com.foxlink.mes.service;

import com.foxlink.mes.bean.Admin;


public interface AdminService extends BaseService<Admin> {

	Admin login(String username, String valueOf);

	Admin findByUsername(String username);

	boolean changeState(String state, Integer userAccount);

	void deleteUser(Integer id) throws Exception;

}

package com.foxlink.mes.service.impl;

import org.springframework.stereotype.Service;

import com.foxlink.mes.Interface.LoginState;
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
	/**
	 * 
	 * @param state “启用” or “禁用”
	 * @param userAccount 账号Id
	 * @return 修改账号状态
	 */
	@Override
	public boolean  changeState(String state,Integer userAccount){
		int result = state.equals("启用")?LoginState.DISAABLE:LoginState.ENABLE;
		return getJdbcTemplate().update("update table_admin set col_state=? where col_id=?",result,userAccount)==1;
	}

}

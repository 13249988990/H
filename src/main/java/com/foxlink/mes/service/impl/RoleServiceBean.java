package com.foxlink.mes.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.foxlink.mes.bean.Role;
import com.foxlink.mes.service.RoleService;
import com.foxlink.utils.SqlText;
@Service
public class RoleServiceBean extends BaseServiceBean<Role> implements RoleService {

	@Override
	public boolean isSystem(Integer id) {
		return getCount(new SqlText("where o.isSystem=? and o.id=?", true, id)) > 0;
	}

	@Override
	public List<Role> getRoles(Boolean isSystem) {
		return getList(new SqlText("where o.isSystem=?", isSystem));
	}

	

}

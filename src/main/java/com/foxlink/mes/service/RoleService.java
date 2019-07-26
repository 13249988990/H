package com.foxlink.mes.service;

import java.util.List;

import com.foxlink.mes.bean.Role;

public interface RoleService extends BaseService<Role>{

	boolean isSystem(Integer id);

	List<Role> getRoles(Boolean isSystem);


}

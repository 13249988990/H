package com.foxlink.mes.web.ctrl;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.foxlink.mes.bean.Role;
import com.foxlink.mes.service.RoleService;
import com.foxlink.utils.SystemConfig;

@Controller
@RequestMapping("/role")
public class RoleCtrl {
	@Resource
	private RoleService roleService;
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String list(ModelMap model){
		model.addAttribute("roles", roleService.getList());
		return "/role/list";
	}
	
	@RequestMapping(value="toAdd",method=RequestMethod.GET)
	public String add(ModelMap model){
		model.addAttribute("authorities", SystemConfig.getAuthorities());		
		return "/role/add";
	}
	
	
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public String save(Role role, ModelMap model){
		roleService.save(role);
		model.addAttribute("message", "角色添加成功!");
		model.addAttribute("returnUrl", "/role/list.html");
		return "/share/message";
	}
	
	@RequestMapping(value="toUpdate",method=RequestMethod.GET)
	public String edit(Integer id, ModelMap model){
		model.addAttribute("role", roleService.find(id));
		model.addAttribute("authorities", SystemConfig.getAuthorities());		
		return "/role/edit";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update(Role role, ModelMap model){
		roleService.update(role);
		model.addAttribute("message", "角色更新成功!");
		model.addAttribute("returnUrl", "/role/list.html");
		return "/share/message";
	}
	
	@RequestMapping(value="delete",method=RequestMethod.GET)
	public String delete(Integer id, ModelMap model){
		Role role = roleService.find(id);
		if (role.getIsSystem()) {
			model.addAttribute("message", "不能刪除系統管理!");
		}else if (role.getAdmins()!=null) {
			model.addAttribute("message", "此角色已使用,不能刪除!");
		}else{
			roleService.delete(id);
			model.addAttribute("message", "角色刪除成功!");
		}
		model.addAttribute("returnUrl", "/role/list.html");
		return "/share/message";
	}
}

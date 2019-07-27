package com.foxlink.mes.web.ctrl;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.foxlink.mes.Interface.LoginState;
import com.foxlink.mes.bean.Admin;
import com.foxlink.mes.bean.Role;
import com.foxlink.mes.service.AdminService;
import com.foxlink.mes.service.RoleService;
import com.foxlink.utils.Md5Utils;
import com.foxlink.utils.WebUtil;

@Controller
@RequestMapping("/admin")
public class AdminCtrl {
	@Resource
	private AdminService adminService;
	@Resource
	private RoleService roleService;
	Logger log = Logger.getLogger(AdminCtrl.class);
	@RequestMapping(value="login")
	public String login(String username, String password, HttpServletRequest request){
		log.error(username+"--"+password);
		
		if (username == null || "".equals(username.trim())) {
			return "/admin/login";
		}
		if (password == null || "".equals(password.trim())) {
			return "/admin/login";
		}
		log.error("开始查找用户");
		Admin admin = adminService.findByUsername(username);
		if (admin == null) {
			request.setAttribute("message", "用戶名有誤");
			return "/admin/login";
		}else if(admin.getState()==LoginState.DISAABLE){
			request.setAttribute("message", "用户已被禁用");
			return "/admin/login";
		}else if(!Md5Utils.compareValue(password, admin.getPassword()))
		{
			request.setAttribute("message", "密碼有誤");
			return "/admin/login";
		}
		else{
			admin.setLoginTime(new Date().getTime()/1000);
			admin.setLoginIp(WebUtil.getIP(request));
			adminService.update(admin);
			request.getSession().setAttribute(Admin.USERNAME, admin);
			request.setAttribute("message", "登錄成功!");
			request.setAttribute("returnUrl", request.getParameter("returnUrl"));
			return "/share/message";
			
		}
		
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request){
		request.getSession().invalidate();
		request.setAttribute("message", "退出成功!");
		request.setAttribute("returnUrl", "/index.html");
		return "/share/message";
	}
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String list(ModelMap model){
		model.addAttribute("admins", adminService.getList());
		return "/admin/list";
	}
	
	@RequestMapping(value="/toAdd",method=RequestMethod.GET)
	public String add(ModelMap model){
		model.addAttribute("roles", roleService.getList());
		return "/admin/add";
	}
	
	@RequestMapping(value="save",method=RequestMethod.POST)
	public String save(Admin admin,String password, Integer[] roleIds, ModelMap model){
		Set<Role> roles = buildRoles(roleIds);
		admin.setRoles(roles);
		admin.setPassword(Md5Utils.encryptString(password));
		adminService.save(admin);
		model.addAttribute("message", "用戶添加成功!");
		model.addAttribute("returnUrl", "/admin/list.html");
		return "/share/message";
	}
	
	@RequestMapping(value="/toUpdate",method=RequestMethod.GET)
	public String edit(Integer id, ModelMap model){
		model.addAttribute("admin", adminService.find(id));
		model.addAttribute("roles", roleService.getList());
		for (Role role : roleService.getList()) {
			System.out.println("name;" +role.getName());
		}
		return "/admin/edit";
	}
	@RequestMapping(value="update",method=RequestMethod.POST)
	public String update(Admin admin, Integer[] roleIds, ModelMap model){
		Set<Role> roles = buildRoles(roleIds);
		log.error(admin.toString());
		//Admin admin = adminService.find(adminId);
		admin.setRoles(roles);
		if (admin.getPassword().length()<15) {
			admin.setPassword(Md5Utils.encryptString(admin.getPassword()));
		}
		adminService.update(admin);
		model.addAttribute("message", "用戶更新成功!");
		model.addAttribute("returnUrl", "/admin/list.html");
		return "/share/message";
	}
	
	@RequestMapping(value="/delete",method=RequestMethod.GET)
	public String delete(Integer id, ModelMap model){
		adminService.delete(id);
		model.addAttribute("message", "用戶刪除成功!");
		model.addAttribute("returnUrl", "/admin/list.html");
		return "/share/message";
	}
	

	private Set<Role> buildRoles(Integer[] roleIds) {
		if (roleIds != null && roleIds.length > 0) {
			Set<Role> roles = new HashSet<Role>();
			for (Integer id : roleIds) {
				roles.add(new Role(id));
			}
			return roles;
		}
		return null;
	}
	@RequestMapping("changeState")
	public ModelAndView changeState(String state,Integer accountId){
		ModelAndView mav = new ModelAndView("/admin/list");
		adminService.changeState(state, accountId);
		mav.addObject("admins", adminService.getList());
		
		return mav;
	}
}

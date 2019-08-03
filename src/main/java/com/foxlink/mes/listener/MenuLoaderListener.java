package com.foxlink.mes.listener;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.PropertySources;
import org.springframework.core.env.Environment;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.foxlink.mes.Interface.LoginState;
import com.foxlink.mes.bean.Admin;
import com.foxlink.mes.bean.Department;
import com.foxlink.mes.bean.Role;
import com.foxlink.mes.service.DepartmentService;
import com.foxlink.mes.service.RoleService;
import com.foxlink.utils.Md5Utils;
import com.foxlink.utils.SystemConfig;
@Configuration
@PropertySources({
	@PropertySource({"classpath:model.properties"}),
	@PropertySource({"classpath:authorities.properties"})
})
//@PropertySource(value={"classpath:model.properties"})//加载配置文件，加载到org.springframework.core.env.Environment;
//取得的时候可以application。getbean(Environment。class)
public class MenuLoaderListener implements ServletContextListener {
	Logger log = Logger.getLogger(MenuLoaderListener.class);
	
	

	@Override
	public void contextDestroyed(ServletContextEvent event) {
		event.getServletContext().removeAttribute("routes");
	}
	
	@Override
	public void contextInitialized(ServletContextEvent event) {
		
		

		ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(event.getServletContext());
		//RouteService routeService = (RouteService)context.getBean("routeServiceBean");
		//这里初始化用户和权限
		
		DepartmentService departmentService = (DepartmentService) context.getBean(DepartmentService.class);
		RoleService roleService =  context.getBean(RoleService.class);
		Environment env =(Environment) context.getBean(Environment.class);
		log.warn("---初始化开始----------------------------------------");
		if (departmentService.getCount(null)>0) {
			log.warn("---部门表不为空，不启用系统管理员初始化");
		}else{
			log.error("---开始初始化管理员用户及权限");
			log.error("---初始化管理员信息{username:Admin,password:1111}");
			log.error("---请及时修改管理员密码");
			 Iterator<Entry<Object, Object>> iterator = SystemConfig.getAuthorities().iterator();
			 log.error("---开始初始化角色权限对象");
			 Role role= new Role("系统管理员","最高权限管理员",true);
			 List<String> authList=new ArrayList<String>();
			 log.warn("---读取设定角色权限中");
			while (iterator.hasNext()) {
				
				Entry<Object, Object> it = iterator.next();
				authList.add((String)it.getKey());
				
			}
			role.setAuthorities(authList);
			log.error("---开始保存角色及角色权限");
			roleService.save(role);
			Set<Role> roleSet = new HashSet<>();
			roleSet.add(role);
			log.warn("---开始存入管理员信息");
			Admin admin = new Admin("Admin","1111","管理员","系统管理员","test@163.com",LoginState.ENABLE,roleSet);
			Admin user = new Admin("User","1111","管理员","系统管理员","test@163.com",LoginState.ENABLE,roleSet);
			admin.setPassword(Md5Utils.encryptString("1111"));
			user.setPassword(Md5Utils.encryptString("1111"));
			List<Admin> adminList = new ArrayList<>();
			adminList.add(admin);
			adminList.add(user);
			Department department = new Department("1001", "管理员部", "AK47",adminList );
				departmentService.save(department);
		}
		log.warn("---初始化结束----------------------------------------");
		String projectName = env.getProperty("name");
		
		
		log.error("-----------项目名称："+projectName+"--------");
		event.getServletContext().setAttribute("modelName", SystemConfig.geMachineName("name"));
		//log.error(SystemConfig.geMachineName("name"));
		
	}

}

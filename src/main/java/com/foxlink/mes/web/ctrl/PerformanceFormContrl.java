package com.foxlink.mes.web.ctrl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.foxlink.mes.Interface.LoginState;
import com.foxlink.mes.Interface.PerformanceType;
import com.foxlink.mes.bean.Admin;
import com.foxlink.mes.bean.Department;
import com.foxlink.mes.service.AdminService;
import com.foxlink.mes.service.DepartmentService;
import com.foxlink.utils.WebUtil;

@Controller
@RequestMapping("/performance")
public class PerformanceFormContrl {
	Logger log = Logger.getLogger(PerformanceFormContrl.class);
	@Resource
	private AdminService adminService;
	@Resource
	private DepartmentService departmentService;
	@RequestMapping("selectType")
	public ModelAndView selectType(HttpServletRequest request,@RequestParam(name="departmentId",defaultValue="100")int departmentId,
			@RequestParam(name="type",defaultValue="100")int type,@RequestParam(name="year",defaultValue="100")int year,
			@RequestParam(name="otherInfo",defaultValue="0")int otherInfo){
		ModelAndView mv= new ModelAndView("performance/selectType");
		String message=null;
		//判断用户是否为部门主管账号
		Admin admin = WebUtil.getAdmin(request);
		if(admin==null){
			mv.setViewName("admin/login");
			return mv;
		}
		log.error("current user accountName is "+admin.getUsername());
		log.error(departmentService.isLeader(admin.getUsername()));
		if(!departmentService.isLeader(admin.getUsername())){
			message="当前账号没有绩效考核权限";
		}else{
			List<Department> departments = departmentService.getPerformanceDepartmentList(admin.getUsername());
			mv.addObject("departments", departments);
		}
		if(departmentId!=100){
			//选择部门、考核类型等信息后执行这里
			List<Map<String, Object>> userInfos = departmentService.getPerformanceUserAndState(departmentId, type, year, otherInfo);
			mv.addObject("userInfos", userInfos);
			mv.addObject("department", departmentService.find(departmentId));
			mv.setViewName("performance/showusers");
			
		}
		mv.addObject("message", message);
		return mv;
	}
	@RequestMapping("getContentByType")
	public void getContentByType(int type,HttpServletResponse response) throws IOException{
		log.error("处理中...");
		ServletOutputStream out = response.getOutputStream();
		String halfayear[]={"上半年","下半年"};
		String quarter[]={"第一季度","第二季度","第三季度","第四季度"};
		String month[]={"1","2","3","4","5","6","7","8","9","10","11","12"};
		List<Map<String,Object>> commonList=new ArrayList<>();
		switch (type) {
		case PerformanceType.YEAR:
			commonList.clear();
			Calendar cal = Calendar.getInstance();
			cal.setTime(new Date());
			//commonList.add(String.format("%s", cal.get(Calendar.YEAR)-1));
			//commonList.add(String.format("%s", cal.get(Calendar.YEAR)));
			//commonList.add(String.format("%s", cal.get(Calendar.YEAR)+1));
			break;
		case PerformanceType.HALFAYEAR:
			commonList.clear();
			for (int i = 0; i < halfayear.length; i++) {
				Map<String , Object> map = new HashMap<>();
				map.put("id", halfayear[i]);
				commonList.add(map);
			}
			break;
		case PerformanceType.QUARTER:
			commonList.clear();
			for (int i = 0; i < quarter.length; i++) {
				Map<String , Object> map = new HashMap<>();
				map.put("id", quarter[i]);
				commonList.add(map);
			}
			break;
		case PerformanceType.MONTH:
			commonList.clear();
			for (int i = 0; i < month.length; i++) {
				Map<String , Object> map = new HashMap<>();
				map.put("id", month[i]);
				commonList.add(map);
			}
			break;
		default:
			break;
		}
		ObjectMapper mapper = new ObjectMapper();
		out.write(mapper.writeValueAsString(commonList).getBytes("UTF-8"));
		out.flush();
		out.close();
		
	}
}

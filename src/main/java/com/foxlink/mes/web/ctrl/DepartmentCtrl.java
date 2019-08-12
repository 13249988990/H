package com.foxlink.mes.web.ctrl;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.foxlink.mes.Interface.DepartmentType;
import com.foxlink.mes.bean.Department;
import com.foxlink.mes.service.AdminService;
import com.foxlink.mes.service.DepartmentMoneyService;
import com.foxlink.mes.service.DepartmentService;
import com.foxlink.utils.SqlText;

@Controller
@RequestMapping("/department")
public class DepartmentCtrl {
	@Resource
	private DepartmentService departmentService;
	@Resource
	private AdminService adminService;
	Logger log = Logger.getLogger(Department.class);
	@Resource
	DepartmentMoneyService departmentMoneyService;
	@RequestMapping("list")
	public ModelAndView list(){
		ModelAndView mv = new ModelAndView("/department/list");
		mv.addObject("Records", departmentService.getList("order by o.id asc"));
		return mv;
		
	}
	@RequestMapping("updateDepartment")
	public ModelAndView updateDepartment(Department department){
		log.error("in .......");
		ModelAndView mv = new ModelAndView();
		if (department!=null&&department.getId()!=null&&department.getDepartmentName()==null) {
			//跳转到edit页面
			department=departmentService.find(department.getId());
			log.error("跳转修改部门");
			mv.addObject("department", department);
			log.error(""+department.getId());
			mv.setViewName("department/edit");
		}else {
			
			log.error("修改中"+department.getId());
			try {
				Department temp = departmentService.find(department.getId());
				department.setAdminList(temp.getAdminList());
				departmentService.update(department);
			} catch (Exception e) {
				// TODO: handle exception
				mv.addObject("message", "更新失败 "+e.getLocalizedMessage());
			}
			mv.addObject("Records", departmentService.getList("order by o.id asc"));
			mv.setViewName("department/list");
			log.error("修改部门提交");
		}
		
		return mv;
	}
	@RequestMapping("deleteDepartment/{id}")
	public ModelAndView deleteDepartment(@PathVariable Integer id){
		ModelAndView mv = new ModelAndView("department/list");
		departmentService.delete(id);
		mv.addObject("Records", departmentService.getList("order by o.id asc"));
		mv.addObject("message", "删除成功");
		return mv;
	}
	@RequestMapping("saveDepartment")
	public ModelAndView saveDepartment(Department department){
		ModelAndView mv = new ModelAndView("department/add");
		if(department==null||department.getDepartmentName()==null){
			
		}else{
			try {
				departmentService.save(department);
				mv.addObject("message", "保存成功");
				mv.setViewName("department/list");
			} catch (Exception e) {
				// TODO: handle exception
				mv.addObject("message", "保存失败 \n\r"+e.getMessage());
			}
		}
		mv.addObject("Records", departmentService.getList("order by o.id asc"));
		return mv;
		
	}
	//分配用户到部门
	@RequestMapping("allowcationUser")
	
	public ModelAndView allowcationUser(@RequestParam("id") Integer id,Integer... userIds){
		ModelAndView mv = new ModelAndView("department/allowcationUser");
		Department department = departmentService.find(id);
		if(id!=null&&userIds==null){
			
			mv.addObject("department", department);
			mv.addObject("userList", adminService.getList("order by o.id asc"));
		}else{
			departmentService.allowcationUser(id, userIds);
			return list();
		}
		
		return mv;
		
	}
	//@LoginCheck(valueUrl = "/department/setMoney.html")
	@RequestMapping("setMoney")
	public ModelAndView setMoney(HttpServletRequest request,
			@RequestParam(name="type",defaultValue="100")int type,
			@RequestParam(name="year",defaultValue="100")int year,
			@RequestParam(name="otherInfo",defaultValue="0")int otherInfo,
			int [] ids,int[] moneys) throws Exception{
		ModelAndView mav = new ModelAndView("department/selectType");
		if (year!=100) {
			mav.setViewName("department/setMoney");
			mav.addObject("departments", departmentService.getList(new SqlText("where o.type=?", DepartmentType.ONE), "order by o.id"));
		}
		if(year!=100&&ids!=null&&ids.length>0){
			log.error("执行保存部门金额任务");
			String message = null;
			try {
				message=departmentMoneyService.saveMoney(type, year, otherInfo, ids, moneys);
			} catch (Exception e) {
				// TODO: handle exception
				message="保存异常";
			}
			mav.addObject("message",message );
		}
		mav.addObject("year", year);
		mav.addObject("type", type);
		mav.addObject("otherInfo", otherInfo);
		return mav;
	}
	
}

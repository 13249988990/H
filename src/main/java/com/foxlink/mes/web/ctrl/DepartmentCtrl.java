package com.foxlink.mes.web.ctrl;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.foxlink.mes.service.DepartmentService;

@Controller
@RequestMapping("/department")
public class DepartmentCtrl {
	@Resource
	private DepartmentService departmentService;
	
	@RequestMapping("list")
	public ModelAndView list(){
		ModelAndView mv = new ModelAndView("/department/list");
		mv.addObject("Records", departmentService.getList("order by o.id asc"));
		return mv;
		
	}
}

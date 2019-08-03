package com.foxlink.mes.web.ctrl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.foxlink.mes.Interface.LoginState;
import com.foxlink.mes.Interface.PerformanceType;

@Controller
@RequestMapping("/performance")
public class PerformanceFormContrl {
	Logger log = Logger.getLogger(PerformanceFormContrl.class);
	@RequestMapping("selectType")
	public ModelAndView selectType(){
		ModelAndView mv= new ModelAndView("performance/selectType");
		
		return mv;
	}
	@RequestMapping("getContentByType")
	public void getContentByType(int type,HttpServletResponse response) throws IOException{
		log.error("处理中...");
		ServletOutputStream out = response.getOutputStream();
		String halfayear[]={"上半年","下半年"};
		String quarter[]={"第一季度","第二季度","第三季度","第四季度"};
		String month[]={"1","2","3","4","5","6","7","8","9","10","11","12"};
		List<String> commonList=new ArrayList<String>();
		switch (type) {
		case PerformanceType.YEAR:
			commonList.clear();
			Calendar cal = Calendar.getInstance();
			cal.setTime(new Date());
			commonList.add(String.format("%s", cal.get(Calendar.YEAR)-1));
			commonList.add(String.format("%s", cal.get(Calendar.YEAR)));
			commonList.add(String.format("%s", cal.get(Calendar.YEAR)+1));
			break;
		case PerformanceType.HALFAYEAR:
			commonList.clear();
			for (int i = 0; i < halfayear.length; i++) {
				commonList.add(halfayear[i]);
			}
			break;
		case PerformanceType.QUARTER:
			commonList.clear();
			for (int i = 0; i < quarter.length; i++) {
				commonList.add(quarter[i]);
			}
			break;
		case PerformanceType.MONTH:
			commonList.clear();
			for (int i = 0; i < month.length; i++) {
				commonList.add(month[i]);
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

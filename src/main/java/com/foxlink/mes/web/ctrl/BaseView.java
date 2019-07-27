package com.foxlink.mes.web.ctrl;

import org.springframework.web.servlet.ModelAndView;

public class BaseView {

	public  static ModelAndView createMessageView(String message, String url){
		ModelAndView mv = new ModelAndView("share/message");
		mv.addObject("message", message);
		mv.addObject("returnUrl", url);
		return mv;
	}
	
}

package com.foxlink.mes.web.ctrl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WelcomeCtrl {
	@RequestMapping("/index")
	public String index(){
		
		return "index";
	}

}

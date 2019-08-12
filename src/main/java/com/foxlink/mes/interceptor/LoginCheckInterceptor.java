package com.foxlink.mes.interceptor;

import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.foxlink.mes.annotation.LoginCheck;
import com.foxlink.mes.bean.Admin;
import com.foxlink.mes.bean.Role;
import com.foxlink.utils.WebUtil;

public class LoginCheckInterceptor implements HandlerInterceptor{
	Logger log = Logger.getLogger(LoginCheckInterceptor.class);
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		//log.error("拦截器 logininterceptor 已经拦截。。。");
		if(handler instanceof HandlerMethod){
			HandlerMethod handlerMethod = (HandlerMethod) handler;
			LoginCheck annotation = handlerMethod.getMethodAnnotation(LoginCheck.class);
			if(annotation==null){
				//log.error("未找到注解，直接通过");
				return true;
			}else{
				Admin admin = WebUtil.getAdmin(request);
				if(admin==null){
					request.getRequestDispatcher("/admin/login.html").forward(request, response);
				}else{
					Iterator<Role> iterator = admin.getRoles().iterator();
					boolean result=false;
					while (iterator.hasNext()&&result==false) {
						Role next = iterator.next();
						for (int i = 0; i < next.getAuthorities().size(); i++) {
							
							if(next.getAuthorities().get(i).equals(annotation.valueUrl())){
								log.error(next.getAuthorities().get(i));
								result=true;
								break;
							}
						}
						
						 if (result) {
							log.error("有权限");
							return true;
						}else{
							log.error("无权限");
							request.setAttribute("message", admin.getUsername()+" 账号无权限访问该url: "+annotation.valueUrl());
							request.getRequestDispatcher("/admin/login.html").forward(request, response);
							
							return false;
						}
					}
				}
				//log.error("打印后通过。");
			}
			
		}
		return false;
		
		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		//log.error("拦截器 logininterceptor 已经拦截1。。。");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		//.error("拦截器 logininterceptor 已经拦截2。。。");
		
	}

}

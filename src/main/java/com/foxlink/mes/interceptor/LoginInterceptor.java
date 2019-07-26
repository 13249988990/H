package com.foxlink.mes.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.foxlink.mes.bean.Admin;
import com.foxlink.mes.bean.Role;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	private static final String LOGIN_URL="/admin/login.html";
	private String loginUrl = LOGIN_URL;
	
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		Admin admin = (Admin)request.getSession().getAttribute(Admin.USERNAME);
		String message = null;
		if (admin!=null) {
			String requestUrl = request.getRequestURI();
			if ("GET".equals(request.getMethod()) && requestUrl.indexOf("?")>0) {
				requestUrl = requestUrl.substring(requestUrl.indexOf("?"));
			}
			for (Role role : admin.getRoles()) {
				for (String  url : role.getAuthorities()) {
					if (requestUrl.contains(url)) {
						return true;
					}
				}
			}
			message = "對不起!您沒有此權限!";
		}else{
			message = "請先登錄!";
			
		}
		request.setAttribute("message", message);
		request.setAttribute("returnUrl", request.getRequestURI().replaceFirst(request.getContextPath(), ""));
		request.getRequestDispatcher(loginUrl).forward(request, response);
		return false;
		 
	}

	public String getLoginUrl() {
		return loginUrl;
	}

	public void setLoginUrl(String loginUrl) {
		this.loginUrl = loginUrl;
	}
	
	
}

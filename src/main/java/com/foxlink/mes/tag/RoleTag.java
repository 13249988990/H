package com.foxlink.mes.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import com.foxlink.mes.bean.Admin;
import com.foxlink.mes.bean.Role;

public class RoleTag extends TagSupport {
	private static final long serialVersionUID = 1L;
	private String url;
	
	@Override
	public int doStartTag() throws JspException {
		Admin admin = (Admin)this.pageContext.getSession().getAttribute(Admin.USERNAME);
		if (admin!=null) {
			for (Role role : admin.getRoles()) {
				for (String  requestUrl : role.getAuthorities()) {
					if (url.equals(requestUrl)) {
						return EVAL_BODY_INCLUDE;
					}
				}
			}
		}
		return SKIP_BODY;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
}

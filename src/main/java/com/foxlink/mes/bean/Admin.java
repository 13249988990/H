package com.foxlink.mes.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.apache.log4j.Logger;

import com.foxlink.mes.Interface.LoginState;

@Entity
@Table(name="table_admin",uniqueConstraints={@UniqueConstraint(columnNames = { "col_username" })})
public class Admin implements Serializable{
	private static final long serialVersionUID = 1L;
	public static final String USERNAME = "dumpling_user";
	Logger log = Logger.getLogger(Admin.class);
	private Integer id;//id
	private String username;//工号
	private String password;//密码
	private String department;
	private String realName;//中文名
	

	private String job;//职务
	private String email;//邮箱
	private int state=LoginState.ENABLE;//账号状态
	private Long loginTime;//登录时间，时间戳
	private String loginIp;//登录IP
	private List<Department> departments=new ArrayList<Department>();
	 private Set<Role> roles = new HashSet<Role>();
	
	 @Id @GeneratedValue
	 @Column(name="col_id")
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name="col_username",length=20,nullable=false)
	 public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name="col_password",length=100)
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		log.error("调用了setpassword方法？");
		this.password = password;
	}
	
	
	
	public String getDepartment() {
		String dpt="";
		for (int i = 0; i < departments.size(); i++) {
			dpt+=departments.get(i).getDepartmentName()+",";
		}
		return dpt;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	@ManyToMany(fetch=FetchType.EAGER)
	@JoinTable(name="table_admin_role",joinColumns={@JoinColumn(name="col_admin_id")},inverseJoinColumns={@JoinColumn(name="col_role_id")})
	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Admin other = (Admin) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	public Admin(String username, String password, String department, Set<Role> roles) {
		//super();
		this.username = username;
		this.password =password;// Md5Utils.encryptString(password);
		log.error("加密后-->"+this.password);
		this.department = department;
		this.roles = roles;
	}
	
	public Admin(String username, String password, String realName, String job, String email, int state,
			Set<Role> roles) {
		//super();
		this.username = username;
		this.password = password;
		this.realName = realName;
		this.job = job;
		this.email = email;
		this.state = state;
		this.roles = roles;
	}

	@Column(name="col_real_name")
	public String getRealName() {
		return realName;
	}
	
	public void setRealName(String realName) {
		this.realName = realName;
	}
	@Column(name="col_job_name")
	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}
	@Column(name="col_email")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	@Column(name="col_state")
	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}
	@Column(name="col_login_time")
	public Long getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(Long loginTime) {
		this.loginTime = loginTime;
	}
	@Column(name="col_login_ip")
	public String getLoginIp() {
		return loginIp;
	}

	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}
	public Admin() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Admin {id:" + id + ", username:" + username + ", password:" + password + ", department:" + department
				+ ", realName:" + realName + ", job:" + job + ", email:" + email + ", state:" + state + ", loginTime:"
				+ loginTime + ", loginIp:" + loginIp + ", roles:" + roles + "}";
	}
	@ManyToMany
	@JoinTable(name="table_department_user",joinColumns={@JoinColumn(name="col_user_id")},inverseJoinColumns={@JoinColumn(name="col_department_id")})
	public List<Department> getDepartments() {
		return departments;
	}

	public void setDepartments(List<Department> departments) {
		this.departments = departments;
	}
	
	
	
}

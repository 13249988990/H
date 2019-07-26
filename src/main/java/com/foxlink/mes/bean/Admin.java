package com.foxlink.mes.bean;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.foxlink.utils.Md5Utils;

@Entity
@Table(name="table_admin")
public class Admin implements Serializable{
	private static final long serialVersionUID = 1L;
	public static final String USERNAME = "dumpling_user";
	private Integer id;
	private String username;
	private String password;
	private String department;
	 private Set<Role> roles = new HashSet<Role>();
	//这里只是测试GIT功能，么有更新
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
		this.password = Md5Utils.encryptString(password);
	}
	
	
	
	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	@ManyToMany(fetch=FetchType.EAGER,cascade=CascadeType.ALL)
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
		super();
		this.username = username;
		this.password = Md5Utils.encryptString(password);
		this.department = department;
		this.roles = roles;
	}
	
}

package com.foxlink.mes.bean;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.TableGenerator;
@Entity
@Table(name="table_department")
public class Department {
	@Id
	@GeneratedValue(strategy = GenerationType.TABLE, generator = "ud")
	@TableGenerator(name = "ud",
			table = "hibernate_table",
			pkColumnName = "gen_pk",
			pkColumnValue = "2",
			valueColumnName = "gen_val",
			initialValue = 2,
			allocationSize = 5)
	@Column(name="col_id")
	private Integer id;//Id
	@Column(name="col_department_num")
	private String departmentNum;//部门代码
	@Column(name="col_department_name")
	private String departmentName;//部门名字
	@Column(name="col_leader_num")
	private String leaderNum; //部门领导
	@ManyToMany(cascade={CascadeType.ALL})
	@JoinTable(name="table_department_user")
	private List<Admin> adminList=new ArrayList<Admin>();
	@Override
	public String toString() {
		return "Department {id:" + id + ", departmentNum:" + departmentNum + ", departmentName:" + departmentName
				+ ", leaderNum:" + leaderNum + "}";
	}
	public Department(String departmentNum, String departmentName, String leaderNum, List<Admin> adminList) {
		super();
		this.departmentNum = departmentNum;
		this.departmentName = departmentName;
		this.leaderNum = leaderNum;
		this.adminList = adminList;
	}
	
	public Department() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDepartmentNum() {
		return departmentNum;
	}
	public void setDepartmentNum(String departmentNum) {
		this.departmentNum = departmentNum;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public String getLeaderNum() {
		return leaderNum;
	}
	public void setLeaderNum(String leaderNum) {
		this.leaderNum = leaderNum;
	}
	public List<Admin> getAdminList() {
		return adminList;
	}
	public void setAdminList(List<Admin> adminList) {
		this.adminList = adminList;
	}

	
}

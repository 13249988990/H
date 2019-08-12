package com.foxlink.mes.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.TableGenerator;
import javax.persistence.UniqueConstraint;

import com.foxlink.mes.Interface.DepartmentType;
@Entity
@Table(name="table_department",uniqueConstraints={@UniqueConstraint(columnNames="col_department_num")})
public class Department implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
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
	@Column(name="col_type")
	private int type=DepartmentType.ONE;
	
	@ManyToMany(cascade={CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH})
	@JoinTable(name="table_department_user",joinColumns=@JoinColumn(name="col_department_id",referencedColumnName="col_id"),inverseJoinColumns=@JoinColumn(name="col_user_id",referencedColumnName="col_id"))
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
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}

	
}

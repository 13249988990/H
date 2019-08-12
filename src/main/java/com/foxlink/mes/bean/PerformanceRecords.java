package com.foxlink.mes.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.TableGenerator;
@Entity
@Table(name="table_performance_records")
public class PerformanceRecords {
	
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
	@Column(name="col_user_id")
	private Integer userId;//用户id
	@Column(name="col_user_name")
	private String userName;//用户名称
	@Column(name="col_year")
	private Integer year;//考核年份
	@Column(name="col_num_value")
	private Integer numVaue;//其它值，年度{0}、半年考核值{0,1}、季度值{0,1,2,3}、月份值{0,1,2 ...,10,11}
	@Column(name="col_type")
	private Integer type;//考核类型{0:"年度",1:"上半年，下半年"，2："季度考核",3:"月份考核"}
	@Column(name="col_create_date")
	private long createDate;//考核时间
	@Column(name="col_total_core")
	private int totalCore=0;
	@Column(name="col_department_id")
	private int departmentId;
	@Column(name="col_state")
	
	private int state;//考核状态 {0:"主管填写完成",1:"稽核小组稽核完成",2"审核完成"}
	@Column(name="col_basic_money")
	private int basicMoney=0;
	public PerformanceRecords() {
		// TODO Auto-generated constructor stub
	}
	
	

	public PerformanceRecords(Integer userId, String userName, Integer year, Integer numVaue, Integer type,
			long createDate, int totalCore, int state,int departmentId,int basicMoney) {
		
		this.userId = userId;
		this.userName = userName;
		this.year = year;
		this.numVaue = numVaue;
		this.type = type;
		this.createDate = createDate;
		this.totalCore = totalCore;
		this.state = state;
		this.departmentId=departmentId;
		this.basicMoney=basicMoney;
	}



	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Integer getYear() {
		return year;
	}
	public void setYear(Integer year) {
		this.year = year;
	}
	public Integer getNumVaue() {
		return numVaue;
	}
	public void setNumVaue(Integer numVaue) {
		this.numVaue = numVaue;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public long getCreateDate() {
		return createDate;
	}
	public void setCreateDate(long createDate) {
		this.createDate = createDate;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "PerformanceRecords {id:" + id + ", userId:" + userId + ", userName:" + userName + ", year:" + year
				+ ", numVaue:" + numVaue + ", type:" + type + ", createDate:" + createDate + ", state:" + state + "}";
	}

	public int getTotalCore() {
		return totalCore;
	}

	public void setTotalCore(int totalCore) {
		this.totalCore = totalCore;
	}



	public int getDepartmentId() {
		return departmentId;
	}



	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}



	public int getBasicMoney() {
		return basicMoney;
	}



	public void setBasicMoney(int basicMoney) {
		this.basicMoney = basicMoney;
	}
	
	
	
	
}

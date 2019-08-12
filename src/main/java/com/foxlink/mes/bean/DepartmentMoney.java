package com.foxlink.mes.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.TableGenerator;
@Entity
@Table(name="table_department_money")
public class DepartmentMoney {
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
	private Integer id;
	@Column(name="col_departmentId")
	private int departmentId;
	@Column(name="col_type")
	private int type;
	@Column(name="col_year")
	private int year;
	@Column(name="col_num_value")
	private int numValue;
	@Column(name="col_money")
	private int money;
	
	public DepartmentMoney() {
		// TODO Auto-generated constructor stub
	}
	
	public DepartmentMoney(int departmentId, int type, int year, int numValue, int money) {
	
		this.departmentId = departmentId;
		this.type = type;
		this.year = year;
		this.numValue = numValue;
		this.money = money;
	}

	public int getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getNumValue() {
		return numValue;
	}
	public void setNumValue(int numValue) {
		this.numValue = numValue;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}

	@Override
	public String toString() {
		return "DepartmentMoney {id:" + id + ", departmentId:" + departmentId + ", type:" + type + ", year:" + year
				+ ", numValue:" + numValue + ", money:" + money + "}";
	}

}

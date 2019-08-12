package com.foxlink.mes.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.TableGenerator;
@Entity
@Table(name="table_performance_records_deatails")
public class PerformanceRecordsDetails {
	
	@Id
	@GeneratedValue(strategy = GenerationType.TABLE, generator = "ud")
	@TableGenerator(name = "ud",
			table = "hibernate_table",
			pkColumnName = "gen_pk",
			pkColumnValue = "2",
			valueColumnName = "gen_val",
			initialValue = 2,
			allocationSize = 5)
	@Column(name="col_detail_id")
	private Integer id;//Id
	@Column(name="col_performance_form_id")
	private int performanceFormId;//对应基础考核表细项Id
	@Column(name="col_detail_core")
	private int core;//细项分数
	@Column(name="col_performance_id")
	private int perforManceId;//考核记录id
	
	public PerformanceRecordsDetails() {
		// TODO Auto-generated constructor stub
	}
	
	public int getPerformanceFormId() {
		return performanceFormId;
	}
	public void setPerformanceFormId(int performanceFormId) {
		this.performanceFormId = performanceFormId;
	}
	public int getCore() {
		return core;
	}
	public void setCore(int core) {
		this.core = core;
	}
	public int getPerforManceId() {
		return perforManceId;
	}
	public void setPerforManceId(int perforManceId) {
		this.perforManceId = perforManceId;
	}

	public PerformanceRecordsDetails(int performanceFormId, int core, int perforManceId) {
		//super();
		this.performanceFormId = performanceFormId;
		this.core = core;
		this.perforManceId = perforManceId;
	}

	@Override
	public String toString() {
		return "PerformanceRecordsDetails {id:" + id + ", performanceFormId:" + performanceFormId + ", core:" + core
				+ ", perforManceId:" + perforManceId + "}";
	}
	
	
	
	
}

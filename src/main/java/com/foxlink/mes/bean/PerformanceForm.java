package com.foxlink.mes.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.TableGenerator;
@Entity
@Table(name="table_aduit_base")
public class PerformanceForm {
	
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
	@Column(name="col_job_name")
	private String jobName;//职位名称 
	@Column(name="col_form_name")
	private String formName;//表单号
	@Column(name="col_index")
	private int index;//顺序序号
	@Column(name="col_first_kpi")
	private String firstkpi;//一级指标
	@Column(name="col_second_kpi")
	private String secondkpi;//二级指标
	@Column(name="col_sign_core")
	private int signleCore;//分值
	@Column(name="col_core_standar",length=65536)
	private String coreStandard;//评分标准
	@Column(name="col_appraise_standard",length=65536)
	private String appraiseStandard;//评价指标值
	
	public PerformanceForm() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getJobName() {
		return jobName;
	}
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	public String getFormName() {
		return formName;
	}
	public void setFormName(String formName) {
		this.formName = formName;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public String getFirstkpi() {
		return firstkpi;
	}
	public void setFirstkpi(String firstkpi) {
		this.firstkpi = firstkpi;
	}
	public String getSecondkpi() {
		return secondkpi;
	}
	public void setSecondkpi(String secondkpi) {
		this.secondkpi = secondkpi;
	}
	public int getSignleCore() {
		return signleCore;
	}
	public void setSignleCore(int signleCore) {
		this.signleCore = signleCore;
	}
	public String getCoreStandard() {
		return coreStandard;
	}
	public void setCoreStandard(String coreStandard) {
		this.coreStandard = coreStandard;
	}
	public String getAppraiseStandard() {
		return appraiseStandard;
	}
	public void setAppraiseStandard(String appraiseStandard) {
		this.appraiseStandard = appraiseStandard;
	}




	@Override
	public String toString() {
		return "AduitForm {id:" + id + ", jobName:" + jobName + ", formName:" + formName + ", index:" + index
				+ ", firstkpi:" + firstkpi + ", secondkpi:" + secondkpi + ", signleCore:" + signleCore
				+ ", coreStandard:" + coreStandard + ", appraiseStandard:" + appraiseStandard + "}";
	}
	
	

}

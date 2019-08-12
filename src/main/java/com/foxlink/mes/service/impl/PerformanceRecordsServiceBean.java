package com.foxlink.mes.service.impl;

import java.util.Date;

import javax.annotation.Resource;
import javax.persistence.Column;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.foxlink.mes.Interface.RecordState;
import com.foxlink.mes.annotation.MethodInfo;
import com.foxlink.mes.bean.Admin;
import com.foxlink.mes.bean.PerformanceRecords;
import com.foxlink.mes.bean.PerformanceRecordsDetails;
import com.foxlink.mes.service.AdminService;
import com.foxlink.mes.service.PerformanceFormService;
import com.foxlink.mes.service.PerformanceRecordsDetailsService;
import com.foxlink.mes.service.PerformanceRecordsService;
import com.foxlink.utils.SqlText;
@Service
public class PerformanceRecordsServiceBean extends BaseServiceBean<PerformanceRecords> implements PerformanceRecordsService{
	
	
	@Resource
	PerformanceRecordsDetailsService performanceRecordsDetailsService;
	@Resource
	AdminService adminService;
	@Resource
	PerformanceFormService performanceFormService;
	/*private Integer userId;//用户id
	private String userName;//用户名称
	private Integer year;//考核年份
	private Integer numVaue;//其它值，年度{0}、半年考核值{0,1}、季度值{0,1,2,3}、月份值{0,1,2 ...,10,11}
	private Integer type;//考核类型{0:"年度",1:"上半年，下半年"，2："季度考核",3:"月份考核"}
	@ov
*/	@Override
	public boolean userIsFinish(int userId,int type,int year,int numVlaue){
		
		return getCount(new SqlText("where o.userId=? and o.type=? and o.year=? and o.numVaue=?", userId,type,year,numVlaue))>0;
	}
	@MethodInfo(desc = "保存绩效考核记录，并写入记录打分详情", param = { "" })
	//@org.springframework.transaction.annotation.Transactional
	@Override
	public String saveCore(int type,int year,int otherInfo,int[] ids,int[] cores,int userId,int departmentId,int basicMoney){
		Admin admin = adminService.find(userId);
		if(curretUserIsFinish(type, year, otherInfo, userId)){
			return "绩效考核不能重复填写";
		}else{
			
			try {
				int totalCore=totalCore(ids, cores);
				PerformanceRecords performanceRecords = new PerformanceRecords(userId, admin.getRealName(), year, otherInfo, type, new Date().getTime(), totalCore, RecordState.ZERO,departmentId,basicMoney);
				save(performanceRecords);
				for (int i = 0; i < cores.length; i++) {
					performanceRecordsDetailsService.save(new PerformanceRecordsDetails(ids[i], cores[i], performanceRecords.getId()));
					System.out.println("开始保存details");
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				return "保存失败. Cause By "+e.getMessage();
			}
			System.out.println("保存成功，退出页面");
			return "保存成功";
		}
		
	}
	public int totalCore(int[] ids ,int[] cores){
		int core=0;
		
		for (int i = 0; i < cores.length; i++) {
			if(performanceFormService.find(ids[i]).getSecondkpi().contains("扣分项目")){
				core=core-cores[i];
			}else{
				core+=cores[i];
			}
		}
		return core;
	}
	@MethodInfo(desc = "判断传入用户，该类型的绩效是否已经填写过", param = { "" })
	@Override
	public boolean curretUserIsFinish(int type,int year,int otherInfo,int userId){
		return this.getJdbcTemplate().queryForObject("select count(*) from table_performance_records a where a.col_type=? "
				+ "and a.col_year=? and a.col_num_value=? and a.col_user_id=?", Integer.class,type,year,otherInfo,userId)>0;
	}

}

package com.foxlink.mes.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.foxlink.mes.Interface.LoginState;
import com.foxlink.mes.Interface.RecordState;
import com.foxlink.mes.annotation.MethodInfo;
import com.foxlink.mes.bean.Admin;
import com.foxlink.mes.bean.DepartmentMoney;
import com.foxlink.mes.bean.PerformanceRecords;
import com.foxlink.mes.bean.PerformanceRecordsDetails;
import com.foxlink.mes.service.AdminService;
import com.foxlink.mes.service.DepartmentMoneyService;
import com.foxlink.mes.service.PerformanceFormService;
import com.foxlink.mes.service.PerformanceRecordsDetailsService;
import com.foxlink.mes.service.PerformanceRecordsService;
import com.foxlink.utils.RecordsUtils;
import com.foxlink.utils.SqlText;
@Service
public class PerformanceRecordsServiceBean extends BaseServiceBean<PerformanceRecords> implements PerformanceRecordsService{
	
	Logger log = Logger.getLogger(PerformanceRecordsServiceBean.class);
	@Resource
	PerformanceRecordsDetailsService performanceRecordsDetailsService;
	@Resource
	AdminService adminService;
	@Resource
	PerformanceFormService performanceFormService;
	@Resource
	DepartmentMoneyService departmentMoneyService;
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
	@Override
	@MethodInfo(desc = "根据考核类型取得考核状态", param = { "" })
	public int getCheckState(int userId, int type, int year, int numVlaue) {
		PerformanceRecords performanceRecords = get(new SqlText("where o.userId=? and o.type=? and o.year=? and o.numVaue=?", userId,type,year,numVlaue));
		if (performanceRecords==null) {
			return -1;
		}
		return performanceRecords.getState();
	}
	@Override
	@MethodInfo(desc = "根据考核类型取得考核总分数", param = { "" })
	public int getCheckTotalCore(int userId, int type, int year, int numVlaue) {
		PerformanceRecords performanceRecords = get(new SqlText("where o.userId=? and o.type=? and o.year=? and o.numVaue=?", userId,type,year,numVlaue));
		if (performanceRecords==null) {
			return 0;
		}
		return performanceRecords.getTotalCore();
	}
	@Override
	@Transactional(rollbackFor=Exception.class)
	public String commitRecords(int userId, int type, int year, int numVlaue,int[] ids) throws Exception{
		String message=null;
		for (int i = 0; i < ids.length; i++) {
			PerformanceRecords performanceRecords = get(new SqlText("where o.userId=? and o.type=? and o.year=? and o.numVaue=?", ids[i],type,year,numVlaue));
			if (performanceRecords.getState()==RecordState.ONE) {
				message="已提交，请勿重复提交";
				throw new Exception("已提交，请勿重复");
				
			}else{
				performanceRecords.setState(RecordState.ONE);
				update(performanceRecords);
				message="提交完成,下一步稽核小组稽核";
			}
		}
		return message;
	}
	@Override
	@MethodInfo(desc = "根据部门Id和类型找到部门考核当前状态", param = { "" })
	public String getDepartmentState(int departmentId,int year,int type ,int otherInfo){
		log.error("{departmentId:"+departmentId+",year:"+year+",type:"+type+",otherInfo:"+otherInfo+"}");
		List<PerformanceRecords> list = getList(new SqlText("where o.departmentId=? and o.type=? and o.year=? and o.numVaue=?",departmentId,type,year,otherInfo));
		if (list==null||list.size()<1) {
			return RecordsUtils.stateToString(RecordState.UNDEFINED);
		}
		
		return RecordsUtils.stateToString(list.get(0).getState());
	}
	@MethodInfo(desc = "根据部门和考核类型计算部门员工工资信息", param = { "" })
	@Override
	public List<Map<String, Object>> getDepartmentPerformanceInfo(int type ,int year,int otherInfo,int departmentId){
		
		DepartmentMoney departmentMoney = departmentMoneyService.get(new SqlText("where o.type=? and o.year=? and o.numValue=? and o.departmentId=?", type,year,otherInfo,departmentId));
		//计算一分多少钱绩效
		int departmentCore=getTotalCoreForDepartment(type, year, otherInfo, departmentId);
		double per = (double)(departmentMoney.getMoney()/departmentCore);//每分对应的钱
		List<Map<String, Object>> userList = this.getJdbcTemplate().queryForList("select a.col_username,a.col_real_name,d.col_basic_money,d.col_total_core from table_admin a join table_department_user c on a.col_id=c.col_user_id join table_department b on b.col_id=c.col_department_id join table_performance_records d on a.col_id=d.col_user_id "
				+ "where b.col_id=? and a.col_state=? and d.col_type=? and d.col_year=? and d.col_num_value=?",departmentId,LoginState.ENABLE,type,year,otherInfo);
		for (int i = 0; i < userList.size(); i++) {
			double performanceMoney=(double)((int)userList.get(i).get("col_total_core"))*per;
			userList.get(i).put("col_performance_money",performanceMoney);
			double basicMoney=(double)userList.get(i).get("col_basic_money");
			userList.get(i).put("col_total_money", basicMoney+performanceMoney);
		}
		return userList;
	}
	@MethodInfo(desc = "计算某部门某一个类型的考核的总分数", param = { "" })
	public int getTotalCoreForDepartment(int type ,int year,int otherInfo,int departmentId){
		return this.getJdbcTemplate().queryForObject("select sum(col_total_core) from table_performance_records a where a.col_type=? "
				+ "and a.col_year=? and a.col_num_value=? and a.col_department_id=?", Integer.class,type,year,otherInfo,departmentId);
	}

}

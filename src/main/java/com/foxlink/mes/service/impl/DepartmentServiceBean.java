package com.foxlink.mes.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.foxlink.mes.Interface.LoginState;
import com.foxlink.mes.annotation.MethodInfo;
import com.foxlink.mes.bean.Admin;
import com.foxlink.mes.bean.Department;
import com.foxlink.mes.service.AdminService;
import com.foxlink.mes.service.DepartmentService;
import com.foxlink.mes.service.PerformanceRecordsService;
import com.foxlink.utils.SqlText;
@Service
public class DepartmentServiceBean extends BaseServiceBean<Department> implements DepartmentService {
	@Resource
	AdminService adminService;
	@Resource
	PerformanceRecordsService performanceRecordsService;
	Logger log = Logger.getLogger(DepartmentServiceBean.class);
	@Override
	@SuppressWarnings("all")
	public void allowcationUser(Integer departmentId,Integer ...userIds){
		Department department = find(departmentId);
		department.setAdminList(null);
		update(department);
		log.error("清空了部门下面所有人员");
		List<Admin> adminList= new ArrayList<Admin>();
		for (int i = 0; i < userIds.length; i++) {
			adminList.add(adminService.find(userIds[i]));
		}
		department.setAdminList(adminList);
		saveOrUpdate(department);
		log.error("新增了很多用户");
	}
	@Override
	public boolean isLeader(String accountId){
		return getCount(new SqlText("where o.leaderNum=?", accountId.trim()))>0;
	}
	
	@Override
	public List<Department> getPerformanceDepartmentList(String accountId){
		//根据部门显示所有用户绩效考核状态
		return getList(new SqlText("where o.leaderNum=?", accountId.trim()));
	}
	@Override
	public List<Map<String, Object>> getPerformanceUserAndState(Integer departmentId,int type,int year,int numValue){
		List<Map<String, Object>> userInfos = this.getJdbcTemplate().queryForList("select a.col_id as col_user_id,b.col_id as col_department_id,a.*,b.* from table_admin a join table_department_user c on a.col_id=c.col_user_id "
				+ "join table_department b on b.col_id=c.col_department_id where b.col_id=? and a.col_state=?",departmentId,LoginState.ENABLE);
		for (int i = 0; i < userInfos.size(); i++) {
			Integer userId = (Integer) userInfos.get(i).get("col_user_id");
			//判断用户id该类型的考核是否完成
			log.error("{userId:"+userId+",type:"+type+",year:"+year+",otherInfo:"+numValue+"}");
			if (performanceRecordsService.userIsFinish(userId, type, year, numValue)) {
				userInfos.get(i).put("col_state", "已考核");
			}else{
				userInfos.get(i).put("col_state", "未考核");
			}
		}
		return userInfos;
	}
	@Override
	@MethodInfo(desc = "根据类型、年份、其它值查找当前部门是否完成该类型的考核", param = { "otherInfo：{0,0-1,0-3,0-11}" })
	public boolean checkIsFinish(int departmentId,int type,int year,int otherInfo){
		//取得部门所有启用账号数量。
		 Integer totalCount = this.getJdbcTemplate().queryForObject("select count(*) from table_admin a join table_department_user c on a.col_id=c.col_user_id "
				+ "join table_department b on b.col_id=c.col_department_id where b.col_id=? and a.col_state=?",Integer.class,departmentId,LoginState.ENABLE);
		//取得该部门当前类型绩效已考核数量
		 Integer current = this.getJdbcTemplate().queryForObject("select count(distinct(col_user_id)) from table_performance_records where col_type=? and col_year=? and col_num_value=? and col_department_id=?", Integer.class,type,year,otherInfo,departmentId);
		 if (totalCount==current) {
			return true;
		}
		 return false;
	}
	
}

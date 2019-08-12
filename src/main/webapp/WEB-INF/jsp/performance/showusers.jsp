<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../share/lib.jsp" %>
<script type="text/javascript" src="<c:url value="/js/My97DatePicker/WdatePicker.js"/>"></script>
<title>${modelName} 生產管理系統</title>
<style type="text/css">
.auth{
margin: 10px;
}
</style>
<script type="text/javascript">
	$(function(){
		
		if('${state}'=='false'){
			
			$("button").attr('disabled',true)
			
		}else{
			$("button").removeAttr('disabled')
		}
	})
</script>
</head>
<body >
<div class="main">
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<c:if test="${empty message }">
		<div id="mainbody" >
				<form id="form1" action="" method="post">
				<table id="condition" border="1" style="width: 600px;">
				<caption>${department.departmentName } 绩效考核 ${state } <button>提交全部</button></caption>
				<thead>
					<th>用户名</th>
					<th>姓名</th>
					<th>职位</th>
					<th>状态</th>
				</thead>
				<c:forEach items="${userInfos }" var="user">
					<tr>
						<td>${user.col_username }<input type="hidden" name="ids" value="${user.col_user_id }"></td>
						<td>${user.col_real_name }</td>
						<td><a href="editPerformance.html?userId=${user.col_user_id }&type=${type}&year=${year}&otherInfo=${otherInfo}&departmentId=${user.col_department_id }">${user.col_job_name }</a></td>
						
						<td>${user.col_state }</td>
					</tr>
				</c:forEach>
			</table>
			</form>
		</div>
		</c:if>
		<h3 id="message">${message}</h3>
	</div>
</body>
</html>
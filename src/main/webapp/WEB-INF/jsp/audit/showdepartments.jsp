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
				<form id="form1" action="setMoney.html" method="post">
				<table id="condition" border="1" style="width: 600px;">
				<caption> 部门绩效稽核 </caption>
				<thead>
					<th>部门名称<input type="text" name="year" value="${year }">
					<input type="text" name="type" value="${type }">
					<input type="text" name="otherInfo" value="${otherInfo }">
					</th>
					<th>部门代码</th>
					<th>状态</th>
					<th>考核人数/总人数</th>
					
				</thead>
				<c:forEach items="${departments }" var="department">
					<tr>
						<td><%-- ${department.col_department_name } --%>
						<c:choose>
							<c:when test="${department.col_state =='待稽核' }"><a href="audit.html?type=${type}&year=${year}&otherInfo=${otherInfo}&departmentId=${department.col_id }">${department.col_department_name }</a></c:when>
							<c:otherwise>${department.col_department_name }</c:otherwise>
						</c:choose>
						</td>
						<td>${department.col_department_num }</td>
						<td>${department.col_state }</td>
						<td>${department.col_finish_count }/${department.col_total_count }</td>
						
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
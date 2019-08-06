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
	
</script>
</head>
<body >
<div class="main">
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<c:if test="${empty message }">
		<div id="mainbody" >
			
				<table id="condition" border="1" style="width: 600px;">
				<caption>${department.departmentName } 绩效考核 <a href="<c:url value="/department/list.html"/>">返回列表</a></caption>
				<thead>
					<th>用户名</th>
					<th>姓名</th>
					<th>状态</th>
				</thead>
				<c:forEach items="${userInfos }" var="user">
					<tr>
						<td>${user.col_username }</td>
						<td>${user.col_real_name }</td>
						<td>${user.col_state }</td>
					</tr>
				</c:forEach>
			</table>
			
		</div>
		</c:if>
		<h3 id="message">${message}</h3>
	</div>
</body>
</html>
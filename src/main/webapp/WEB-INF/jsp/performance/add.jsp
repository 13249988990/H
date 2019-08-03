<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../share/lib.jsp" %>
<title>${modelName} 生產管理系統</title>
<style type="text/css">
.auth{
margin: 10px;
}
</style>
</head>
<body >
<div class="main">
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<div id="mainbody" >
			<form action="<c:url value="/department/saveDepartment.html"/>" method="post">
				<table border="1" style="width: 600px;">
				<caption>角色添加 <a href="<c:url value="/department/list.html"/>">返回列表</a></caption>
				<tr>
					<th style="width: 30%;">部门名称</th>
					<td><input type="text" name="departmentName" value="${department.departmentName}"> </td>
				</tr>
				<tr>
					<th style="width: 30%;">部门代码</th>
					<td><input type="text" name="departmentNum" value="${department.departmentNum}"> </td>
				</tr>
				<tr>
					<th style="width: 30%;">主管账号</th>
					<td><input type="text" name="leaderNum" value="${department.leaderNum}"> </td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="送出"> </td>
				</tr>
			</table>
			</form>
		</div>
		<h3 id="message">${message}</h3>
	</div>
</body>
</html>
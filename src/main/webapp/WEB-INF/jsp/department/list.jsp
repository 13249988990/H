<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../share/lib.jsp" %>
<title>${modelName} 生產管理系統</title>
</head>
<body >
<div class="main">
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<div id="mainbody" >
			<form action="<c:url value="/admin/login.html"/>" method="post">
				<table border="1" style="width: 400px;">
				<caption>部门管理 <a href="<c:url value="/department/saveDepartment.html"/>">添加</a></caption>
				<tr>
					<th>名称</th>
					<th>部门代码</th>
					<th>主管账号</th>
					<th>更新</th>
					<th>刪除</th>
					<th>人员管理</th>
				</tr>
				<c:forEach items="${Records}" var="role">
					<tr>
						<th>${role.departmentName}</th>
						<td>${role.departmentNum}</td>
						<td>${role.leaderNum}</td>
						<td><a href="<c:url value="/department/updateDepartment.html?id="/>${role.id}">編輯</a></td>
						<td><a href="<c:url value="/department/deleteDepartment/${role.id}.html"/>">刪除</a></td>
						<td><a href="<c:url value="/department/allowcationUser.html?id=${role.id }"/>">分配用户</a></td>
					</tr>
				</c:forEach>
			</table>
			</form>
			<h3 id="message">${message}</h3>
		</div>
	</div>
</body>
</html>
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
				<caption>角色管理 <a href="<c:url value="/role/toAdd.html"/>">添加</a></caption>
				<tr>
					<th>名稱</th>
					<td>備註</td>
					<td>更新</td>
					<td>刪除</td>
				</tr>
				<c:forEach items="${roles}" var="role">
					<tr>
						<th>${role.name}</th>
						<td>${role.description}</td>
						<td><a href="<c:url value="/role/toUpdate.html?id="/>${role.id}">編輯</a></td>
						<td><a href="<c:url value="/role/delete.html?id="/>${role.id}">刪除</a></td>
					</tr>
				</c:forEach>
			</table>
			</form>
			
		</div>
	</div>
</body>
</html>
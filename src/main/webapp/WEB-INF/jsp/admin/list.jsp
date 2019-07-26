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
				<table border="1" style="width:400px;">
				<caption>用戶管理 <a href="<c:url value="/admin/toAdd.html"/>">添加</a></caption>
				<tr>
					<th>名稱</th>
					<td>部門</td>
					<td>更新</td>
					<td>刪除</td>
				</tr>
				<c:forEach items="${admins}" var="admin">
					<tr>
						<th>${admin.username}</th>
						<td>${admin.department}</td>
						<td><a href="<c:url value="/admin/toUpdate.html?id="/>${admin.id}">編輯</a></td>
						<td><a href="<c:url value="/admin/delete.html?id="/>${admin.id}">刪除</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>
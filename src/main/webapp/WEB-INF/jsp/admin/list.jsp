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
				<table border="1" style="width:60%;">
				<caption>用戶管理 <a href="<c:url value="/admin/toAdd.html"/>">添加</a></caption>
				<tr>
					<th>账号</th>
					<th>姓名</th>
					<th>职务</th>
					<th>部门</th>
					<th>邮件</th>
					<th>最后登录时间</th>
					<th>最后登录IP</th>
					<th>当前状态</th>
					<th>更新</th>
					<th>刪除</th>
				</tr>
				<c:forEach items="${admins}" var="admin">
					<tr>
						<td>${admin.username}</td>
						<td>${admin.realName}</td>
						<td>${admin.job}</td>
						<td>${admin.department}</td>
						<td>${admin.email}</td>
						<td>${admin.loginTime}</td>
						<td>${admin.loginIp}</td>
						<td>
							<c:choose>
							<c:when test="${admin.state==1 }"><a href="changeState.html?state=启用&&accountId=${ admin.id}">启用</a></c:when>
							<c:otherwise><a href="changeState.html?state=禁用&&accountId=${ admin.id}">禁用</a></c:otherwise>
						</c:choose>
						</td>
						<td><a href="<c:url value="/admin/toUpdate.html?id="/>${admin.id}">編輯</a></td>
						<td><a href="<c:url value="/admin/delete.html?id="/>${admin.id}">刪除</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>
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
			<c:if test="${admin==null}">
				
					<input type="hidden" name="returnUrl" value="${returnUrl}">
				<table border="1">
				<caption>管理員登錄</caption>
				<tr>
					<th>用戶名:</th>
					<td><input type="text" name="username" required="required"> </td>
				</tr>
				<tr>
					<th>密碼:</th>
					<td><input type="password" name="password" required="required"> </td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="送出"> </td>
				</tr>
			</table>
			</c:if>
			<h3 id="message">${message}</h3>
		</form>
		</div>
	</div>
</body>
</html>
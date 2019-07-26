<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<%@ include file="../share/lib.jsp" %>
<title>${modelName} 生產管理系統--添加生產站別</title>
</head>
<body>
	<div class="main">
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<div id="mainbody">
			<form name="routeForm" method="post"
				action="<c:url value="/site/add.html"/>">
				<input type="hidden" name="routeId" value="${route.routeId}">
				<table border="1" id="formTable">
					<caption>
						新增生产站别 <a
							href="<c:url value="/site/list.html?routeId=${route.routeId}"/>">返回站別列表</a>
					</caption>
					<tr>
						<td>生产流程名:</td>
						<td>${route.routeName}</td>
					</tr>
					<tr>
						<td>站别名:</td>
						<td class="myleft"><input type="text" name="siteName" required="required" /></td>
					</tr>
					<tr>
						<td>站别索引:</td>
						<td class="myleft"><input type="text" name="siteIndex" required="required" pattern="\d{1,4}" oninvalid="alert('索引不能大於1000')"/></td>
					</tr>
					<tr>
						<td>请求地址:</td>
						<td class="myleft"><input type="text" name="actionUrl"/></td>
					</tr>
					<tr>
						<td>插件简单类名:</td>
						<td class="myleft"><input type="text" name="className"/></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="送出"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>
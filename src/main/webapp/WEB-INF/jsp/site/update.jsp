<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="../share/lib.jsp" %>
<title>${modelName} 生產管理系統--站別更新</title>
</head>
<body>
	<div class="main">
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<div id="mainbody">
			<form name="routeForm" method="post"
				action="<c:url value="/site/update.html"/>">
				<input type="hidden" name="siteId" value="${site.siteId}"> 
				<input type="hidden" name="routeId" value="${site.route.routeId}">
				<table border="1" id="formTable">
					<caption>更新生产站别  <a	href="<c:url value="/site/list.html?routeId=${site.route.routeId}"/>">返回站別列表</a></caption>
					<tr>
						<td>生产流程名:</td>
						<td>${site.route.routeName}</td>
					</tr>
					<tr>
						<td>站别名:</td>
						<td class="myleft"><input type="text" name="siteName"	value="${site.siteName}" required="required"/></td>
					</tr>
					<tr>
						<td>站别索引:</td>
						<td class="myleft"><input type="text" name="siteIndex"	value="${site.siteIndex}" required="required"/></td>
					</tr>
					<tr>
						<td>请求地址:</td>
						<td class="myleft"><input type="text" name="actionUrl"  value="${site.actionUrl}"/></td>
					</tr>
					<tr>
						<td>插件简单类名:</td>
						<td class="myleft"><input type="text" name="className"	value="${site.className}"/></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="送出"></td>
					</tr>
				</table>
			</form>
			<h3 id="message">${message}</h3>
		</div>
	</div>
</body>
</html>
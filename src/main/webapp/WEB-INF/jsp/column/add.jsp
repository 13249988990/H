<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="../share/lib.jsp" %>
<title>${modelName} 生產管理系統--添加輸入列</title>
</head>
<body>
	<div class="main">
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<div id="mainbody">
				<form name="routeForm" method="post"
					action="<c:url value="/siteColumn/add.html"/>">
					<input type="hidden" name="routeId" value="${routeId}"> 
					<input	type="hidden" name="siteId" value="${site.siteId}">
					<table border="1" id="formTable">
						<caption>新增输入列  <a href="<c:url value="/siteColumn/list.html?routeId=${routeId}&&siteId=${site.siteId}"/>">返回站別列表</a></caption>
						<tr>
							<td>所属站别:</td>
							<td>${site.siteName}</td>
						</tr>
						<tr>
							<td>输入列名:</td>
							<td><input type="text" name="columnName" required="required"/></td>
						</tr>
						<tr>
							<td>正则表达式:</td>
							<td><input type="text" name="regex" required="required"/></td>
						</tr>
						<tr>
							<td>输入列索引:</td>
							<td><input type="text" name="columnIndex" required="required" value="${index}" pattern="\d+" oninvalid="alert('索引只能為數字')"/></td>
						</tr>
						<tr>
							<td>比对表达式:</td>
							<td><input type="text" name="condition"  placeholder="example:0-1-5"/></td>
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
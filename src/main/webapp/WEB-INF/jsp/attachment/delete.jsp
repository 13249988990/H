<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<%@ include file="../share/lib.jsp"%>
<title>${modelName} 生產管理系統--附件刪除</title>
<style type="text/css">
td{
	padding: 3px 5px;
}
</style>
</head>
<body>
	<div class="main" >
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<div id="mainbody">
			<form action="<c:url value="/attachment/delete.html"/>" method="post">
				<table>
					<caption>刪除附件包</caption>
					<tr>
						<td>請輸入附件包條碼:</td>
						<td><input type="text" name="attachmentId"> </td>
						<td><input type="submit" value="刪除"> </td>
					</tr>
				</table>
			</form>
			<h3 id="message">${message}</h3>
		</div>
	</div>
</body>
</html>
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
			<form action="<c:url value="/role/save.html"/>" method="post">
				<table border="1" style="width: 600px;">
				<caption>角色添加 <a href="<c:url value="/role/list.html"/>">返回列表</a></caption>
				<tr>
					<th style="width: 30%;">名稱</th>
					<td><input type="text" name="name"> </td>
				</tr>
				<tr>
					<th >描述</th>
					<td><input type="text" name="description"> </td>
				</tr>
				<tr>
					<th colspan="2">請選擇權限</th>
				</tr>
				<tr>
					<td colspan="2" style="text-align: left;">
						<c:forEach items="${authorities}" var="auth" varStatus="s">
						<div style="width: 23%;background-color: gray;border: solid 1px;float: left;">
							<input type="checkbox" name="authorities" value="${auth.key}"  class="auth"/>${auth.value}
						</div>
						<c:if test="${s.count>0 && s.count % 4 ==0 }"> <br/></c:if>
				</c:forEach>
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="送出"> </td>
				</tr>
			</table>
			</form>
		</div>
	</div>
</body>
</html>
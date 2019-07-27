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
			<form action="<c:url value="/role/update.html"/>" method="post">
				<input type="hidden" name="id" value="${role.id}">
				<table border="1" style="width: 600px;">
				<caption>角色更新 <a href="<c:url value="/role/list.html"/>">返回列表</a></caption>
				<tr>
					<th style="width: 30%;">名稱</th>
					<td><input type="text" name="name" value="${role.name}"> </td>
				</tr>
				<tr>
					<th >描述</th>
					<td><input type="text" name="description" value="${role.description}"> </td>
				</tr>
				<tr>
					<th colspan="2">請選擇權限</th>
				</tr>
				<tr>
					<td colspan="2" style="text-align: left;border: solid 1px">
						<c:forEach items="${authorities}" var="entry" varStatus="statu">
							<c:set var="isChecked" value="0"></c:set>
							<c:forEach items="${role.authorities}" var="authoritie" varStatus="s">
								<c:if test="${entry.key == authoritie }">
									<c:set var="isChecked" value="1"></c:set>
									<label>
										<input type="checkbox" name="authorities" checked="checked" value="${entry.key}" class="auth"/>${entry.value}
									</label>
									
								</c:if>
							</c:forEach>
							<c:if test="${isChecked != 1}">
									<label>
									<input type="checkbox" name="authorities" value="${entry.key}" class="auth"/>${entry.value}
									</label>
							</c:if>
						<c:if test="${statu.count>0 && statu.count%4 ==0}"> <br/></c:if>
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
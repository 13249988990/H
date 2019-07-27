<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../share/lib.jsp" %>
<title>${modelName} 生產管理系統</title>
<style type="text/css">
.roleIds{
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
			<form action="<c:url value="/admin/update.html"/>" method="post">
				<input type="hidden" name="id" value="${admin.id}">
				<table border="1" style="width: 400px;">
				<caption>用戶更新 <a href="<c:url value="/admin/list.html"/>">返回列表</a></caption>
				<tr>
					<th style="width: 30%;">用戶名</th>
					<td><input type="text" name="username" readonly="readonly" value="${admin.username}"> </td>
				</tr>
				<tr>
					<th style="width: 30%;">姓名</th>
					<td><input type="text" name="realName" required="required" id="realName" value="${admin.realName}" > </td>
				</tr>
				<tr>
					<th style="width: 30%;">职务</th>
					<td><input type="text" name="job"  id="job" value="${admin.job}" > </td>
				</tr>
				<tr>
					<th style="width: 30%;">邮箱</th>
					<td><input type="text" name="email"  id="email"  value="${admin.email}"> </td>
				</tr>
				<tr>
					<th style="width: 30%;">密碼</th>
					<td><input type="password" name="password" required="required" id="password" value="${admin.password}"> </td>
				</tr>
				
				
				<tr>
					<th>角色</th>
					<td style="text-align: left;">
						<c:forEach items="${roles}" var="role" varStatus="statu">
							<c:set var="isChecked" value="0"></c:set>
							<c:forEach items="${admin.roles}" var="myRole" >
								<c:if test="${role eq myRole}">
									<c:set var="isChecked" value="1"></c:set>
									<input type="checkbox" name="roleIds" checked="checked" class="roleIds" value="${role.id}" />${role.name}
								</c:if>	
							</c:forEach>
							<c:if test="${isChecked != 1}">
								<input type="checkbox" name="roleIds" class="roleIds" value="${role.id}" />${role.name}
							</c:if>
							<c:if test="${statu.count>0 && statu.count%2 ==0}"> <br/></c:if>
						</c:forEach>
					 </td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="送出"> </td>
				</tr>
			</table>
			</form>
			<c:forEach items="${admin.roles}" var="role">
			</c:forEach>
		</div>
	</div>
</body>
</html>
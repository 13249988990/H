<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../share/lib.jsp" %>
<title>${modelName} 生產管理系統</title>
<style type="text/css">
label{
	margin: 10px;
}
</style>
<script type="text/javascript">
	$(function(){
		$("#adminForm").submit(function(){
			if($("#password").val()!=$("#repassword").val()){
				alert("两次密码不相等!");
				return false;
			}
		
		});
	});
</script>
</head>
<body >
<div class="main">
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<div id="mainbody" >
			<form action="<c:url value="/admin/save.html"/>" method="post" id="adminForm">
				<table border="1" style="width: 400px;">
				<caption>用戶添加 <a href="<c:url value="/admin/list.html"/>">返回列表</a></caption>
				<tr>
					<th style="width: 30%;">账号</th>
					<td><input type="text" name="username" required="required" id="username" pattern="[A-z0-9]{1,}" placeholder="账号只能是数字字母"> </td>
				</tr>
				<tr>
					<th style="width: 30%;">姓名</th>
					<td><input type="text" name="realName" required="required" id="realName" > </td>
				</tr>
				<tr>
					<th style="width: 30%;">职务</th>
					<td><input type="text" name="job"  id="job" > </td>
				</tr>
				<tr>
					<th style="width: 30%;">邮箱</th>
					<td><input type="text" name="email"  id="email" > </td>
				</tr>
				<tr>
					<th style="width: 30%;">密碼</th>
					<td><input type="password" name="password" required="required" id="password"> </td>
				</tr>
				<tr>
					<th style="width: 30%;">確認密碼</th>
					<td><input type="password" name="repassword" required="required" id="repassword"> </td>
				</tr>
				<!-- <tr>
					<th style="width: 30%;">部門</th>
					<td><input type="text" name="department" required="required" id="department"> </td>
				</tr> -->
				<tr>
					<th>角色</th>
					<td style="text-align: left;">
						<c:forEach items="${roles}" var="role" varStatus="s">
							<label><input type="checkbox" name="roleIds" value="${role.id}" />${role.name}</label>
							<c:if test="${s.count>0 && s.count%2 ==0}"> <br/></c:if>
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
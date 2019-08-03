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
			<form action="<c:url value="/department/allowcationUser.html"/>" method="post">
				<center>
				
				<caption>${department.departmentName } ->人员管理 <input type="submit" value="保存"></caption>
				<input type="text" name="id"  value="${department.id }" >
					<div style="width: 400px;border: solid 1px;">
				
				
							<c:forEach items="${userList}" var="userall" varStatus="statu">
							<c:set var="isChecked" value="0"></c:set>
							<c:forEach items="${department.adminList}" var="user" varStatus="s">
								<c:if test="${userall.id == user.id }">
									<c:set var="isChecked" value="1"></c:set>
									<label>
										<input type="checkbox" name="userIds" value="${userall.id }" checked="checked" class="auth"/>${userall.username}
									</label>
									
								</c:if>
							</c:forEach>
							<c:if test="${isChecked != 1}">
									<label>
									<input type="checkbox" name="userIds" value="${userall.id }"  class="auth"/>${userall.username}
									</label>
							</c:if>
						<c:if test="${statu.count>0 && statu.count%4 ==0}"> <br/></c:if>
					</c:forEach>
			</div>
				</center>
			</form>
			<h3 id="message">${message}</h3>
		</div>
	</div>
</body>
</html>
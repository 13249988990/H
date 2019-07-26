<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="../share/lib.jsp" %>
<title>${modelName} 生產管理系統--壞項更新</title>
</head>
<body>
        <div class="main">
                <div class="menu">
                <%@ include file="../share/menu.jsp"%>
                </div>
                <div id="mainbody">
						<form name="testForm" method="post" action="<c:url value="/badItem/update.html"/>">
							<input type="hidden" name="badItemId" value="${badItem.badItemId}">
							<input type="hidden" name="parentId" value="${parentId}">
							<table border="1">
								<caption>更新${beanName}</caption>
								<tr>
									<td>站別名:</td>
									<td><input type="text" name="name" value="${badItem.name}" required="required" size="40"/></td>
								</tr>
								<tr>
									<td>備註:</td>
									<td><input type="text" name="remark"  value="${badItem.remark}" size="40"/></td>
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
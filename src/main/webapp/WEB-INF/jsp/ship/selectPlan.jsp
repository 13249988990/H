<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="../share/lib.jsp" %>
<title>${modelName} 倉庫入庫</title>
</head>
<body>
<div>
	<div class="main">
			<div class="menu">
				<%@ include file="../share/menu.jsp"%>
			</div>
			<div id="mainbody">
				<form name="form1" method="post"
					action="<c:url value="/ship/selectPlan.html"/>">
					<table>
						<caption>倉庫入庫</caption>
						<tr>
							<td>PO號:</td>
							<td><input name="poId" type="text" required="required"></td>
							<td><input type="submit" name="Submit" value="送出"></td>
						</tr>
					</table>
				</form>
				<h3 id="message">${message}</h3>
			</div>
		</div>
	</div>
</body>
</html>
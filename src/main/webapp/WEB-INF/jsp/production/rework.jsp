<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<%@ include file="../share/lib.jsp" %>
<style type="text/css">
	body td{
		padding: 5px 5px;
		text-align: center;
	}
	table{
		text-align: center;
		margin: 10px auto;
	}
	
</style>

<title>${modelName} 生產管理系統--生產重工</title>
</head>

<body style="background-color: #ECE9D8">
	<div class="main">
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<div id="mainbody">
			<form id="myform" action="<c:url value="/production/rework.html"/>">
				<input id="myComponentId" value="${productionInfos[0].component.componentId}" type="hidden">
						<table>
							<caption>生產重工解除綁定</caption>
							<tr>
								<td>請輸入客戶條碼:</td>
								<td><input type="text" name="clientNo" id="clientNo" required="required"> </td>
								<td rowspan="2"><input type="submit" value="解除綁定"></td>
							</tr>
						
						</table>
				</form>
			<h3 style="color:#FF0000; text-align: center;">${message}</h3>
		</div>
	</div>
</body>
</html>
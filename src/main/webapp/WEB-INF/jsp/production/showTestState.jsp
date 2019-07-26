<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../share/lib.jsp" %>
<title>${modelName} 生產管理系統</title>
<style type="text/css">
#testTable td{
	padding: 2px 5px;
}
</style>
</head>
<body >
<div class="main">
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<div id="mainbody" >
		<form action="<c:url value="/production/showTestState.html"/>" method="post">
				<table>
				<caption>整機測試結果查詢</caption>
				<tr>
					<th>機臺條碼:</th>
					<td><input type="text" name="componentId" required="required"> </td>
					<td colspan="2"><input type="submit" value="送出"> </td>
				</tr>
				</table>
			<h3 id="message">${message}</h3>
			
			<c:if test="${componentId!=null}">
					<table border="1" id="testTable">
				<tr>
					<td>機臺號</td>
					<td>是否已出檢修</td>
					<td>是否通過AT5測試</td>
					<td>是否通過Card AT5測試</td> 
					<td>是否通過MachineTest測試</td>
					<td>数据有效性</td>
				</tr>
				<tr>
					<td>${componentId}</td>
					<td>
						<c:if test="${inRepair==false}"><span style="color:green; font-weight: bold;">是</span></c:if>
						<c:if test="${inRepair==true}"><span style="color: red; font-weight: bold;">否</span> </c:if>
					</td>
					<td>
						<c:if test="${at5==true}"><span style="color:green;font-weight: bold;">是</span></c:if>
						<c:if test="${at5==false}"><span style="color: red;font-weight: bold;">否</span></c:if>
					</td>
					<td>
						<c:if test="${card22==true}"><span style="color:green;font-weight: bold;">是</span></c:if>
						<c:if test="${card22==false}"><span style="color: red;font-weight: bold;">否</span></c:if>
					</td> 
					<td>
						<c:if test="${machine==true}"><span style="color:green;font-weight: bold;">是</span></c:if>
						<c:if test="${machine==false}"><span style="color: red;font-weight: bold;">否</span></c:if>
					</td>
					<td>
						<c:if test="${validCheck=='正常'}"><span style="color:green;font-weight: bold;">${validCheck}</span></c:if>
						<c:if test="${ validCheck ne '正常'}"><span style="color: red;font-weight: bold;">${validCheck}</span></c:if>
					</td>
				</tr>
			</table>
			</c:if>
		</form>
		</div>
		
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="../share/lib.jsp"%>
<title>${modelName} 生產管理系統--出貨資料查詢</title>

<style type="text/css">
td{
	padding: 2px 5px;
}
</style>
</head>

<body style="background-color: #ECE9D8">
	<div class="main">
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<div id="mainbody">
			<form id="myform" action="<c:url value="/query/lotQuery.html"/>">
						<table style="text-align: center; margin: 0 auto;">
							<tr>
								<td>請輸入PO號:</td>
								<td><input type="text" name="poId"> </td>
								<td><input type="submit" value="送出"> </td>
							</tr>
						</table>
					
				</form>
			<h3 style="color:#FF0000; text-align: center;">${message}</h3>
		<c:if test="${!empty goodses}">
					<table border="1">
					<caption> ${poId} 出貨資料</caption>
					  <tr align="center">
						<td>Item</td>
						<td>INVOICE_NO</td>
						<td>SERIAL_NO</td>
						<td>PO號</td>
						<td>PRODUCT_CODE</td>
						<td>PALLET_NO</td>
					  </tr>	
					  <c:forEach items="${goodses}" var="map" varStatus="a">
					  <tr align="center">
						<td>${a.count}</td>
						<c:forEach items="${map}" var="entry">
							<td>${entry.value}</td>
						</c:forEach>
					  </tr>
					  </c:forEach>
					</table>
				</c:if>
			<c:if test="${empty goodses && poId!= null}">
				<H3 id="message">沒有出貨資料</H3>
			</c:if>
		</div>
	</div>

</body>
</html>
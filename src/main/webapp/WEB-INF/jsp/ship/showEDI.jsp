<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../share/lib.jsp" %>
<title>${modelName} 生產管理系統</title>
<script type="text/javascript">
$(function(){
	$("#insertForm").submit(function(){
		if (confirm("確定要導入EDI嗎?")) {
			return true;
		}
		return false;
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
		<form action="<c:url value="/ship/showEDI.html"/>" method="post">
				<table>
				<caption>EDI資料導入</caption>
				<tr>
					<th>請輸入 Invoice No:</th>
					<td><input type="text" name="invoiceNo" id="invoiceNo" required="required"> </td>
					<td colspan="2"><input type="submit" value="送出"> </td>
				</tr>
			</table>
		</form>
			<h3 id="message">${message}</h3>
			<c:if test="${!empty resultSet}">
				<d:role url="/ship/insertEDI.html">
					<div style="margin-bottom: 10px; margin-left: 600px;" >
						<form action="<c:url value="/ship/insertEDI.html"/>" method="post" id="insertForm">
							<input type="hidden" name="invoice_no" value="${invoiceNo}">
							<input type="submit" value="導入EDI">
						</form>
					</div>
				</d:role>
				
				<table border="1" style="width: 780px;">
					<tr>
						<th>序號</th>
						<th>客戶條碼</th>
						<th>棧板條碼</th>
						<th>出貨日期</th>
						<th>Invoice No</th>
						<th>PONo</th>
						<th>Barcode</th>
						<th>國別</th>
					</tr>
					<c:forEach items="${resultSet}" var="map" varStatus="s">
						<tr>
							<td>${s.count}</td>
							<c:forEach items="${map}" var="entry" >
								<td>${entry.value } </td>
							</c:forEach>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			
		
		</div>
	</div>
</body>
</html>
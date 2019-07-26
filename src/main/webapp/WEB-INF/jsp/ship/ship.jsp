<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${modelName} 倉庫出貨</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/dumpling.css"/>" />
<script type="text/javascript" src="<c:url value="/js/jquery.js"/>"></script>
<script type="text/javascript">
$(function(){
	$("#palletId").focus();
	
	$("#shipForm").submit(function(){
		var $palletId = $("#palletId");
		var $invoiceNo = $("#invoiceNo");
		var $poNo = $("#poNo");
		
		var reg;
		
		if($palletId.val()==""){
			$palletId.focus();
			return false;
		}
		reg = new RegExp($palletId.attr("data-reg"));
		if(!reg.test($palletId.val())){
			alert("棧板條碼有誤! ");
			$palletId.select();
			return false;
		}
		
		if($invoiceNo.val()==""){
			$invoiceNo.focus();
			return false;
		}
		reg = new RegExp($invoiceNo.attr("data-reg"));
		if(!reg.test($invoiceNo.val())){
			alert("invoiceNo 有誤! ");
			$invoiceNo.select();
			return false;
		}
		
		if($poNo.val()==""){
			$poNo.focus();
			return false;
		}
		reg = new RegExp($poNo.attr("data-reg"));
		if(!reg.test($poNo.val())){
			alert("PoNo 有誤! ");
			$poNo.select();
			return false;
		}
		
	});
	$("#existButton").click(function(){
		if(confirm("確定要退出嗎?")){
			window.location.href='<c:url value="/index.html"/>';
		}
	});
});

</script>
</head>
<body>
<div id="mainbody">
<form id="shipForm"  method="post" action="<c:url value="/ship/ship.html"/>">
				<input name="poNo" type="hidden" value="${shipInfo.poNo}">
				<table style="width: 400px; " border="1" >
					<tr>
						<td colspan="2" style="text-align: right;"><b>倉庫出貨</b><span style="margin-left: 100px; margin-right: 10px;"><input type="button" value="退出" id="existButton"/></span></td>
					</tr>
				  <tr>
					<td>PO號</td>
					<td>${shipInfo.poNo}</td>
				  </tr>
				  <tr>
				  	<td>Invoice#</td>
				  	<td>${shipInfo.invoiceNo}</td>
				  </tr>
				  <tr>
				  	<td>货柜号</td>
				  	<td>${shipInfo.containerNo}</td>
				  </tr>
<%-- 				  <tr>
				  	<td>Barcode</td>
				  	<td>${shipInfo.shipBarcode.barcode}</td>
				  </tr> --%>
				  <tr align="center">
				  	<td colspan="2" style="padding: 0;">
						<table border="1" style="margin: 0; width:100%;">
						<caption>倉庫出貨</caption>
						  <tr align="center">
							<td>包装類型</td>
							<td>計畫出貨数量</td>
							<td>出貨数量</td>
							<td>尾数棧板</td>
						  </tr>
						 <c:forEach items="${plans}" var="plan" varStatus="a">
						  <tr align="center">
							<td>${plan.packType.name}</td>
							<td>${plan.planAmount}臺</td>
							<td>${plan.shipAmount}臺</td>
							<td>${(plan.planAmount- plan.shipAmount) % plan.packType.amount}臺</td>
						  </tr>
						 </c:forEach>
						</table>
					</td>
				  </tr>
				  <tr align="center">
				  	<td>请输入棧板條碼:</td>
					<td>
					<input id="palletId" name="palletId" type="text" data-reg="^DR\d{6}$" autofocus="autofocus">
					<input name="shipInfoId" type="hidden" value="${shipInfo.shipInfoId}" />
					</td>
				  </tr>
				   <tr align="center">
				  	<td>请输入Invoice#号:</td>
					<td>
					<input id="invoiceNo" name="invoiceNo" type="text" data-reg="${shipInfo.invoiceNo}">
					</td>
				  </tr>
				  <tr align="center">
				  	<td colspan="2"><input name="submit" type="submit" value="出货"></td>
				  </tr>
				</table>
				</form>
				<h3 id="message">${message}</h3>
				<c:if test="${!empty pallets}">
					<table border="1">
				  <tr align="center">
				  	<td>Item</td>
					<td>栈板号</td>
					<td>包装方式</td>
					<td>棧板數量</td>
					<td>包裝數量</td>
					<td>出貨PO</td>
					<td>出貨日期</td>
				  </tr>
				  <c:forEach items="${pallets}" var="pallet" varStatus="a">
				  <tr align="center">
				  	<td>${a.index+1}</td>
					<td>${pallet.palletId}</td>
					<td>${pallet.packType.name}</td>
					<td>${pallet.planAmount}</td>
					<td>${pallet.packAmount}</td>
					<td>${pallet.shipPlan.poplan.casemark2}</td>			
					<td><fmt:formatDate value="${pallet.shipDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				  </tr>
				  </c:forEach>
				</table>
				</c:if>
				
     </div>
</body>
</html>
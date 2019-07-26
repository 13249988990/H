<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<title>${modelName} 倉庫入庫</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/dumpling.css"/>" />
<style type="text/css">
 td{
 	padding: 1px 5px;
 }
</style>
<script type="text/javascript">
function quitAccept(){
	if(confirm("確定要退出嗎?")){
		window.location.href='<c:url value="/index.html"/>';
	}
}
</script>
</head>
<body>
<div>
        <div id="mainbody">
				<form  name="acceptForm" method="post" action="<c:url value="/ship/accept.html"/>">
					<input type="hidden" name="poId" value="${poId}"/>
				<table  border="1" style="width: 400px;">
				
				  <caption>倉庫入庫</caption>
				    <tr align="center">
					<td colspan="4" align="right"><b>PO號:${poId}</b><span style="margin-left: 100px; margin-right: 10px;"><input type="button" value="退出" onclick="quitAccept();"/></span></td>
				  </tr>
				  	<tr align="center">
							<td>包装方式</td>
							<td>計畫出貨数量</td>
							<td>入库数量</td>
							<td>尾数棧板</td>
						  </tr>
					<c:forEach items="${plans}" var="plan" varStatus="a">
						<tr align="center">
							<td>${plan.packType.name}</td>
							<td>${plan.planAmount}臺</td>
							<td>${plan.acceptAmount}臺</td>
							<td>${(plan.planAmount- plan.acceptAmount) % plan.packType.amount}臺</td>
						</tr>
					</c:forEach>
					<tr>
				  	<td align="center">请输入制品条码:</td>
					<td colspan="3">
					<input name="goodsId" type="text" >
					</td>
				  </tr>
				  <tr align="center">
				  	<td colspan="4"><input name="submit" type="submit" value="送出"></td>
				  </tr>
				</table>
				</form>
				<h4 style="color:#FF0000; ">${message}</h4>
                <c:if test="${!empty pallets}">
					<table border="1">
				  <tr align="center">
				  	<td>Item</td>
					<td>栈板号</td>
					<td>包装方式</td>
					<td>棧板數量</td>
					<td>包裝數量</td>
					<td>入庫日期</td>
				  </tr>
				  	 <c:forEach items="${pallets}" var="pallet" varStatus="a">
					  <tr align="center">
					  	<td>${a.index+1}</td>
						<td>${pallet.palletId}</td>
						<td>${pallet.packType.name}</td>
						<td>${pallet.planAmount}</td>
						<td>${pallet.packAmount}</td>
						<td><fmt:formatDate value="${pallet.acceptDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					  </tr>
				  </c:forEach>
				 
				</table>
				</c:if>
			</div>
    </div>
</body>
</html>
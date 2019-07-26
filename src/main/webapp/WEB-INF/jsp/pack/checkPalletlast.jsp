<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<%@ include file="../share/lib.jsp" %>
<title>${modelName} 生產管理系統--尾數栈板包装檢測情况</title> 
<script type="text/javascript" src="<c:url value="/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/validate.js"/>"></script>
<script type="text/javascript">
$(document).ready(function(){

	
});
</script>
</head>
<body>
<div>
        <div class="main">
                <div class="menu">
                <%@ include file="../share/menu.jsp"%>
                </div>
                <div id="mainbody" style="background-color:#ECE9D8">
				<form name="form1" method="post" action="<c:url value="/pack/checkPalletlast.html"/>" >
					<table border="1" id="formTable">
						<caption>尾數栈板包装檢測</caption>
						<tr>
							<td>栈板号:</td>
							<td class="myleft"><input value="${palletId}" <c:if test="${palletChangeAble=='N'}">readonly</c:if>  name="palletId" type="text" required="required"></td>
						</tr> 
						<tr>
							<td colspan="2"><button type="submit">送出</button></td>
						</tr>
					</table>
				</form> 
				<br>
				<c:if test="${!empty packAmount}"><c:out value="已入棧板數：${count}  ,  應入棧板總數：${packAmount}  ,  計劃入棧板總數：${planAmount}"></c:out></c:if> 
				
				<h3 id="message">${message}</h3> 
				<table border="1" id="table1">
				<c:if test="${!empty checkGoodList}">
					<tr> 
					 		<th>序號</th>
					 		<th>棧板編號</th>
							<th>包裝條碼</th> 
							<th>包裝日期</th> 
							<th>箱號</th> 
							<th>客戶條碼</th> 
							<th>附件包條碼</th> 
							<th>檢測日期</th>
					</tr>
				<c:forEach items="${checkGoodList}" var="CheckPalletGoods" varStatus="i">
						<tr> 
							<td>${i.count}</td> 
							<td>${CheckPalletGoods.palletid}</td>
							<td>${CheckPalletGoods.goodsId}</td>   
							<td> <fmt:formatDate value="${CheckPalletGoods.packDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td>${CheckPalletGoods.boxNo}</td> 
							<td>${CheckPalletGoods.barcode}</td> 
							<td>${CheckPalletGoods.attachment}</td> 
							<td> <fmt:formatDate value="${CheckPalletGoods.checkDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td> 
							
						</tr>
				</c:forEach>
				</c:if>
				</table>
				 
                </div>
        </div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="../share/lib.jsp" %>
<title>${modelName} 出貨退回</title>
<script type="text/javascript">
	function goBack(palletId){
		if(confirm("確定要退回嗎?")){
			location.href='<c:url value="/ship/unship.html?palletId='+palletId+'"/>';
		}
	}
</script>
</head>
<body>
	<div class="main">
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<div id="mainbody">
			<form name="form1" method="post"
				action="<c:url value="/ship/toUnship.html"/>">
				<table>
					<caption>出貨退回</caption>
					<tr>
						<td>請輸入栈板号:</td>
						<td><input name="palletId" type="text" required="required"></td>
						<td><input type="submit" name="Submit" value="送出"></td>
					</tr>
				</table>
			</form>
			<br>
			<h3 id="message">${message}</h3>
			<br>
			<c:if test="${!empty goodses}">
				<table border="1">
					<tr align="center">
						<td>Item</td>
						<td>机台序号</td>
						<td>栈板号</td>
						<td>出貨PO</td>
						<td>包裝方式</td>
						<td>入庫日期</td>
						<td>出貨日期</td>
					</tr>
					<c:forEach items="${goodses}" var="goods" varStatus="a">
						<tr align="center">
							<td>${a.index+1}</td>
							<td>${goods.goodsId}</td>
							<td>${goods.pallet.palletId}</td>
							<td>${goods.pallet.shipPlan.poplan.casemark2}</td>
							<td>${goods.pallet.shipPlan.packType.name}</td>
							<td><fmt:formatDate value="${goods.pallet.acceptDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td><fmt:formatDate value="${goods.pallet.shipDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						</tr>
					</c:forEach>
				</table>
				<div style="margin: 10px 10px; text-align: center;">
					<input style="color: black;" type="button" value="出貨退回"
						onclick="goBack('${goodses[0].pallet.palletId}');">
				</div>
			</c:if>
		</div>
	</div>
</body>
</html>
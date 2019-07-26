<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="../share/lib.jsp"%>

<title>${modelName} 生產管理系統--棧板查詢</title>
<style type="text/css">
	#palletInfo td{
	white-space:nowrap;
	padding: 2px;
	font-size: 13px;
	}
</style>
</head>

<body style="background-color: #ECE9D8">
	<div class="main">
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<div id="mainbody">
			<form id="myform" action="<c:url value="/machine/queryPallet.html"/>">
						<table style="text-align: center; margin: 0 auto;">
							<tr>
								<td>請輸入棧板條碼:</td>
								<td><input type="text" name="palletId"> </td>
								<td><input type="submit" value="送出"> </td>
							</tr>
						</table>
					
				</form>
			<h3 style="color:#FF0000; text-align: center;">${message}</h3>
			<c:if test="${pallet != null}">
			<table border="1">
				<caption>棧板資料</caption>
				<tr>
					<th>棧板條碼</th>
					<th>包裝數量</th>
					<th>棧板狀態</th>
					<th>包裝日期</th>
					<th>入庫時間</th>
					<th>出庫時間</th>
				</tr>
				<tr>
					<td>${pallet.palletId}</td>
					<td>${pallet.packAmount}</td>
					<td>${pallet.state.name}</td>					
					<td><fmt:formatDate value="${pallet.packDate}" pattern="yyyy-MM-dd HH:mm"/></td>
					<td><fmt:formatDate value="${pallet.acceptDate}" pattern="yyyy-MM-dd HH:mm"/></td>
					<td><fmt:formatDate value="${pallet.shipDate}" pattern="yyyy-MM-dd HH:mm"/></td>
				</tr>
			</table>
			</c:if>
			<br/>
			<c:if test="${!empty machineses}">
					<table style="width: 700px;" border="1">
					<caption>機臺投入資料</caption>
					  <tr align="center">
						<td>Item</td>
						<td>機臺條碼</td>
						<td>入板时间</td>
					  </tr>	
					  <c:forEach items="${machineses}" var="machines" varStatus="a">
					  <tr align="center">
						<td>${a.index+1}</td>
						<%-- <td>${goods.order.orderId}</td> --%>
						 <td>${machines.machineId}</td> 
						 <td><fmt:formatDate value="${machines.packDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						  </tr>
						  </c:forEach>
					</table>
				</c:if>
		</div>
	</div>

</body>
</html>
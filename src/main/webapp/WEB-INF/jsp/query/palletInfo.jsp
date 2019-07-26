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
			<form id="myform" action="<c:url value="/query/queryPallet.html"/>">
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
					<th>包裝類型</th>
					<th>包裝數量</th>
					<th>包裝流程</th>
					<th>包裝狀態</th>
					<th>出貨po</th>
					<th>包裝日期</th>
					<th>製造入庫</th>
					<th>倉庫入庫</th>
					<th>倉庫出貨</th>
				</tr>
				<tr>
					<td>${pallet.palletId}</td>
					<td>${pallet.packType.name}</td>
					<td>${pallet.packAmount}</td>
					<td>${pallet.route.routeName}</td>
					<td>${pallet.state.name}</td>
					<td>${pallet.shipPlan.poplan.casemark2}</td>
					
					<td><fmt:formatDate value="${pallet.packDate}" pattern="yyyy-MM-dd HH:mm"/></td>
					<td><fmt:formatDate value="${pallet.storageDate}" pattern="yyyy-MM-dd HH:mm"/></td>
					<td><fmt:formatDate value="${pallet.acceptDate}" pattern="yyyy-MM-dd HH:mm"/></td>
					<td><fmt:formatDate value="${pallet.shipDate}" pattern="yyyy-MM-dd HH:mm"/></td>
				</tr>
			</table>
			</c:if>
			<br/>
		<c:if test="${!empty goodses}">
					<table border="1" id="palletInfo">
					<caption>機臺投入資料</caption>
					  <tr align="center">
						<td>Item</td>
						<td>生產工單</td>
						<td>包裝工單</td>
						<td>机台條碼</td>
						<td>主板條碼</td>
						<td>投入日期</td>
						<!-- <td>MAC條碼</td> -->
						<td>客戶條碼</td>
						<td>綁定日期</td>						
						<td>附件包條碼</td>						
					  </tr>	
					  <c:forEach items="${goodses}" var="map" varStatus="a">
					  <tr align="center">
						<td>${a.index+1}</td>
						<c:forEach items="${map}" var="entry" varStatus="s">
							<td>
								<c:if test="${s.count==7}">
									<fmt:formatDate value="${entry.value}" pattern="yyyy-MM-dd HH:mm"/>
								</c:if>
								<c:if test="${ s.count!=7}">
									${entry.value}
								</c:if>
							</td>
						</c:forEach>
					  </tr>
					  </c:forEach>
					</table>
				</c:if>
		</div>
	</div>

</body>
</html>
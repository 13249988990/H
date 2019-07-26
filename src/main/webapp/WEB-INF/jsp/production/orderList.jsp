<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<%@ include file="../share/lib.jsp" %>
<title>${modelName} 生產管理系統--選擇投入工單</title>
<script type="text/javascript">
$(document).ready(function(){
	$(function(){
		$("#closeButton").click(function(){
			window.location.href='<c:url value="/attachment/selectOrder.html"/>';
		});
	});
	
});
</script>
</head>
<body>
	<div>
		<div class="main">
			<div class="menu">
				<%@ include file="../share/menu.jsp"%>
			</div>
			<div id="mainbody">
				<table border="1">
					<caption>投入工單列表   <input type="button" value="顯示所有未完成工單" id="closeButton" style="margin-left: 20px;"/></caption>
					<tr>
						<th>序號</th>
						<th>線別</th>
						<th>流程名</th>
						<th>工单号</th>
						<th>工单数量</th>
						<th>投入数量</th>
						<th>未投入数量</th>
						<th>完成状态</th>
						<th>建立时间</th>
					</tr>
					<c:forEach items="${orders}" var="order" varStatus="i">
						<tr align="center">
							<td>${i.count}</td>
							<td>${order.line}</td>
							<td>${order.route.routeName}</td>
							<td><c:if test='${order.route.routeType=="PRODUCTION"}'>
									<a
										href="<c:url value="/production/selectOrder.html?orderId=${order.orderId}&&routeId=${order.route.routeId}"/>">${order.orderId}</a>
								</c:if> 
								<c:if test='${order.route.routeType=="ATTACHMEN"}'>
									<a
										href="<c:url value="/attachment/selectOrder.html?orderId=${order.orderId}&&routeId=${order.route.routeId}"/>">${order.orderId}</a>
								</c:if>
								
								<c:if test='${order.route.routeType=="PACK"}'>
									<a href='<c:url value="/pack/selectPlan.html?orderId=${order.orderId}"/>'>${order.orderId}</a>
								</c:if>
							</td>
							<td>${order.planAmount}</td>
							<td>${order.putInAmount}</td>
							<td>${order.planAmount - order.putInAmount}</td>
							<td>${order.state.name}</td>
							<td> <fmt:formatDate value="${order.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
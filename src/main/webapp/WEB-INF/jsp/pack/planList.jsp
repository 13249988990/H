<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<%@ include file="../share/lib.jsp" %>
<title>${modelName} 生產管理系統--出貨計畫列表</title>
<script type="text/javascript">
$(document).ready(function(){
	$(function(){
		$("#closeButton").click(function(){
			window.location.href='<c:url value="/pack/toPack.html"/>';
		});
	});
	
	$("#palletId").blur(function(){
		
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
				<h3 id="message">${message}</h3>
				<table border="1" id="table1">
					<caption>出貨計劃列表  <input type="button" value="顯示所有未完成計畫" id="closeButton" style="margin-left: 20px;"/></caption>
					<tr>
						<th>序號</th>
						<th>國別</th>
						<th>工单号</th>
						<th>包裝方式</th>
						<th>工单数量</th>
						<th>包裝数量</th>
						<th>未包裝数量</th>
						<th>完成状态</th>
						<th>建立时间</th>

					</tr>

					<c:forEach items="${plans}" var="plan" varStatus="i">
						<tr>
							<td>${i.count}</td>
							<td>${plan.route.routeName}</td>
							<td><a
								href='<c:url value="/pack/toPack.html?planId=${plan.planId}"/>'>${plan.lotId}</a>
							</td>
							<td>${plan.packType.name}</td>
							<td>${plan.planAmount}</td>
							<td>${plan.packAmount}</td>
							<td>${plan.planAmount - plan.packAmount}</td>
							<td>${plan.packState.name}</td>
							<td><fmt:formatDate value="${plan.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
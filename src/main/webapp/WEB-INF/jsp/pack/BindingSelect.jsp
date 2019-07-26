<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="../share/lib.jsp" %>
<title>${modelName} 生產管理系統</title>
<style type="text/css">
#myTable td{
		width: 100px;
		height: 50px;
		text-align:  center;
		font-size: 20px;
		font-weight: bold;	
	}
#myTable td input{
	text-align: center;
}
#packType{
	display: none;
}
</style>
<script>
 $(document).ready(function(){
	$("#submit1").click(function(){
		var routeId = ($("#orderId").val());
		
		if(routeId==null||routeId==""){
			alert('請輸入包裝工單號！');
			return false;
		};
		
		
		
		reg = new RegExp($("#orderId").attr("data-reg"));
		
		
		if(!reg.test($("#orderId").val())){
			alert("工單條碼有誤! ");
			$("#orderId").val("");
			
			return false;
		}
		
	});
	$(function(){
		$("#closeButton").click(function(){
			window.location.href='<c:url value="/production/InBinding.html"/>';
		});
	});
	

}); 

</script>
</head>
<body style="background-color:#ECE9D8">
	<div style="text-align: center;">
		<div class="main">
			<div class="menu">
				<%@ include file="../share/menu.jsp"%>
			</div>
			<div id="mainbody">
				<form id="orderForm" method="post"
					action="<c:url value="/production/selectPlan.html"/>">
					<%-- <input type="hidden" value="${currentTime}" id="currentTime"> --%>
					<table border="1" style="width: 400px;">
						<caption>客戶條碼綁定-包裝工單填寫</caption>
						<tr>
							<td colspan="2">工單號：<input type="text" required="required" name="orderId" id="orderId" data-reg="^S[PRK]1[3-9]\d{2}P\d{2}$"></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" id="submit1" value="送出"></td>
						</tr>
					</table>
					<h3 style="color: #FF0000">${message}</h3>
					
				</form>
				<br/><br/>
			<table border="1" id="orderTable">
					<caption>投入工單列表   <input type="button" value="顯示未完成的包裝工單" id="closeButton" style="margin-left: 20px;"/></caption>
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
							<td>
								<a href='<c:url value="/production/selectPlan.html?orderId=${order.orderId}"/>'>${order.orderId}</a>
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
<!-- InstanceEnd --></html>
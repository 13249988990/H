<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<%@ include file="../share/lib.jsp" %>
<title>${modelName} 工單查詢</title>
</head>
<script type="text/javascript">
$(function(){
	var attr = $("#currentTime").val().split("-");
	var year = parseInt(attr[0]);
	var month = parseInt(attr[1]);
	var yearHtml = "";
	for(var i=year-5; i<year+5; i++){
		if(i==year){
			yearHtml += "<option selected='selected' value="+i+">"+i+"</option>";
		}else{
			yearHtml +="<option value="+i+">"+i+"</option>";
		}
		
	}
	$("#planYear").append(yearHtml);
	var monthHtml = "";
	for(var i=1; i<=12; i++){
		if(i==month){
			monthHtml+="<option selected='selected' value="+i+">"+i+"</option>";
		}else{
			monthHtml+="<option value="+i+">"+i+"</option>";
		}
	}
	$("#planMonth").html(monthHtml);
	
	$("#orderTable .orderState").each(function(){
		if($(this).text()=="已完成"){
			$(this).css("color","red");
		}
	});
	$(".delOrder").click(function(){
		if(confirm("确定要删除吗?")){
			window.location.href='<c:url value="/order/delete.html?orderId="/>'+$(this).attr("id");
		}
	});
	
	$(".orderState").each(function(index){
		if("未生產"==$(this).text()){
			$(".delOrder").eq(index).attr("disabled",false);
		};
	});
});
</script>

<body style="background-color:#ECE9D8">
<div>
        <div class="main">
                <div class="menu">
                <%@ include file="../share/menu.jsp"%>
                </div>
                <div id="mainbody">
         		<form action="<c:url value="/order/list.html"/>" method="post">
         		<input type="hidden" value="${currentTime}" id="currentTime">
         			<input type="hidden" name="query" value="true">
         				<table border="1" id="formTable">
         					<caption>工單查詢</caption>
         					<tr>
         						<td>工單號:</td>
         						<td class="myleft"><input name="orderId" type="text" value="${orderId}"></td>
         					</tr>
         					<tr>
         						<td>狀態:</td>
         						<td class="myleft">
         							<select name="state" style="width: 155px;">
		         						<option value="">請選擇</option>
		         						<c:forEach items="${states}" var="state">
		         							<c:if test="${state==myState}"><option value="${state}" selected="selected">${state.name}</option></c:if>
		         							<c:if test="${state!=myState}"><option value="${state}">${state.name}</option></c:if>
		         						</c:forEach>
		         					</select>
         						</td>
         					</tr>
         					<tr>
							<td>流程</td>
							<td class="myleft"><select name="routeId" id="routeId" style="width: 155px;">
									<option value="">請選擇</option>
									<c:forEach items="${productions}" var="route">
										<c:if test="${route.routeId == myRouteId}"><option value="${route.routeId}" selected="selected">${route.routeName}</option></c:if>
										<c:if test="${route.routeId != myRouteId}"><option value="${route.routeId}">${route.routeName}</option></c:if>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<td>線別</td>
							<td class="myleft"><select name="line" id="line" style="width: 155px;">
									<option value="">請選擇</option>
									<c:forEach items="${lines}" var="line" varStatus="v">
										<c:if test="${line==myLine}"><option value="${line}" selected="selected">${line}</option></c:if>
										<c:if test="${line != myLine}"><option value="${line}">${line}</option></c:if>										
									</c:forEach>
							</select></td>
						</tr>
         					<tr>
         						<td>生產日期:</td>
         						<td class="myleft">
         							<select name="planYear" id="planYear" class="font_input" style="width: 60px; ">
	         						<option>請選擇</option>
	         						</select>年
								<select name="planMonth" id="planMonth" class="font_input"  style="width: 60px; ">
									<option>請選擇</option>
								</select>月
         						</td>
         					</tr>
         					<tr>
         						<td colspan="2"><input type="submit" value="送出"> </td>
         					</tr>
         				</table>
		         	</form>
		         	<br/><br/>
		         	<table border="1"  id="orderTable">
					 	<tr>
					 		<th>序號</th>
					 		<th>線別</th>
							<th>流程名</th>
							<th>國別</th>
							<th>生產日期</th>
							<th>工单号</th>
							<th>包裝方式</th>
							<th>工单数量</th>
							<th>投入数量</th>
							<th>未投入数量</th>
							<th>完成状态</th>
							<d:role url="/order/delete.html">
								<th>工单删除</th>
							</d:role>
							<th>投入资料</th>
						</tr>
					
					<c:forEach items="${orders}" var="order" varStatus="i">
						<tr align="center">
							<td>${i.count}</td>
							<td>${order.line}</td>
							<td>${order.route.routeName}</td>
							<td>${order.location.locationName}</td>
							<td>${order.planYear}-${order.planMonth}</td>
							<td>
							<c:if test='${order.route.routeType=="PRODUCTION"}'>
								<a href='<c:url value="/production/selectOrder.html?orderId=${order.orderId}"/>'>${order.orderId}</a>
							</c:if>
							<c:if test='${order.route.routeType=="ATTACHMEN"}'>
								<a href='<c:url value="/attachment/selectOrder.html?orderId=${order.orderId}"/>'>${order.orderId}</a>
							</c:if>
							<c:if test='${order.route.routeType=="PACK"}'>
								<a href='<c:url value="/production/selectPlan.html?orderId=${order.orderId}&&type='small'"/>'>${order.orderId}</a>
							</c:if>
							</td>
							<td>${order.packType.name}</td>
							<td>${order.planAmount}</td>
							<td>${order.putInAmount}</td>
							<td>${order.planAmount - order.putInAmount}</td>
							<td>
								<span class="orderState">${order.state.name}</span>
							</td>
							<d:role url="/order/delete.html">
								<td>
									<button type="button" class="delOrder" id="${order.orderId}" disabled="disabled">删除</button>
								</td>
							</d:role>
							<td>
								<a href='<c:url value="/order/showComponents.html?orderId=${order.orderId}"/>'>投入资料 </a>
							</td>
						</tr>
					</c:forEach>	 
					 </table>
	         	</div>
  	</div>
</div>

</body>
</html>
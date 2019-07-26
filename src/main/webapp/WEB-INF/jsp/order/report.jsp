<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../share/include.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../share/lib.jsp" %>
<title>Scone2QIS  生產報表</title>
<style type="text/css">

#report th, td{
	white-space:nowrap;
	padding: 1px;
	font-size: 12px;
}
#report {
	margin:5px;
}

</style>
<script type="text/javascript">
$(function(){
	var year = parseInt('${planYear}');
	var month = parseInt('${planMonth}');
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
	
	$("#planYear").val('${planYear}');
	$("#planMonth").val('${planMonth}');
	$("#homeButton").click(function(){
		window.location.href='<c:url value="/index.html" />';
	});
	
	$("#report tr:not(:eq(0))").each(function(){
	    //alert($(this).children("td:eq(7)").html())
	    if($(this).children("td:eq(7)").html()==''&&$("#currentDay").val()>$(this).children("td:eq(6)").html()){
			$(this).css('background-color','#8EE5EE')
	    }
	})
});
</script>

</head>
<body>
<div id="mainbody" style="width: 1400px; margin-right: 20px;overflow:auto;">
<form action='<c:url value="/order/report.html"/>'>
	<input type="text" id="currentDay" value="${currentDay }">
	<table>
			<tr>
			
			<td style="width: 100px; text-align: left;"><button type="button" id="homeButton">返回首页</button> </td>
				<td style="font-size: 20px; font-weight: bold;">請選擇日期:</td>
				<td>
					<select id="planYear" name="planYear" style="font: 14px; font-weight: bold;">
					</select>
				</td>
				<td>
					<select id="planMonth" name="planMonth" style="font: 14px; font-weight: bold;">
					</select>
				</td>
				<td><input type="submit" value="送出" id="dateButton"></td>
			</tr>
		</table>
</form>
	<table border="1" id="report" style="width: 1400px;">
					 	<tr>
					 		<th>工单号</th>
					 		<th>線別</th>
							<th>流程名</th>
							<th>國別</th>
							<th>工单数</th>
							<th>投入数</th>
							<th>计划完成</th>
							<th>实际完成</th>
							<c:forEach begin="1" end="31" step="1" var="i">
								<th>${i}</th>
							</c:forEach>
						</tr>
					
					<c:forEach items="${orders}" var="order" varStatus="i">
						<tr align="center">
							<td>${order.orderId}</td>
							<td>${order.line}</td>
							<td>${order.route.routeName}</td>
							<td>${order.location.locationName}</td>
							<td>${order.planAmount}</td>
							<td>${order.putInAmount}</td>
							<td><fmt:formatDate value="${order.planDate}" pattern="yyyy-MM-dd"/></td>
							<td><fmt:formatDate value="${order.realDate}" pattern="yyyy-MM-dd"/></td>
							<c:forEach begin="1" end="31" step="1" var="i">
								<td style="width: 40px;">
									<c:forEach items="${order.productionDates}" var="productionDate">
										<c:if test="${productionDate.produceDate!=null && i==productionDate.produceDate}">
											${productionDate.amount}
										</c:if>
									</c:forEach>
								</td>
							</c:forEach>
						</tr>
					</c:forEach>	 
					 </table>
</div>

</body>
</html>
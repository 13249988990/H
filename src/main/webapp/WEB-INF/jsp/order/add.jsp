<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="../share/lib.jsp" %>
<title>${modelName} 生產管理系統--創建工單</title>
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
	var attr = $("#currentTime").val().split("-");
	var year = parseInt(attr[0]);
	var month = parseInt(attr[1]);
	var yearHtml = "";
	for(var i=year; i<year+5; i++){
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
	var today = parseInt(attr[2]);
	drowDate(year,month,today);
	
	/**
	* 畫日曆
	*/

	function drowDate(year, month, today){
		var date = new Date(year,month-1,1);
		var date2 = new Date(year,month,0);
		var day_num = date2.getDate();
		var day = date.getDay();
		var html = "<tr><th>星期天</th><th>星期一</th><th>星期二</th><th>星期三</th><th>星期四</th><th>星期五</th><th>星期六</th></tr>";
		var row = (day_num+day) % 7 == 0 ? (day_num+day) / 7 : (day_num+day) / 7 + 1;
		for(var i=1; i<=row; i++){
			html += "<tr>";
			for(var j=1; j<=7; j++){
				html+="<td></td>";
			}
			html += "</tr>";
		}
		$("#myTable").append(html);
		var count = 1;
		$("#myTable td").each(function(index){
			if(index>=day && count <= day_num){
				$(this).html(count+"<br/><input type='text' name='processAmount' class='dayAmount' size=5 />");
				if(count==today){
					$(this).css("background-color","red");
				}
				count++;
			}
		});
	}

	$("#planYear,#planMonth").change(function(){
		year = parseInt($("#planYear").val());
		month = parseInt($("#planMonth").val());
		$("#myTable").html("");
		drowDate(year,month,today);
	});
	
	

	
	$("#orderForm").bind("submit",function(){
		var reg = new RegExp($("#orderId").attr("data-reg"));
		if($("#routeId").val()==""){
			alert("请选择流程");
			$("#routeId").focus();
			return false;
		}
		if($("#locationId").val()==""){
			
			alert("请选择國別");
			$("#locationId").focus();
			return false;
		}
		var location = $("#routeId option:selected").attr("data-location");
		
		if(location  && location != $("#locationId").val()){
			alert("选择流程和国别不一致");
			return false;
		}
		if($("#packTypeId").val()=="" && $("#packType").css("display")!='none'){
				alert("请选择包裝方式!");
				
				$("#packTypeId").focus();
				return false;
		}
		if($("#orderId").val()==""){
			alert("请輸入工單號");
			
			$("#orderId").focus();
			return false;
		}else if(!reg.test($("#orderId").val())){
			alert("工單號編碼有誤!"+$("#orderId").val()+"=="+reg);
			$("#orderId").select();
			return false;
		}
		if(isNaN($("#planAmount").val())){
			alert("工單數量值只能是數字");
			$("#planAmount").select();
			return false;
		}
		if($("#planAmount").val()<=0){
			alert("请輸入工單數量");
			$("#planAmount").focus();
			return false;
		}
		
		
		if($("#myLine").val()==""){
			alert("请選擇線別");
			$("#myLine").focus();
			return false;
		}
		var total = 0;
		$("#myTable .dayAmount").each(function(index){
			var dayAmount = $(this).val();
			if(dayAmount && !isNaN(dayAmount)){
				total += parseInt(dayAmount);
			}
		});
		if(total != parseInt($("#planAmount").val())){
			alert("排程總數量與工單數量不相等!");
			return false;
		}
		
	});
	packTypeShow($("#routeId").val());
	$("#routeId").change(function(){
		var routeId = parseInt($(this).val());
		if(routeId==1||routeId==2||routeId==545538||routeId==545539){
			//alert($("#locationId").val(21))
            $("#locationId").val(21);
			$("#locationId").children("option[value='"+21+"']").show();
            $("#locationId").attr("disabled",true);
        }else{
            $("#locationId").val("");
            $("#locationId").attr("disabled",false);
 			$("#locationId").children("option[value='"+21+"']").hide();
 			for(i=31;i<=34;i++)
			{
				$("#locationId").children("option[value='"+i+"']").hide();
			}
        }
		if(routeId > 0){
			$.get('<c:url value="/route/getOrderRegex.html"/>', {"routeId":routeId}, function(data){
				if(data){
					$("#orderId").attr("data-reg",data);
				}
			});
		}
		packTypeShow(routeId);
	});
	
	function packTypeShow(routeId){
		var routeType = $("#routeId option[value="+routeId+"]").attr("title");
		if('PACK'==routeType){
			$("#packType").show();
		}else{
			$("#packType").hide();
		}
	}
	
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
					action="<c:url value="/order/add.html"/>">
					<input type="hidden" value="${currentTime}" id="currentTime">
					<table border="1" style="width: 400px;">
						<caption>新增工單</caption>
						<tr>
							<td>生產流程</td>
							<td class="myleft"><select name="routeId" id="routeId" class="font_input">
									<option value="">請選擇</option>
									<c:forEach items="${routes}" var="route">
										<option value="${route.routeId}" data-location="${route.location.locationId }" title="${route.routeType}">${route.routeName}</option>
									</c:forEach>
							</select></td>
						</tr>
						<tr id="location">
						<td>國別:</td>
						<td class="myleft"><select name="locationId" id="locationId"
							style="width: 155px;">
								<option value="">請選擇</option>
								<c:forEach items="${locations}" var="location">
									<c:if test="${locationId==location.locationId}">
										<option value="${location.locationId}" selected="selected">${location.locationName}-${location.locationType}-${location.serialType}</option>
									</c:if>
									<c:if test="${locationId!=location.locationId}">
										<option value="${location.locationId}">${location.locationName}-${location.locationType}-${location.serialType}</option>
									</c:if>
								</c:forEach>
						</select></td>
					</tr>
					<tr id="packType">
						<td>包裝方式:</td>
						<td class="myleft"><select name="packTypeId" id="packTypeId"
							style="width: 155px;">
								<option value="">請選擇</option>
								<c:forEach items="${packTypes}" var="packType">
									<c:if test="${packTypeId==packType.packTypeId}">
										<option value="${packType.packTypeId}" selected="selected">${packType.name}</option>
									</c:if>
									<c:if test="${packTypeId!=packType.packTypeId}">
										<option value="${packType.packTypeId}">${packType.name}</option>
									</c:if>
								</c:forEach>
						</select></td>
					</tr>
						<tr>
							<td>工單號</td>
							<td class="myleft"><input name="orderId" id="orderId" type="text"
								autofocus="autofocus" data-reg="^IP1[3-5]\w{5}$" ></td>
						</tr>
						<tr>
							<td>工單數量</td>
							<td class="myleft"><input name="planAmount" id="planAmount" type="text"
								 data-reg="[1-9]{0,3}" ></td>
						</tr>
						<tr>
							<td>線別</td>
							<td class="myleft"><select name="myLine" id="myLine">
									<option value="">請選擇</option>
									<c:forEach items="${lines}" var="line" varStatus="v">
										<option value="${line}">${line}</option>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<td>生產日期</td>
							<td class="myleft"> <select name="planYear" id="planYear" style="width: 60px;">
							</select>年 <select name="planMonth" id="planMonth" style="width: 60px;">
							</select>月 </td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="送出"></td>
						</tr>
					</table>
					<h3 style="color: #FF0000">${message}</h3>
					<table id="myTable" border="1">
					</table>
				</form>
				
			</div>
		</div>
	</div>

</body>
<!-- InstanceEnd --></html>
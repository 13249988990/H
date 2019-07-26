<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../share/lib.jsp" %>
<style type="text/css">
#myTable td,#myTable th{
	width:80px;
	height: 40px;
}
.dateClass{
	font: 20px;
	font-weight: bold;
}
</style>
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
		$("#year").append(yearHtml);
		var monthHtml = "";
		for(var i=1; i<=12; i++){
			if(i==month){
				monthHtml+="<option selected='selected' value="+i+">"+i+"</option>";
			}else{
				monthHtml+="<option value="+i+">"+i+"</option>";
			}
		}
		$("#month").html(monthHtml);
		var today = parseInt(attr[2]);
		drowDate(year,month,today);
		
		$("#dateButton").click(function(){
			year = parseInt($("#year").val());
			month = parseInt($("#month").val());
			$("#myTable").html("");
			drowDate(year,month,today);
		});
		
		/*
		*從服務器取得數據
		*/
		function showOrderList(){
			var date = $(this).attr("id");
			if(date){
				$.get('<c:url value="/order/getTodayOrders.html" />',{today:date},function(data){
					$("#orderList").html("");
					if(data){
						var html = "<div class='dateClass'>日期:"+date+"<br/></div><table border='1' id='tableOrder'><tr><th>線別</th><th>機種</th><th>國別</th><th>工單</th><th>工單數</th><th>當日產量</th><th>投入產量</th></tr>";
						for(var i=0; i<data.length; i++){
							html += "<tr><td>"+data[i].line+"</td><td>"+data[i].route+"</td><td>"+data[i].locationName+"</td><td>"+data[i].orderId+"</td><td>"+data[i].planAmount+"</td><td>"+data[i].todayAmount+"</td><td>"+data[i].putInAmount+"</td></tr>";
						}
						html += "</table>";
						$("#orderList").append(html);
					}else{
						$("#orderList").append("<h3 class='dateClass'> 日期:"+date+" 沒有工單</h3>");
					}
					
				});
			}
		}
			
			
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
					$(this).text(count);
					$(this).bind("mouseover",showOrderList);
					$(this).css("cursor","pointer");
					if(count==today){
						$(this).css("background-color","red");
					}
					$(this).attr("id",year+"-"+month+"-"+count);
					count++;
				}
			});
		}
		
	});
</script>
<title>${modelName} 生產管理系統</title>
</head>
<body>
<div id="main">
	<div class="menu">
	<%@ include file="../share/menu.jsp"%>
</div>
<div id="mainbody">
	<input type="hidden" value="${currentTime}" id="currentTime">
	<table>
		<tr>
			<td style="font-size: 20px; font-weight: bold;">請選擇日期:</td>
			<td>
				<select id="year">
				</select>
			</td>
			<td>
				<select id="month">
				</select>
			</td>
			<td><input type="button" value="送出" id="dateButton"></td>
		</tr>
	</table>
	<table id="myTable" border="1">
	</table>
	<br/>
	<div id="orderList">
		
	</div>
</div>
</div>
</body>
</html>
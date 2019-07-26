<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../share/include.jsp" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="pragma" content="no-cache"/> 
<meta http-equiv="cache-control" content="no-cache"/> 
<meta http-equiv="expires" content="0"/>   
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<%@include file="../share/lib.jsp" %>
<title>${modelName} 生產管理系統</title>
<style type="text/css">
body{
	font-size: 14px;
	background-color: #89DCB9;
	margin:0;
	padding:0;
}

#main{
	margin: 0 auto;
	width: 1400px;
}
#boardDiv table{
	margin: 0 auto;
	width: 1400px;
	text-align: center;
}
tr{
border: ridge;
border-color: black;
}
td{
border-color: black;
}

#boardDiv table thead{
	font-weight: bold;
	background-color: #FF9966;
}
#boardDiv table tbody{
	background-color: #FFF3E7;
}

#chartDiv{
	width: 1400px;
}
.chart{
border-left: 2px solid blue; 
border-bottom: 2px solid blue; 
border-top: 1px solid red; 
width: 100%; 
height: 200px;
margin-top: 5px;
}
#chartDiv .item{
	width: 55px;
	height: 200px;
	margin-left: 10px;
	background-color: white;
	float: left;
	text-align: center;
	position:relative;
}
#chartDiv .item img{
	width: 40px;
	height: 20px;
}
#chartDiv .show{
	width: 55px;
	position:absolute;
	bottom:0px;
	font-weight: bold;
	vertical-align: top;
	font-size: 20px;
}
#chartDiv .titles{
	float: left;
	margin-left: 10px;
	width: 55px;
	text-align: center;
	margin-top: 0px;
	font-weight: bold;
	font-size:10px;
	
}
#boardDiv .currentTimeId{
	background-color: #FF9966;
	color: white;
}
.countResults{
	color: red;
	font-size:50px;
	font:bold;
}

.peopleNumber,.productEfficiencys,.productTotal,.targetTotal,.difference,.targets,.standTotal{
	font-size:50px;
	font:bold;
}

</style>
</head>
<body>
<div id="main">
	<div id="boardDiv">
		<h1 style="text-align: center;">${today} ${modelName}  產能看板</h1>
		<input type="hidden" value="${size}" id="boardSize" name="boardSize"> 
		<input type="hidden" value="${intervalSize}" id="intervalSize" name="intervalSize">
		
		<table border="1" id="boardTable">
		<thead>
			<tr>
			<td rowspan="2">線別</td>
			<td rowspan="2">人力</td>
			<td rowspan="2">目標</td>
			<td colspan="4">上午(AM08:10--12:20)</td>
			<td colspan="8">下午(PM13:10--22:20)</td>

			<!--
			<td colspan="10">夜班(PM20:30--07:50)</td>
			-->
			<td colspan="2">PPH</td>
			<td rowspan="2">生產累計</td>
			<td rowspan="2">目標</td>
			<td rowspan="2">差異</td>
		</tr>
		<tr>
			<c:forEach items="${intervals}" var="interval">
				<td style="font-size: 9px;" class="intervals" title="${interval.id}">${interval.name}</td>
			</c:forEach>
			<td>標準</td>
			<td>實際</td>
		</tr>
		</thead>
		<tbody>
			<c:forEach items="${boards}" var="board" varStatus="a">
						<tr class="board">
					<td>${board.boardName}</td>
					<td class="peopleNumber">${board.peopleNumber}</td>
					<td class="targets">${board.target}</td>
					<c:forEach items="${intervals}" var="interval">
						<c:forEach items="${countResults}" var="countResult">
							<c:if test="${board.id== countResult.board.id && countResult.interval.id==interval.id}">
								<td title="id${countResult.id}" class="countResults" data-intervalid="${countResult.interval.id}">${countResult.count}</td>
							</c:if>
						</c:forEach>
					</c:forEach>
					
					<td class="standTotal">${targetEfficiencys[a.index]}</td>
					<td class="productEfficiencys">${productEfficiencys[a.index]}</td>
					<td class="productTotal">${productTotals[a.index]}</td>
					<td class="targetTotal">${board.totalTarget}</td>
					<td class="difference">${targetTotals[a.index]-productTotals[a.index]}</td>
				</tr>
			
			</c:forEach>
		</tbody>
	</table>
</div>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<div id="chartDiv">

<c:forEach items="${boards}" var="board">
<c:if test="${board.boardName=='PACK'}">
					<table style="width: 100%;" class="chartTable">
						<tr>
							<td style="width: 5%;">
								<div
									style="height: 200px; text-align: right; font-weight: bold; width: 100%;">
									<div style="height: 50%;">
										目标:<span class="target">${board.target}</span>
									</div>
									<div style="height: 50%">${board.boardName}</div>
								</div>
							</td>
							<td style="width: 95%; vertical-align: bottom;">
								<div class="chart">
									<c:forEach items="${countResults}" var="c">
										<c:if test="${c.board.id==board.id}">
											<div class="item">
												<div class="show" title="id${c.id}"
													data-target="${board.target }" data-count="${c.count}"></div>
											</div>
										</c:if>
									</c:forEach>
								</div>
							</td>
						</tr>
						<tr>
							<td style="width: 5%;"></td>
							<td style="width: 95%;"><c:forEach items="${intervals}"
									var="interval">
									<div class="titles">${interval.name}</div>
								</c:forEach></td>
						</tr>
					</table>
					<br/><br/>
</c:if>
</c:forEach>

<br style="float: none;"/>

</div>

</div>

<script type="text/javascript">
	
	$(function(){
		show();
		getData();
		calculate();
		setInterval(getData,30000);
		function show(){
			$("#chartDiv .show").each(function(index){
				$item = $("#chartDiv .item").eq(index);
				var target = parseInt($(this).attr("data-target"));
				var percentage = parseInt($(this).text())/target;
				var showHeight = parseInt($item.css("height")) * percentage;
				var html = $(this).text();
				$(this).css("height",showHeight);
				if(percentage >= 0.9 && percentage < 1){
					$(this).css("background-color","#FFCC00");
					html+="<img src='/Doraemon/images/cheer.gif'>";
				}else if(parseInt($(this).text())>=target){
					$(this).css("background-color","#00FF00");
					html+="<img src='/Doraemon/images/good.gif'>";
				}else{
					$(this).css("background-color","#FF0000");
				}
				$(this).html(html)
			});
		}
		function getData(){

			$.get('<c:url value="/board/getCountDatas.html"/>', function(data){
				$("div[title^='id'], td[title^='id']").each(function(){
					$(this).removeClass("currentTimeId");
					
					if(data[$(this).attr("title")]>0)
						$(this).text(data[$(this).attr("title")]);
					
					if($(this).attr("data-intervalid")==data.currentTimeId){
						$(this).addClass("currentTimeId");
					}
				});
				calculate();
				show();
			});
			
		}
		
	
		
		/*
		*統計
		*
		*/
		
		function calculate(){
			$("#boardTable .board").each(function(index){
				var $childrens = $(this).children();
				var peopleNumber = parseInt($(".peopleNumber").eq(index).text());
				var intervalSize = parseInt($("#intervalSize").val());
				var productTotal = 0;
				var $countResults = $(this).children(".countResults");
				$countResults.each(function(){
					productTotal += parseInt($(this).text());					
				});
				//生產累計
				$(".productTotal").eq(index).text(productTotal);
				//差異
				var target = parseInt($(".targetTotal").eq(index).text());
				$(".difference").eq(index).text(productTotal-target);
				//實際
				var  currentCount = parseInt($(".currentTimeId").eq(index).text());
				if(!isNaN(currentCount)){
					$(".productEfficiencys").eq(index).text((currentCount/peopleNumber).toFixed(2));
				}
				
			});
		}
		
	});
	
</script>
</body>
</html>

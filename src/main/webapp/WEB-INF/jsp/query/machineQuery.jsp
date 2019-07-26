<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<%@ include file="../share/lib.jsp"%>
<script type="text/javascript" src="<c:url value="/js/My97DatePicker/WdatePicker.js"/>"></script>
<style type="text/css">
th{
	padding: 2px 5px;
}
#show tr td{border: solid 1px;padding: 0px 5px 0px 5px}
</style>
<title>${modelName} MachineTest重测率查询</title>
<script type="text/javascript">
	/* $(function(){
		$("#show tr").each(function(i,item){
			if(i!=0){
				alert($(this).find("td:eq(5)").text())
			}
			
		})
	}) */
</script>
</head>

<body style="background-color: #ECE9D8">
	<div class="main" >
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<div id="mainbody">
			<form id="myForm" method="post" action="<c:url value="/query/machineQuery.html"/>">
				<table border="1">
					<caption>重测率查询</caption>
					<tr>
						<td>機型</td>
						<td><select name="model">
							<option value="1200">1200</option>
							<option value="1250">1250</option>
							<option value="1700">1700</option>
						</select></td>
					</tr>
					<tr class="date">
						<td>开始日期:</td>
						<td class="myleft"><input type="text" name="startTime" class="Wdate" id="startTime" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'2013-06-01 00:00:00'})" value="${beginDate}"/></td>
					</tr>
					<tr class="date">
						<td>截止日期:</td>
							<td class="myleft">
							<input type="text" name="endTime" class="Wdate" id="endTime" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'2013-06-01 00:00:00'})" value="${endDate}"/>
							</td>
					</tr>
					<tr>
						<td colspan="2"><button type="submit">送出</button> </td>
					</tr>
				</table>
			</form>
			<h3 style="color:red; text-align: center;" id="message">${message}</h3>
			 <c:if test="${not empty map }">
			<table id="show" width="50%" style="border: solid 1px;border-radius:5px">
				<caption>${title }</caption>
				<tr>
					<td>类型</td>
					<td>工站工时(s)</td>
					<td>总测试次数</td>
					<td>实际机台数</td>
					<td>重测率</td>
					<td>无效工时(s)</td>
					<td>有效工时率</td>
					<td>直通率</td>
				</tr>
				
				<c:forEach items="${map }" var="maps" >
					<tr>
					<td>${maps.type }</td>
					<td>${maps.workhour }</td>
					<td>${maps.totalCount }</td>
					<td>${maps.distinctCount }</td>
					<td>${maps.result }%</td>
					<td>${maps.invalidHour }</td>
					<td>${maps.validHour}%</td>
					<td>${maps.one_pass}%</td>
					</tr>
				</c:forEach>
				
				
				
				
			</table>
			<div id="total" style="width: 50%;margin: 0 auto;padding-top: 30px;font-size: 22px">
			工站无效工时:<span style="color: #000080 ">${totalInvalidHour}</span>&nbsp;&nbsp;&nbsp;&nbsp;
			工站有效工时率:<span style="color: #000080 ">${totalValidRate}%</span>
			</div>
			</c:if>
			
		</div>
	</div>
</body>
</html>
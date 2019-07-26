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
#repairTable{
	width: 1000px;
}
#repairTable td,#repairTable th{
	font-size: 14px;
}

</style>
<script>
$(function(){

	$("#myForm").submit(function(){
		
	});
	$('#repairTable').DataTable( {
		"dom": 'Bt'  ,
	    buttons: [
	        'excelHtml5'
	    ],
	    "lengthMenu":[[-1,10,20],['All',10,20]]
	} );
	
});
</script>
<title>${modelName} 生產管理系統--替换查询</title>

</head>

<body style="background-color: #ECE9D8">
	<div class="main" >
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<div id="mainbody">
			<form id="myForm" method="post" action="<c:url value="/query/replaceQuery.html"/>">
				<table border="1">
					<caption>替换查询</caption>
					
					<tr class="date">
						<td>开始日期:</td>
						<td class="myleft"><input type="text" name="beginDate"  id="beginDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'2013-06-01 00:00:00'})" /></td>
					</tr>
					<tr class="date">
						<td>截止日期:</td>
							<td class="myleft">
							<input type="text" name="endDate"  id="endDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'2013-06-01 00:00:00'})" />
							</td>
					</tr>
					<tr>
						<td>机台号码:</td>
						<td>
							<input type="text" id="componentId" name="componentId">
						</td>
					</tr>
					<tr>
						<td colspan="2"><button type="submit">送出</button> </td>
					</tr>
				</table>
			</form>
			<h3 style="color:red; text-align: center;" id="message">${message}</h3>
			<div id="showTable" style="width: 70%;margin: auto">
			<c:if test="${!empty list}">
		<%-- 	<h3 style="color:green; text-align: center;">總計: ${total}</h3> --%>
					<table border="1" id="repairTable">
					<thead>
						<th>序号</th>
						<th>关系条码</th>
						<th>替换时间</th>
						<th>操作类型</th>
						<th>旧条码</th>
						<th>新条码</th>
						<th>操作IP</th>
					
					</thead>
					<tbody>
					<c:forEach items="${list}" var="li" varStatus="s">
						<tr>
						<td>${s.count}</td>
						<td>${li.relationSn}</td>
						<td><fmt:formatDate value="${li.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
						
						<td>${li.functionName}</td>
						<td>${li.replaceBefore}</td>
						<td>${li.replaceAfter}</td>
						<td>${li.ip}</td>
				
					</tr>
					</c:forEach>
					</tbody>
				</table>
				</c:if>
				</div>
		</div>
	</div>
</body>
</html>
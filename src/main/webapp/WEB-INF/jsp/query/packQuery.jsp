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
</style>
<title>${modelName} 生產管理系統--包裝產出查询</title>

</head>

<body style="background-color: #ECE9D8">
	<div class="main" >
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<div id="mainbody">
			<form id="myForm" method="post" action="<c:url value="/query/packQuery.html"/>">
				<table border="1">
					<caption>包裝產出查询</caption>
					<tr class="date">
						<td>开始日期:</td>
						<td class="myleft"><input type="text" name="beginDate" class="Wdate" id="beginDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'2013-06-01 00:00:00'})" value="${beginDate}"/></td>
					</tr>
					<tr class="date">
						<td>截止日期:</td>
							<td class="myleft">
							<input type="text" name="endDate" class="Wdate" id="endDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'2013-06-01 00:00:00'})" value="${endDate}"/>
							</td>
					</tr>
					<tr>
						<td colspan="2"><button type="submit">送出</button> </td>
					</tr>
				</table>
			</form>
			<h3 style="color:red; text-align: center;" id="message">${message}</h3>
			<c:if test="${!empty countList}">
					<table border="1" id="repairTable">
					<tr>
						<th>序號</th>
						<th>包裝流程</th>
						<th>數量</th>
					</tr>
					<c:forEach items="${countList}" var="map" varStatus="s">
						<tr>
							<td>${s.count}</td>
						<c:forEach items="${map}" var="entry">
							<td>${entry.value}</td>
						</c:forEach>
						</tr>
					</c:forEach>
				</table>
		</c:if>
		</div>
	</div>
</body>
</html>
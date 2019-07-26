<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${modelName} 制品投入</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/dumpling.css"/>" />
<script type="text/javascript" src="<c:url value="/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/validate.js"/>"></script>
<script>
$(function(){
	$("#componentId").focus();
	$("#myForm").bind("submit",function(event){
		
		validate($("#componentId, #myForm .columnValues"),event);
	});
	$("#closeButton").click(function(){
		if (confirm("確定要退出嗎?")) {
			window.location.href = '<c:url value="/index.html"/>';
		}
	});
})

</script>
<style type="text/css">
	td {
	padding-left: 5px;
	padding-right: 5px;
}
</style>
</head>

<body style="background-color:#ECE9D8">
        <div id="mainBody">
		 <form id="myForm" method="post" action="<c:url value="/production/putIn.html"/>">
		 	<input type="hidden" name="orderId" value="${order.orderId}"/>
			<input type="hidden" name="siteId" value="${site.siteId}"/>
			<input type="hidden" name="routeId" value="${site.route.routeId}"/>
		 <table border="1"  style="width: 400px;">
		  <tr align="center">
			<td colspan="2" align="right"><b>${site.route.routeName}-->${site.siteName}</b> <span style="margin-left: 100px; margin-right: 10px;"><input type="button" value="退出"  id="closeButton"> </span> </td>
		  </tr> 
		  <tr align="center">
			<td>工单号</td>
			<td>${order.orderId}</td>
		  </tr> 
		  <tr align="center">
			<td>工单总数</td>
			<td>${order.planAmount}</td>
		  </tr>
		  <tr align="center">
			<td>已投入数</td>
			<td>${order.putInAmount}</td>
		  </tr>
		  <tr align="center">
			<td>機臺條碼</td>
			<td>
			<input type="text" name="componentId" id="componentId" autofocus="autofocus" data-reg="${site.route.regex}" required="required"/>
			</td>
		  </tr>
		  	<c:forEach items="${siteColumns}" var="column">
			  <tr align="center">
				<td>${column.columnName}</td>
				<td>
				<input type="text" class="columnValues" name="columnValues" data-reg="${column.regex}"/>
				<input type="hidden" class="siteColumnIds" name="siteColumnIds" value="${column.columnId}"/></td>
			  </tr>
			  </c:forEach>
		  <tr align="center">
			<td colspan="2"><input type="submit"  value="送出"></td>
		   </tr>
		 </table>
		 </form>
		 <h4 style="color:#FF0000; ">${message}</h4>
		 <%@ include file="productionInfos.jsp"%>
        </div>
</html>
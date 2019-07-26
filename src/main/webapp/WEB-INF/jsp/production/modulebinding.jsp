<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${modelName} 制品綁定站</title>
<style type="text/css">
	td{
		padding: 1 5px;
	}
</style>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/dumpling.css"/>" />
<script type="text/javascript" src="<c:url value="/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/validate.js"/>"></script>
<script>
$(function(){
	$("input[type='text']:first").focus();
	$("#myForm").bind("submit",function(event){
		validate($("#componentId, #myForm .columnValues"),event);
	});
	
	$("#closeButton").click(function(){
		if(confirm("確定要退出嗎?")){
			window.location.href='<c:url value="/index.html"/>';
		}
	});
});
</script>
</head>
<body>
        <div id="mainbody">
		<form name="myForm" id="myForm" method="post" action="<c:url value="/production/modulebinding.html"/>">
			<input type="hidden" name="siteId" value="${site.siteId}"/>
			<input type="hidden" name="siteIndex" value="${site.siteIndex}"/>
			<input type="hidden" name="routeId" value="${site.route.routeId}"/>
			<table style="text-align: center; width: 400px;" border="1">
				<tr>
					<td colspan="2" align="right"><b>${order.route.routeName}-->${site.siteName}</b><span style="margin-left: 100px; margin-right: 10px;"><input type="button" value="退出" id="closeButton"> </span></td>
				</tr>
				<tr>
					<td>工单号:</td>
					<td>${order.orderId }<input type="hidden" name="orderId" value="${order.orderId }"></td>
				</tr>
				<tr>
					<td>完成数量:</td>
					<td><span style="color:red">${current }</span> / ${order.planAmount }</td>
				</tr>
				
					 <c:forEach items="${site.siteColumns}" var="column">
						  <tr>
							<td><input type="hidden" class="siteColumnIds" name="siteColumnIds" value="${column.columnId}"/>${column.columnName}：</td>
							<td><input type="text" class="columnValues" name="columnValues" data-reg="${column.regex}"/></td>
						  </tr>
					</c:forEach> 
				<tr>
					<td colspan="2"><input type="submit"  value="送出"/></td>
				</tr>
			</table>
		</form>
		<br>
		<h3 id="message">${message}</h3>
		<%@ include file="moduleproductionInfos.jsp"%>
     </div>
</body>
</html>
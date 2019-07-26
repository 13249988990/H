<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${modelName} 制品綁定站</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/dumpling.css"/>" />
<script type="text/javascript" src="<c:url value="/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/validate.js"/>"></script>
<script>
$(function(){
	$("#recomponentId").focus();
	
	$("#myForm").bind("submit",function(event){	
		var reg = new RegExp($("#recomponentId").attr("data-reg"));
		if($("#recomponentId").val()==""){		
			$("#recomponentId").focus();
			return false;
		}else if(!reg.test($("#recomponentId").val())){
			alert("流程卡條碼"+$("#recomponentId").val()+"與工單"+$("#orderId").val()+"國別不一致");
			$("#recomponentId").val("").focus();
			return false;
		}
		reg = new RegExp($("#componentId").attr("data-reg"));
		if($("#componentId").val()==""){			
			$("#componentId").focus();
			return false;
		}else if(!reg.test($("#componentId").val())){
			alert("機台條碼"+$("#componentId").val()+"與工單"+$("#orderId").val()+"國別不一致");
			$("#componentId").val("").focus();
			return false;
		}
		if($("#componentId").val()!=$("#recomponentId").val()){
			alert("流程卡條碼與機台條碼不一致");	
			$("#componentId").val("");
			$("#recomponentId").val("").focus();
			return false;
		}else
		{
			validate($("#myForm .columnValues"),event);
		}
		
	});
	$("#closeButton").click(function(){
		if(confirm("確定要退出嗎?")){
			window.location.href='<c:url value="/production/InBinding.html"/>';
		}
	});
	
});
</script>
</head>
<body>
    <div id="mainbody">
	<form name="myForm" id="myForm" method="post" action="<c:url value="/production/binding.html"/>">
		<input type="hidden" id="orderId" name="orderId" value="${order.orderId}"/>
		<input type="hidden" name="siteId" value="${site.siteId}"/>
		<input type="hidden" name="siteIndex" value="${site.siteIndex}"/>
		<input type="hidden" name="routeId" value="${site.route.routeId}"/>
		<table border="1">
			<caption>${site.siteName} <input type="button" value="退出" id="closeButton" style="margin-left: 20px;"/></caption>
				<tr>
					<th colspan="1">包裝工單</th>					
					<th colspan="1">工單數量</th>
					<th colspan="2">已綁定機台</th>
				</tr>
				<tr>
					<td colspan="1">${order.orderId}</td>					
					<td colspan="1"><span  id="packPlanAmount">${order.planAmount}</span>臺</td>
					<td><span id="bindingFinishAmount">${BingAmount}</span>臺</td>
				</tr>
				<tr>
					<td align="center" colspan="2">流程卡條碼</td>
					<td colspan="2"><input type="text" name="recomponentId" id="recomponentId" autofocus="autofocus" data-reg="${firstsite.route.regex}" ></td>
				</tr>
				<tr>
					<td align="center" colspan="2">機臺條碼</td>
					<td colspan="2"><input type="text" name="componentId" id="componentId" autofocus="autofocus" data-reg="${firstsite.route.regex}" ></td>
				</tr>
				<c:forEach items="${siteColumns}" var="column">
					<tr>
						<td colspan="2" align="center" class="columnNames">${column.columnName}</td>				
						<td colspan="2">
							<input type="hidden" class="siteColumnIds" name="siteColumnIds" value="${column.columnId}"/>
							<input type="text" class="columnValues" name="columnValues" data-reg="${column.regex}" data-name="${column.columnName}"/>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="4" align="center"><input type="submit"  value="送出" size="100"/></td>
				</tr>
			</table>
		</form>
		<br>
		<h3 id="message">${message}</h3>
		<%@ include file="productionInfos.jsp"%>
     </div>
</body>
</html>
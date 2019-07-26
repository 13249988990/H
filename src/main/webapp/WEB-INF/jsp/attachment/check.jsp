<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${modelName} 附件投入</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/dumpling.css"/>" />
<script type="text/javascript" src="<c:url value="/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/validate.js"/>"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#attachmentNo").focus(); 
	$("#myForm").bind("submit",function(event){
		validate($("#attachmentNo, #myForm .columnValues"),event);
	});
	
	$("#closeButton").click(function(){
		window.location.href='<c:url value="/attachment/selectOrder.html?routeId="/>'+$("#routeId").val();
	});
});

</script>
</head>
<body>
        <div id="mainbody">
         <form id="myForm" action="<c:url value="/attachment/check.html"/>" method="post">
         <input type="hidden" name="orderId" id="orderId" value="${order.orderId}">
         <input type="hidden" name="routeId" id="routeId" value="${site.route.routeId}">
          <input type="hidden" name="siteId" id="siteId" value="${site.siteId}">
		 <table border="1" id="formTable">
		  <tr align="right">
			<td colspan="2"><b>${site.siteName}</b> <span style="padding-left: 100px; padding-right: 5px; "><input type="button" value="退出"  id="closeButton"> </span> </td>
		  </tr> 
		  <tr align="center">
			<td>工单数量</td>
			<td>${order.orderId}  </td>
		  </tr> 
		  <tr align="center">
			<td>工单总数</td>
			<td>${order.planAmount}</td>
		  </tr>
		  <tr align="center">
			<td>已投入数</td>
			<td><span id="putInAmount" style="color: green;">${order.putInAmount}</span></td>
		  </tr>
		  <tr align="center">
			<td>附件包:</td>
			<td>
			<input type="text" name="attachmentNo" id="attachmentNo" autofocus="autofocus" data-reg="${site.route.regex}" />
			</td>
		  </tr>
		  <c:forEach items="${siteColumns}" var="column" varStatus="a">
			  <tr align="center">
				<td>${column.columnName}</td>
				<td><input name="columnValues" class="columnValues" type="text"  data-reg="${column.regex}" >
					<input name="siteColumnIds" class="siteColumnIds" type="hidden" value="${column.columnId}"/>
				</td>
			  </tr>
			 </c:forEach>
			<tr>
				<td colspan="3"> <input type="submit" id="snButton" value="送出"></td>
			</tr>
		 </table>
		 
		 </form>
		 <h3 id="message">${message}</h3>
		 <c:if test="${!empty attachments}">
		 <table border="1">
		 	<thead>
		 		<tr>
		 			<td>序號</td>
		 			<td>附件包</td>
		 			<c:forEach items="${siteColumns}" var="column">
		 				<td>${column.columnName}</td>
		 			</c:forEach>
		 			<td>投入日期</td>
		 		</tr>
		 	</thead>
		 	<c:forEach items="${attachments}" var="attachment" varStatus="a">
		 		<tr>	
		 			<td>${a.index +1}</td>
		 			<td>${attachment.attachmentNo}</td>
		 			<c:forEach items="${siteColumns}" var="column">
		 				<td>
		 				<c:forEach items="${attachment.attachmentParameters}" var="attachmentParameter">
		 					<c:if test="${attachmentParameter.column.columnId == column.columnId }">
		 						${attachmentParameter.columnValue}
		 					</c:if>
		 				</c:forEach>
		 				</td>
		 			</c:forEach>
		 			<td><fmt:formatDate value="${attachment.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		 		</tr>
		 	</c:forEach>
		 </table>
		 </c:if>
         </div>
	<br/>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${modelName} 裸機入板</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/dumpling.css"/>" />
<script type="text/javascript" src="<c:url value="/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/validate.js"/>"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#machineId").focus(); 
	$(function(){
		$("#myForm").bind("submit",function(event){
			if($("#machineId").val()==""){
				$("#machineId").focus();
				return false;
			}
			var reg = new RegExp($("#machineId").attr("data-reg"));
			if(!reg.test($("#machineId").val())){
				alert("機台號編碼原則有誤 "+$("#machineId").val()+"=="+reg);
				$("#machineId").select();
				return false;
			}
		});
		
		$("#closeButton").click(function(){
			if (confirm("確定要退出嗎?")) {
				window.location.href='<c:url value="/machine/selectPallet.html"/>';
			}
			
		});
	});
	
});
</script>
</head>
<body>
<div id="mainbody">
<form id="myForm" method="post" action="<c:url value="/machine/InPallet.html"/>">
<input name="palletId" type="hidden" value="${machinePallet.palletId}">
<input name="modelId" type="hidden" value="${machinePallet.model.modelId}">
		<table border="1">
				<caption>裸機入板 <input type="button" value="退出" id="closeButton" style="margin-left: 20px;"/></caption>
				  <tr>
					<td colspan="4" align="center"><b>棧板信息</b></td>
				</tr>
				  <tr>
					<th colspan="2">栈板号</th>
					<th>機台類型</th>
					<th>入板數量</th>
				  </tr>
				  <tr>
				  	<td colspan="2">${machinePallet.palletId}</td>
				  	<td>${machinePallet.model.modelName}</td>
					<%-- <td><span id="palletPlanAmount">${pallet.planAmount}</span> 臺</td> --%>
					<td><span id="palletFinishAmount">${machinePallet.packAmount}</span>臺</td>
				  </tr>
				  <tr>
					<td align="center" colspan="2">機台條碼:</td>
					<td colspan="2"><input name="machineId" id="machineId" type="text" autofocus="autofocus" data-reg="${machinePallet.model.modelRegex}"/></td>
				  </tr>				 
			     <tr>
				  	<td colspan="4" align="center"><input type="submit" value="送出"  size="100"> </td>
				 </tr>
				 </table>
				</form>
					<h3 id="message">${message}</h3>
				<c:if test="${!empty machineses}">
						<table style="width: 700px;" border="1">
						  <tr align="center">
							<td>Item</td>
							<td>機臺條碼</td>
							<td>棧板號</td>
							<td>入板时间</td>
						  </tr>	
						  <c:forEach items="${machineses}" var="machines" varStatus="a">
						  <tr align="center">
							<td>${a.index+1}</td>
							<%-- <td>${goods.order.orderId}</td> --%>
							 <td>${machines.machineId}</td> 
							<td>${machines.pallet.palletId}</td>
							<td><fmt:formatDate value="${machines.packDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						  </tr>
						  </c:forEach>
						</table>
				</c:if>
			 </div>
</body>
</html>
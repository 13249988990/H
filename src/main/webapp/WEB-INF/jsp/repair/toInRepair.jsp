<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<%@ include file="../share/lib.jsp"%>
<script>
$(function(){
	$("#myForm").submit(function(){
		if($("#componentId").val()==""){
			$("#message").html("請輸入機臺號!");
			return false;
		}
	});
	
});
</script>
<title>${modelName} 生產管理系統--進入檢修</title>

</head>

<body style="background-color: #ECE9D8">
	<div class="main" >
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<div id="mainbody">
			<form id="myForm" method="post" action="<c:url value="/repair/toInRepair.html"/>">
				<h3>進入檢修</h3>
				<span style="margin-right: 10px;">請輸入機台號:</span><span style="margin-right: 10px;"><input type="text"	name="componentId" id="componentId" ></span><span><button type="submit">送出</button></span>
			</form>
			<h3 style="color:red; text-align: center;" id="message">${message}</h3>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="lib.jsp" %>
<title>${modelName} 生產管理系統</title>
<script type="text/javascript">
$(function(){
	document.onkeydown = function(e){
	    var ev = document.all ? window.event : e;
	    if(ev.keyCode==13) {
			window.location.href=$("#goback").attr("href");
	     }
	};
	}); 
</script>
</head>
<body>
	<div class="main">
		<div class="menu">
			<%@ include file="menu.jsp"%>
		</div>
		<div id="mainbody" style="padding-top:50px;">
			<span style="font-size: 20px; font-weight: bold; color: red;"> ${message} <a href="<c:url value="${returnUrl}"/>" id="goback">返回</a></span>
		</div>
	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="share/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="share/lib.jsp" %>
<title>${modelName} 生產管理系統</title>
</head>
<body >
<div class="main">
		<div class="menu">
			<%@ include file="share/menu.jsp"%>
		</div>
		<div id="mainbody" style="margin: 100px auto;">
			<h2>歡迎使用 ${modelName} QIS 製造管理系統！</h2>
		</div>
	</div>
<hr />
<div id="doc">
	<div class="demo">
		<marquee behavior="scroll" direction="left" scrollamount="2" >
		<p><span class="style1">客戶至上   技術領先 制度完善   全員參與  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  Customer First  Leading  Technlongy  Systematic  Processes  Employee Participation
		  </span>
		 </p>
		</marquee>
	</div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include.jsp" %>
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/LCDMES.dwt.jsp" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="lib.jsp" %>
<title>Login Page</title>
</head>
<body>
<div style="text-align: center;">
        <div class="main">
                <div class="menu">
                <%@ include file="menu.jsp"%>
                </div>
                <div class="mainbody" style="background-color:#ECE9D8">
         		<!-- InstanceBeginEditable name="EditRegion3" -->
		 <form id="form1" name="form1" method="post" action="Index.mes">
		 <fieldset>
				<legend>系統登入</legend>
				<ol>
					<li>
						<label for="accountid">
							登入帳號
						</label>
						<input name="accountid" type="text" id="accountName" placeholder="請輸入員工工號" required autofocus />
					</li>
					<li>
						<label for="password">
							密碼
						</label>
						<input name="password" type="password" id="accountPassword" required/>
					</li>
				</ol>
			</fieldset>
			<fieldset>
				<button type="submit">${MSG}</button>
			</fieldset>
		</form>
		 <!-- InstanceEndEditable -->
                </div>
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

<!--
<p align="left"><a href="../jsp/FireFox.exe"><img src="../jsp/image/featurecard-h.png" width="468" height="60" border="0" /></a></p>
-->
</body>
<!-- InstanceEnd --></html>
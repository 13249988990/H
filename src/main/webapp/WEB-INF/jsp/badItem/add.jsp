<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="../share/lib.jsp" %>
<script>
if(CheckBrowser() != "Firefox" && CheckBrowser() != "Mozilla"){
	alert("请使用Firefox浏览器,下载地址！");
	window.location.reload("FireFox.exe");
	$("#myForm").submit(function(){
		if($("#name").val()==""){
			alert("請輸入"+$("#beanName").text());
			return false;
		}
	});
}
</script>
<title>${modelName} 生產管理系統--添加測試站</title>
</head>

<body style="background-color:#ECE9D8">

        <div class="main">
                <div class="menu">
                <%@ include file="../share/menu.jsp"%>
                </div>
                <div id="mainbody">
						<form id="myForm" method="post" action="<c:url value="/badItem/add.html"/>">
							<input type="hidden" name="parentId" value="${parentId}">
							<table border="1" style="width: 400px;">
								<caption>新增${beanName}</caption>
								<tr>
									<td id="beanName">${beanName}名:</td>
									<td class="myleft"><input type="text" name="name" id="name" required="required"/></td>
								</tr>
								<tr>
									<td>備註:</td>
									<td class="myleft"><input type="text" name="remark" /></td>
								</tr>
								<tr>
									<td colspan="2"><button type="submit">送出</button> </td>
								</tr>
							</table>
						</form>
						<h3 style="text-align: center;color: red;">${message}</h3>
                </div>
        </div>
</body>
</html>
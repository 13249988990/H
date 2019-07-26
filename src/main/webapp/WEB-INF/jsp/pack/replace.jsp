<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8" />
<%@ include file="../share/lib.jsp" %>
<title>${modelName} 生產管理系統</title>
</head>
<body>
<div>
        <div class="main">
                <div class="menu">
                <%@ include file="../share/menu.jsp"%>
                </div>
                <div id="mainbody" >
				<form name="form1" method="post" action="<c:url value="/pack/replace.html"/>">
					<table border="1" style="width: 400px;">
						<caption>整機替換</caption>
						<tr>
							<td>請輸入舊機台号:</td>
							<td class="myleft"><input name="oldGoodsId" type="text" required="required"></td>
						</tr>
						<tr>
							<td>請輸入新機台号:</td>
							<td class="myleft"><input name="newGoodsId" type="text" required="required"></td>
						</tr>
						
						<tr>
							<td colspan="2"><input type="submit" name="Submit" value="送出"></td>
						</tr>
					</table>
				</form>
				<br>
				<h3 id="message">${message}</h3>
			 </div>
        </div>
</div>
</body>
</html>
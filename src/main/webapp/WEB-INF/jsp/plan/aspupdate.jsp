<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="../share/lib.jsp" %>
<title>${modelName} 更新出貨數量</title>
</head>

<body>
<div style="text-align: center;">
        <div class="main">
                <div class="menu">
                <%@ include file="../share/menu.jsp"%>
                </div>
                <div id="mainbody">
			<form id="Planform" name="form1"  method="post" action="<c:url value="/plan/aspupdate.html"/>">
				<input type="hidden" name="poId" value="${poplan.casemark2}">
				<table border="1" style="width: 400px;">
				  <caption>更新出货计划</caption>
				  		<tr>
							<td>PO 號:</td>
							<td class="myleft">${poplan.casemark2}</td>
						</tr>
						<tr>
							<td>國別:</td>
							<td class="myleft">${poplan.casemark1}</td>
						</tr>
						<tr>
							<td>已投入數量:</td>
							<td class="myleft">${poplan.putInAmount}</td>
						</tr>
						<tr>
							<td>計劃投入數量:</td>
							<td class="myleft"><input id="planAmount"
								name="planAmount" type="text" value="${poplan.casemark6}"
								pattern="\d+" required="required" /></td>
						</tr>
						<tr>
							<td colspan="2"><button type="submit" style="width: 100px;">更新</button></td>
						</tr>
					</table>
				<h3 style="color:red;">${message}</h3>
				</form>
				
                </div>
        </div>
</div> 

</body>
</html>
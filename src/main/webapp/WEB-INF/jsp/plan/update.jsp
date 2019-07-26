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
			<form id="shipPlanform" name="form1"  method="post" action="<c:url value="/plan/update.html"/>">
				<input type="hidden" name="planId" value="${plan.planId}">
				<table border="1" style="width: 400px;">
				  <caption>更新出货计划</caption>
				  		<tr>
							<td>PO 號:</td>
							<td class="myleft">${plan.poplan.casemark2}</td>
						</tr>
						<tr>
							<td>出货國別:</td>
							<td class="myleft">${plan.route.routeName}</td>
						</tr>
						<tr>
							<td>包裝方式</td>
							<td class="myleft">${plan.packType.name}</td>
						<tr>
							<tr>
							<td>出货日期:</td>
							<td class="myleft">${plan.planDate}</td>
						</tr>
						<tr>
							<td>已入庫數量:</td>
							<td class="myleft">${plan.acceptAmount}</td>
						</tr>
						<tr>
							<td>已出貨數量:</td>
							<td class="myleft">${plan.shipAmount}</td>
						</tr>
						<tr>
							<td>計劃出貨數量:</td>
							<td class="myleft"><input id="planAmount"
								name="planAmount" type="text" value="${plan.planAmount}"
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
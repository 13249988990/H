<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="../share/lib.jsp" %>
<title>${modelName} 生產管理系統--添加包裝方式</title>
</head>
<body>
	<div class="main">
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<div id="mainbody">
			<form id="shipPlanform" name="form1" method="post"
				action="<c:url value="/packType/add.html"/>">
				<input type="hidden" value="${parentId}" name="parentId">
				<table	border="1" style="width: 400px;">
					<caption>添加包裝方式 <a href='<c:url value="/packType/list.html"/>'>返回列表</a></caption>
					<tr>
						<td>名稱:</td>
						<td class="myleft"><input name="name" type="text"></td>
					</tr>
					<tr>
						<td>數量:</td>
						<td class="myleft"><input name="amount" type="text"></td>
					</tr>
					<tr>
						<td>單位:</td>
						<td class="myleft">箱:<input type="radio" name="unit" value="BOX"
							checked="checked"> 臺:<input type="radio" name="unit"
							value="GOODS">
						</td>
					</tr>
					<tr>
						<td colspan="2"><button type="submit">送出</button></td>
					</tr>
				</table>
			</form>
			<h3 style="color: #FF0000">${message}</h3>
		</div>
	</div>

</body>
</html>
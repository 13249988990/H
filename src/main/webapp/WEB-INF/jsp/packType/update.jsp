<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="../share/lib.jsp" %>
<title>${modelName} 生產管理系統--包裝類型更新</title>
</head>
<body>
	<div class="main">
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<div id="mainbody">
			<form method="post"	action="<c:url value="/packType/update.html"/>">
				<input name="packTypeId" value="${packType.packTypeId}"
					type="hidden"> <input name="parentId"
					value="${packType.parent.packTypeId}" type="hidden"> <input
					name="childId" value="${packType.child.packTypeId}" type="hidden">
				<table border="1" style="width: 400px;">
					<caption>
						更新包裝方式 <a href='<c:url value="/packType/list.html"/>'>返回列表</a>
					</caption>
					<tr>
						<td>名稱:</td>
						<td class="myleft"><input name="name" type="text" value="${packType.name }">
						</td>
					</tr>
					<tr>
						<td>數量:</td>
						<td class="myleft"><input name="amount" type="text"
							value="${packType.amount}"></td>
					</tr>
					<tr>
						<td>單位:</td>
						<td class="myleft"><c:if
								test='${packType.child==null && packType.unit=="BOX" }'>
									箱:<c:if test='${packType.unit=="BOX"}'>
									<input type="radio" name="unit" value="BOX" checked="checked">
								</c:if>
								<c:if test='${packType.unit!="BOX"}'>
									<input type="radio" name="unit" value="BOX">
								</c:if>
									臺:<c:if test='${packType.unit=="GOODS"}'>
									<input type="radio" name="unit" value="GOODS" checked="checked">
								</c:if>
								<c:if test='${packType.unit!="GOODS"}'>
									<input type="radio" name="unit" value="GOODS">
								</c:if>
							</c:if> <c:if test='${packType.child!=null || packType.unit=="GOODS" }'>
									${packType.unit=="GOODS" ? "臺" : "箱"}<input name="unit"
									type="hidden" value="${packType.unit}">
							</c:if></td>
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
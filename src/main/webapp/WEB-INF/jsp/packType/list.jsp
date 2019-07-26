<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="../share/lib.jsp" %>
<title>${modelName} 生產管理系統--包裝方式管理 </title>
</head>
<body>
	<div class="main">
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<div id="mainbody">
			<table border="1" style="width: 600px; text-align: center;">
				<caption>包裝方式列表 <a href='<c:url value="/packType/toAdd.html"/>'>添加新的包裝方式</a></caption>
				<tr>
					<th>名稱</th>
					<th>包裝數量</th>
					<th>單位</th>
					<th>父類</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${packTypes }" var="packType">
					<tr>
						<td>${packType.name }</td>
						<td>${packType.amount }</td>
						<td><c:if test='${packType.unit=="BOX"}'>箱</c:if> <c:if
								test='${packType.unit=="GOODS"}'>臺</c:if></td>
						<td>${packType.parent==null ? "根類" : packType.parent.name}</td>
						<td><c:if
								test='${packType.child==null && packType.unit=="BOX"}'>
								<a
									href='<c:url value="/packType/toAdd.html?parentId=${packType.packTypeId}" />'>添加子類</a>
							</c:if> <c:if test='${packType.child != null || packType.unit=="GOODS"}'>添加子類 </c:if>
							<a
							href='<c:url value="/packType/toUpdate.html?packTypeId=${packType.packTypeId}" />'>更新</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>

</body>
</html>
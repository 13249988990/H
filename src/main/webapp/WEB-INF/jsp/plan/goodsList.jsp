<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE HTML>
<html>
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
                <div id="mainbody" style="background-color:#ECE9D8">
				<c:if test="${!empty goodses}">
					<table border="1">
					<caption>棧板 ${goodses[0].pallet.palletId} 包裝機臺列表
					 <input style="margin-left: 20px; width: 100px;" type="button" onclick="javascript:history.go(-1);" value="返回">
					 </caption>
					  <tr align="center">
						<td>Item</td>
						<td>客戶條碼</td>
						<td>機臺條碼</td>
						<td>附件包條碼</td>
						<td>栈板号</td>
						<td>包裝日期</td>
						<td>製造入庫日期</td>
						<td>倉庫入庫日期</td>
						<td>倉庫出貨日期</td>
					  </tr>	
					  <c:forEach items="${goodses}" var="goods" varStatus="a">
					  <tr align="center">
						<td>${a.index+1}</td>
						<td>${goods.goodsId}</td>
						<td>${goods.barcodePrint.component.componentId}</td>
						<td>${goods.attachment.attachmentNo}</td>
						<td>${goods.pallet.palletId}</td>
						<td><fmt:formatDate value="${goods.packDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td><fmt:formatDate value="${goods.pallet.storageDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td><fmt:formatDate value="${goods.pallet.acceptDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td><fmt:formatDate value="${goods.pallet.shipDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					  </tr>
					  </c:forEach>
					</table>
				</c:if>
				<c:if test="${empty goodses}">
					<h3 id="message">沒有包裝機臺信息</h3>
				</c:if>
                </div>
        </div>
</div>
<br/>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../share/lib.jsp" %>
<title>${modelName} 生產管理系統</title>
<script type="text/javascript">
$(function(){
	$("#")
});
</script>
</head>
<body >
<div class="main">
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<div id="mainbody" >
		<form action="<c:url value="/pack/showPallet.html"/>" method="post">
			<c:if test="${admin==null}">
				
					<input type="hidden" name="returnUrl" value="${returnUrl}">
				<table>
				<caption>棧板加鎖/解鎖</caption>
				<tr>
					<th>棧板號:</th>
					<td><input type="text" name="palletId" required="required"> </td>
					<td><input type="submit" value="送出"> </td>
				</tr>
				
			</table>
			</c:if>
			<h3 id="message">${message}</h3>
		</form>
		<form action="<c:url value="/pack/lockPallet.html"/>" method="post">
				<c:if test="${!empty pallet}">
				<input name="palletId" type="hidden" value="${pallet.palletId}"/>
					<table border="1" >
					<tr>
						<th>棧板號</th>
						<th>PO號</th>						
						<th>包裝方式</th>
						<th>包裝數量</th>
						<th>包裝時間</th>
						<th>制造入庫時間</th>
						<th>倉庫入庫時間</th>
						<th>倉庫出貨時間</th>
						<th>棧板管理</th>
					</tr>
						<tr>
						<td>${pallet.palletId}</td>
						<td>${pallet.shipPlan.poplan.casemark2}</td>						
						<td>${pallet.packType.name}</td>
						<td>${pallet.packAmount}</td>
						<td><fmt:formatDate value="${pallet.packDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td><fmt:formatDate value="${pallet.storageDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td><fmt:formatDate value="${pallet.acceptDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td><fmt:formatDate value="${pallet.shipDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td>
							<c:if test="${pallet.state=='PACKING'}"><input type="submit" value="鎖定" > <input type="hidden" name="lock" value="true"> </c:if>
							<c:if test="${pallet.state=='LOCKED'}"><input type="submit" value="解鎖"> <input type="hidden" name="lock" value="false"></c:if>
							<c:if test="${pallet.state!='LOCKED'&& pallet.state!='PACKING'}">${pallet.state.name}</c:if>
						 </td>
					</tr>
				</table>
			</c:if>
		</form>
		</div>
	</div>
</body>
</html>
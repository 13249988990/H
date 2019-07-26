<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<%@ include file="../share/lib.jsp"%>
<script type="text/javascript" src="<c:url value="/js/My97DatePicker/WdatePicker.js"/>"></script>
<style type="text/css">
#repairTable{
	width: 1000px;
}
#repairTable td,#repairTable th{
	font-size: 14px;
}
</style>
<script>
$(function(){
	$(".goodsButton").click(function(){
		window.location.href = '<c:url value="/order/getGoodses.html?palletId="/>'+$(this).attr("id");
	});

	$(".updateButton").click(function(){
		window.location.href = '<c:url value="/order/toUpdatePallet.html?palletId="/>'+$(this).attr("id");
	});
});
</script>
<title>${modelName} 生產管理系統--檢修查询</title>

</head>

<body style="background-color: #ECE9D8">
	<div class="main" >
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<div id="mainbody">
			<c:if test="${!empty pallets}">
				<div></div>
					<table border="1" >
					<caption>
							工單${orderId} 包裝棧板列表 
					 <input style="margin-left: 20px; width: 100px;" type="button" onclick="javascript:history.go(-1);" value="返    回">
					 </caption>
					<tr>
						<th>序号</th>
						<th>棧板號</th>
						<th>包裝方式</th>
						<th>棧板數量</th>
						<th>包裝數量</th>
						<th>包裝時間</th>
						<th>制造入庫時間</th>
						<th>棧板狀態</th>
						<d:role url="/plan/toUpdatePallet.html">
							<th>更新</th>
						</d:role>
						<th>機臺列表</th>
					</tr>
					<c:forEach items="${pallets}" var="pallet" varStatus="s">
						<tr>
						<td>${s.count}</td>
						<td>${pallet.palletId}</td>
						<td>${pallet.packType.name}</td>
						<td>${pallet.planAmount}</td>
						<td>${pallet.packAmount}</td>
						<td><fmt:formatDate value="${pallet.packDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td><fmt:formatDate value="${pallet.storageDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td>${pallet.state.name}</td>
						<d:role url="/plan/toUpdatePallet.html">
							<th><input type="button" value="更新" class="updateButton" id="${pallet.palletId}"></th>
						</d:role>
						<td><input type="button" value="機臺列表" class="goodsButton" id="${pallet.palletId}"> </td>
					</tr>
					</c:forEach>
				</table>
			</c:if>
			<c:if test="${empty pallets}">
				<h3 id="message">沒有棧板記錄</h3>
			</c:if>
		</div>
	</div>
	<br/>
</body>
</html>
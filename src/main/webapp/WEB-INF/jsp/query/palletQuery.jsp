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
	$("#myForm").submit(function(){
		if($("#state").val()==""){
			alert("請選擇類型!");
			return false;
		}
	});
	$("#state").val('${state}');
});
</script>
<title>${modelName} 生產管理系統--檢修查询</title>

</head>

<body>
	<div class="main" >
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<div id="mainbody">
			<form id="myForm" method="post" action="<c:url value="/query/palletQuery.html"/>">
				<table>
					<tr>
						<td>
							<table border="1">
								<caption>入庫查詢</caption>
								<tr>
									<td>類型:</td>
									<td><select id="state" name="state">
											<option value="">请选择</option>
											<option value="PACKED">包裝完成</option>
											<option value="STORED">制造入庫</option>
											<option value="ACCEPTED">倉庫入庫</option>
											<option value="SHIPED">倉庫出貨</option>
									</select></td>
								</tr>
								<tr>
									<td>开始日期:</td>
									<td class="myleft"><input type="text" name="beginDate"
										class="Wdate" id="beginDate"
										onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'2013-06-01 00:00:00'})"
										value="${beginDate}" /></td>
								</tr>
								<tr>
									<td>截止日期:</td>
									<td class="myleft"><input type="text" name="endDate"
										class="Wdate" id="endDate"
										onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'2013-06-01 00:00:00'})"
										value="${endDate}" /></td>
								</tr>
								<tr>
									<td colspan="2"><button type="submit">送出</button></td>
								</tr>
							</table>
						</td>
						<td style="padding-left: 20px;">
							<c:if test="${!empty pallets}">
								<table border="1">
									<tr>
										<td>包裝方式</td>
										<td>總計</td>
									</tr>
									<c:forEach items="${counts}" var="maps">
										<tr>
											<c:forEach items="${maps}" var="item">
												<th>${item.value}</th>
											</c:forEach>
										</tr>
									</c:forEach>
								</table>
							</c:if>
							
						</td>
					</tr>
				</table>
				
			</form>
			<h3 style="color:red; text-align: center;" id="message">${message}</h3>
			<c:if test="${!empty pallets}">
					<table border="1" id="listTable">
					<tr>
						<th>序号</th>
						<th>工單</th>
						<th>PO號</th>
						<th>棧板號</th>
						<th>包裝方式</th>
						<th>包裝數量</th>
						<th>包裝時間</th>
						<th>制造入庫時間</th>
						<th>倉庫入庫時間</th>
						<th>倉庫出貨時間</th>
					</tr>
					<c:forEach items="${pallets}" var="pallet" varStatus="s">
						<tr>
						<td>${s.count}</td>
						<td>${pallet.packPlan.lotId}</td>        
						<td>${pallet.shipPlan.poplan.casemark2}</td>
						<td>${pallet.palletId}</td>
						<td>${pallet.packPlan.packType.name}</td>
						<td>${pallet.packAmount}</td>
						<td><fmt:formatDate value="${pallet.packDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td><fmt:formatDate value="${pallet.storageDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td><fmt:formatDate value="${pallet.acceptDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td><fmt:formatDate value="${pallet.shipDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					</tr>
					</c:forEach>
				</table>
				</c:if>
		</div>
	</div>
</body>
</html>
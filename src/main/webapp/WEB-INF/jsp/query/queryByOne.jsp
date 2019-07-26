<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="../share/lib.jsp"%>
<style type="text/css">
	body td{
		padding: 2px 2px;
		text-align: center;
	}
	
	.showTable{
		width: 1000px;
		font-size: 15px;
	}
</style>
<script type="text/javascript">
$(function(){
	$("input[type=radio]").each(function(){
		if($(this).val()==$("#barcode").val()){
			$(this).attr("checked","checked");
		}
	});
});
</script>
<title>${modelName} 生產管理系統--單機查詢</title>
</head>

<body style="background-color: #ECE9D8">
	<div class="main">
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<div  style="background-color: #ECE9D8; width: 1000px; margin: 20px auto;">
			<form id="myform" action="<c:url value="/query/queryByOne.html"/>">
				<input type="hidden" id="barcode" value="${queryType}">
						<table border="1" style="text-align: center; margin: 0 auto;">
							<tr>
								<th colspan="3">請選擇查詢方式:</th>
							</tr>
							<tr>
								<td>機臺條碼:<input type="radio" value="1" name="queryType"  checked="checked"> </td>
								<td>客戶條碼:<input type="radio" value="2" name="queryType"></td>
								<td>M/B板條碼:<input type="radio" value="3" name="queryType"></td>
							</tr>
							<tr>
								<td>請輸入條碼</td>
								<td><input type="text" name="queryNo" id="queryNo"> </td>
								<td><input type="submit" value="送出"> </td>
							</tr>
						</table>
					
				</form>
			<h3 style="color:#FF0000; text-align: center;">${message}</h3>
				<c:if test="${component!=null}">
					<table border="1" class="showTable">
						<caption>工單資料</caption>
						<tr>
							<th>工單號</th>
							<th>機種</th>
							<th>線別</th>
							<th>工單數量</th>
							<th>投入數量</th>
							<th>工單狀態</th>
						</tr>
						<tr>
							<td>${component.order.orderId}</td>
							<td>${component.order.route.routeName}</td>
							<td>${component.order.line}</td>
							<td>${component.order.planAmount}</td>
							<td>${component.order.putInAmount}</td>
							<td>${component.order.state.name}</td>
						</tr>
					</table>
					<br/>
					<table border="1" class="showTable">
					<caption>投入資料</caption>
					<tr>
						<th>機臺條碼</th>
						<c:forEach items="${component.productionInfos}" var="productionInfo">
							<c:forEach items="${productionInfo.columnDatas}" var="columnData">
								<th>${columnData.siteColumn.columnName}</th>								
							</c:forEach>
							<th>時間</th>
						</c:forEach>
					</tr>
					<tr>
						<td>${component.componentId}</td>
						<c:forEach items="${component.productionInfos}" var="productionInfo">
							<c:forEach items="${productionInfo.columnDatas}" var="columnData">
								<td>${columnData.columnValue}</td>								
							</c:forEach>
							<td><fmt:formatDate value="${productionInfo.productionDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						</c:forEach>
					</tr>
				</table>
				<br/>
				<c:if test="${goods!=null}">
					<table border="1" class="showTable">
						<caption>入箱資料</caption>
						<tr>
							<th>客戶條碼</th>
							<th>機臺條碼</th>
							<th>附件盒條碼</th>
							<th>機種</th>
							<th>國別</th>
							<!-- <th>LotId</th> -->
							<th>包裝日期</th>
						</tr>
						<tr>
							<td>${goods.goodsId}</td>
							<td>${goods.barcodePrint.component.componentId}</td>
							<td>${goods.attachment.attachmentNo}</td>
							<td>${goods.order.route.routeName}</td>
							<td>${goods.order.route.location.locationName}</td>
							<%-- <td>${goods.order.orderId}</td> --%>
							<td>${goods.packDate}</td>
						</tr>
					</table>
					<br/>
					<table border="1" class="showTable">
						<caption>附件资料</caption>
						<tr>
							<c:forEach items="${siteColumns}" var="column">
		 						<th>${column.column.columnName}</th>
		 					</c:forEach>
						</tr>
						<tr>
							<c:forEach items="${siteColumns}" var="column">
								<td><c:forEach items="${goods.attachmentParameters}"
										var="attachmentParameter">
										<c:if test="${attachmentParameter.id == column.id }">
			 						${attachmentParameter.columnValue}
			 					</c:if>
									</c:forEach></td>
							</c:forEach>
						</tr>
					</table>
					<br/>
					<table border="1" class="showTable">
						<caption>棧板資料</caption>
						<tr>
							<th>棧板號</th>
							<th>包裝国别</th>
							<th>包裝類型</th>
							<th>PO號</th>
							<th>狀態</th>
							<th colspan="2">制造入庫日期</th>
							<th colspan="2">倉庫入庫日期</th>
							<th colspan="2">倉庫出貨日期</th>
						</tr>
						<c:if test="${goods.pallet==null}">
							<tr>
								<th colspan="10" style="color: blue">此客戶條碼未包裝入板</th>
							</tr>
						</c:if>
						<c:if test="${goods.pallet!=null }">
							<tr>
							<td>${goods.pallet.palletId}</td>
							<td>${goods.pallet.route.routeName}</td>
							<td>${goods.pallet.packType.name}</td>
							<td>${goods.pallet.shipPlan.poplan.casemark2}</td>
							<td>${goods.pallet.state.name}</td>
							<td colspan="2"><fmt:formatDate value="${goods.pallet.storageDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td colspan="2"><fmt:formatDate value="${goods.pallet.acceptDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td colspan="2"><fmt:formatDate value="${goods.pallet.shipDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						</tr>
						</c:if>
					</table>
				</c:if>
				<c:if test="${goods==null}">
					<h3 style="text-align: center;">沒有包裝記錄</h3>
				</c:if>
				<br/>
				<c:if test="${!empty component.repairInfos}">
					<table border="1" class="showTable">
					<caption>檢修記錄</caption>
					<tr>
						<th>入修時間</th>
						<th>出修時間</th>
						<th>不良原因</th>
						<th>測試站</th>
						<th>不良項目</th>
						<th>不良類別</th>
						<th>維修方法</th>
						<th>維修人</th>
						<th>入修備註</th>
						<th>出修備註</th>
					</tr>
					<c:forEach items="${component.repairInfos}" var="repairInfo">
						<tr>
						<td><fmt:formatDate value="${repairInfo.inDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td><fmt:formatDate value="${repairInfo.outDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td>${repairInfo.cause}</td>
						<td>${repairInfo.badItem.parent.name}</td>
						<td>${repairInfo.badItem.name}</td>
						<td>${repairInfo.badType}</td>
						<td>${repairInfo.repairMethod }</td>
						<td>${repairInfo.repairer}</td>
						<td>${repairInfo.inRemark}</td>
						<td>${repairInfo.outRemark}</td>
					</tr>
					</c:forEach>
				</table>
				</c:if>
				<c:if test="${empty component.repairInfos}">
					<h3 style="text-align: center;">沒有檢修記錄</h3>
				</c:if>
				
			</c:if>
				
		</div>
	</div>

</body>
</html>
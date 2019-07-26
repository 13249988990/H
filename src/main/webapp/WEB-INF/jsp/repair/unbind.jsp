<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<%@ include file="../share/lib.jsp" %>
<style type="text/css">
	body td{
		padding: 5px 5px;
		text-align: center;
	}
	
	table{
		text-align: center;
		margin: 10px auto;
	}
	
</style>
<script type="text/javascript">
$(function(){
	$(".unbindButton").last().attr("disabled",false);
	$(".unbindButton").click(function(){
		var infoId = $(this).attr("id");
		var componentId = $("#myComponentId").val();
		var queryType = ${queryType};
		if(confirm("確定要解除綁定嗎?")){
			location.href = '<c:url value="/repair/unbind.html?productionInfoId='+infoId+'&componentId='+componentId+'&queryType='+queryType+'"/>';
		}
	});
	$(".queryType").each(function(){
		var param = ${queryType};
		if($(this).val()==param){
			$(this).attr("checked","checked");
		}
	});
});
	
</script>
<title>${modelName}生產管理系統--Key Part解除綁定</title>
</head>

<body style="background-color: #ECE9D8">
	<div class="main">
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<div id="mainbody">
			<form id="myform" action="<c:url value="/repair/toUnbind.html"/>">
				<input id="myComponentId" value="${productionInfos[0].component.componentId}" type="hidden">
						<table border="1">
							<caption>Key Part 解除綁定</caption>
							<tr>
								<td>條碼類型:</td>
								<td><input type="radio" name="queryType" class="queryType" value="0" checked="checked"> 機台條碼<input type="radio" name="queryType" class="queryType" value="1"> 客戶條碼</td>
								<td rowspan="2"><input type="submit" value="送出" style="width: 50px; height: 50px;"></td>
							</tr>
							<tr>
								<td>請輸入條碼:</td>
								<td><input type="text" name="barcode" id="barcode" required="required"> </td>
							</tr>
							
						
						</table>
					
				</form>
			<h3 style="color:#FF0000; text-align: center;">${message}</h3>
				<c:if test="${!empty productionInfos}">
					<c:forEach items="${productionInfos}" var="productionInfo">
						<table border="1" class="showTable">
							<caption>${productionInfo.site.siteName}站資料</caption>
								<tr>
								<th>工單號</th>
								<th>生產流程</th>
								<th>機臺條碼</th>
								<c:forEach items="${productionInfo.columnDatas}" var="columnData">
									<th>${columnData.siteColumn.columnName}</th>									
								</c:forEach>
								<th>時間</th>
								<d:role url="/repair/toUnbind.html">
									<th>操作</th>
								</d:role>
								
								</tr>
								<tr>
								<td>${productionInfo.order.orderId}</td>
								<td>${productionInfo.order.route.routeName}</td>
								<td>${productionInfo.component.componentId}</td>
								<c:forEach items="${productionInfo.columnDatas}" var="columnData">
									<td>${columnData.columnValue}</td>
								</c:forEach>
								<td><fmt:formatDate value="${productionInfo.productionDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<d:role url="/repair/toUnbind.html">
									<th><input type="button" value="解除綁定" class="unbindButton" id="${productionInfo.productionInfoId}" disabled="disabled"> </th>
								</d:role>
								
								</tr>
						</table>
						<br/>
					</c:forEach>
				</c:if>
				
		</div>
	</div>
</body>
</html>
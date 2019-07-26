<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/LCDMES.dwt.jsp" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="../share/lib.jsp" %>
<style type="text/css">
#queryTable td{
	padding: 2px 10px;
}
</style>
<script>
$(function(){
	$(".delButton").click(function(){
		var poId = $(this).attr("id");
		if(confirm("確定要刪除poId為"+poId+"出貨計畫嗎?")){
			var params = "poId="+poId;
			var planId=$(this).parent("td").parent("tr").children("td:eq(1)").attr("id");
			params = params + "&planIds="+planId;
			window.location.href = '<c:url value="/plan/delete.html?'+params+'"/>';
		}
		
		return false;
	});
	
	$(".upButton").click(function(){
		window.location.href = '<c:url value="/plan/toUpdate.html?planId="/>'+$(this).attr("id");
	});
	
	$(".shipButton").click(function(){
		window.location.href = '<c:url value="/plan/getShipPallets.html?poId="/>'+$(this).attr("id");
	});

});

</script>
<title>${modelName} 生產管理系統--出貨計畫管理</title>
<script type="text/javascript" src="<c:url value="/js/My97DatePicker/WdatePicker.js" />"></script>
</head>

<body>
<div>
        <div class="main">
                <div class="menu">
                <%@ include file="../share/menu.jsp"%>
                </div>
                <div id="mainbody">
         		<!-- InstanceBeginEditable name="EditRegion3" -->
				<form name="form1" method="post" action="<c:url value="/plan/list.html"/>">
				<input type="hidden" name="query" value="true">
					<table border="1" id="queryTable">
						<caption>PO查詢</caption>
						<tr>
							<td>Po號:</td>
							<td colspan="3"><input type="text" name="poId" value="${poId}" style="width: 98%;"></td>
							 <td rowspan="3" style="text-align:center;"><input type="submit" value="查詢" style="width: 50px;height: 50px;"></td>
						</tr>
						<tr>
							<td>出貨狀態:</td>
							<td>
								<select name="shipState">
									<option value="">請選擇</option> 
									<c:forEach items="${shipStates}" var="state">
										<c:if test="${state==shipState}"><option value="${state}" selected="selected">${state.name}</option> </c:if>
										<c:if test="${state!=shipState}"><option value="${state}">${state.name}</option> </c:if>
									</c:forEach>
								</select>
							</td>
							<td>出貨國別:</td>
							 <td>
							 	 <select name="routeId">
							  	 <option value="0">請選擇</option>
							  	 <c:forEach items="${routes}" var="route" varStatus="a">
								  	<c:if test='${route.routeType=="PACK"}'>
								  		<c:if test="${route.routeId==routeId}"><option value="${route.routeId}" selected="selected">${route.routeName}</option></c:if>
								  		<c:if test="${route.routeId!=routeId}"><option value="${route.routeId}">${route.routeName}</option></c:if>								  		
								  	</c:if>
								  </c:forEach>
							  </select>
							 </td>
						</tr>
						<tr>
							<td>開始日期:</td>
							<td>
								<input name="beginDate" type="text" onClick="WdatePicker()" value="${beginDate}"/>
							</td>
							<td>結束日期:</td>
							<td>
							<input name="endDate" type="text" onClick="WdatePicker()" value="${endDate}" />
							</td>
						</tr>
						
					</table>
				</form>
				<h3 style="text-align: center; color: red;">${message}</h3>
				<table border="1">
				<tr>
					<th>序號</th>
					<th>PO號</th>
					<th>出貨國別	</th>
					<th>包裝方式	</th>
					<th>棧板類型	</th>
					<th>CaseMark3	</th>
					<th>CaseMark4	</th>
					<th>CaseMark6	</th>
					<th>CaseMark7	</th>
					<th>CaseMark8	</th>					
					<th>预计出货日期</th>
					<th>出貨數量</th>
					<th>倉庫入庫</th>
					<th>倉庫出貨</th>
					<th>狀態</th>
					<d:role url="/plan/toUpdate.html">
						<th>更新</th>
					</d:role>
					<d:role url="/plan/delete.html">
						<th>刪除</th>
					</d:role>
					<th>出貨棧板</th>
				</tr>
				<c:forEach items="${plans}" var="plan" varStatus="a">
					<tr class="plan" data-lot="${plan.poplan.casemark2}" >
						<td>${a.count}</td>
						<td class="${plan.poplan.casemark2}" id="${plan.planId}">${plan.poplan.casemark2}</td>
						<td>${plan.route.routeName}</td>
						<td>${plan.packType.name}</td>
						<td>${plan.palletType}</td>
						<td>${plan.poplan.casemark3}</td>
						<td>${plan.poplan.casemark4}</td>	
						<td>${plan.poplan.casemark6}</td>
						<td>${plan.poplan.casemark7}</td>
						<td>${plan.poplan.casemark8}</td>											
						<td>${plan.planDate}</td>
						<td>${plan.planAmount}</td>
						<td>${plan.acceptAmount}</td>
						<td>${plan.shipAmount}</td>
						<td>${plan.shipState.name}</td>
						<d:role url="/plan/toUpdate.html">
							<td><input type="button" value="更新" class="upButton" id="${plan.planId}"> </td>
						</d:role>
						<d:role url="/plan/delete.html">
							<td><input type="button" value="刪除" class="delButton" id="${plan.poplan.casemark2}" data-state='${plan.shipState}'> </td>
						</d:role>
						<td><input type="button" value="出貨棧板" class="shipButton" id="${plan.poplan.casemark2}"> </td>
					</tr>
				</c:forEach>
				</table>
				 </div>
                </div>
        </div>
        <br/><br/>
</body>
</html>
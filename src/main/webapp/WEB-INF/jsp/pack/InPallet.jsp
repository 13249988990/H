<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${modelName} 包裝入板</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/dumpling.css"/>" />
<script type="text/javascript" src="<c:url value="/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/validate.js"/>"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#goodsId")[0].focus(); 
	$(function(){
		$("#packForm").bind("submit",function(event){
			validate($("#goodsId, #packForm .columnValues"),event);
		});
		/* $("#goodsId").blur(function(){
			var goodsId = $(this).val();
			var reg = new RegExp($(this).attr("data-reg"));
			 if(reg.test(goodsId)){
				$(".columnNames").each(function(index){
					if($(this).text().indexOf("保證書")!=-1 || $(this).text().indexOf("外箱客戶條碼")!=-1 || $(this).text().indexOf("保证书")!=-1 || $(this).text().indexOf("外箱客户条码")!=-1){
						$(".columnValues").eq(index).attr("data-reg","^"+goodsId+"$");
					}
				});
			} 
			
		}); */
		/* $("#goodsId").change(function(){
			var goodsId = $(this).val();
			var reg = new RegExp($(this).attr("data-reg"));
			if(reg.test(goodsId)){
				$(".columnNames").each(function(index){
					if($(this).text().indexOf("保證書")!=-1 || $(this).text().indexOf("外箱客戶條碼")!=-1){
						$(".columnValues").eq(index).attr("data-reg","^"+goodsId+"$");
					}
				});
			}
			
		}); */
		
		/* $("#goodsId").change(function(){
			var goodsId = $(this).val();
			var reg = new RegExp($(this).attr("data-reg"));
			if(reg.test(goodsId)){
				$(".columnNames").each(function(index){
					if($(this).text().indexOf("保證書")!=-1 || $(this).text().indexOf("外箱客戶條碼")!=-1){
						$(".columnValues").eq(index).attr("data-reg","^"+goodsId+"$");
					}
				});
			}
			
		}); */
		
		$("#closeButton").click(function(){
			if (confirm("確定要退出嗎?")) {
				window.location.href='<c:url value="/pack/selectPackPlan.html"/>';
			}
			
		});
	});
	
});
</script>
</head>
<body>
<div id="mainbody">
<form id="packForm" method="post" action="<c:url value="/pack/packInpallet.html"/>">
<input name="routeId" type="hidden" id="routeId" value="${routeId}">
<input name="siteId" type="hidden" value="${siteId}">
<input name="palletId" type="hidden" value="${pallet.palletId}">
<input name="orderId" type="hidden" value="${order.orderId}">
<input name="poId" type="hidden" value="${poId}">

		<table border="1">
				<caption>${order.route.routeName}入板<input type="button" value="退出包裝" id="closeButton" style="margin-left: 20px;"/></caption>
				 <tr>
					<th  colspan="2">包裝工單</th>
					
					<th>工單數量</th>
					<th>完成數量</th>
				  </tr>
				  <tr>
					<td   colspan="2">${order.orderId}</td>
					
					<td><span  id="packPlanAmount">${order.planAmount}</span>臺</td>
					<td><span id="packPlanFinishAmount">${order.putInAmount}</span>臺</td>
				  </tr>
				  <tr>
					<td colspan="4" align="center"><b>棧板信息</b></td>
				</tr>
				  <tr>
					<th>栈板号</th>
					<th>包裝類型</th>
					<th>棧板類型</th>
					<!-- <th>包裝數量</th> -->
					<th>入板數量</th>
				  </tr>
				  <tr>
				  	<td>${pallet.palletId}</td>
				  	<td>${pallet.packType.name}</td>
				  	<td>${pallet.shipPlan.palletType}</td>
					<%-- <td><span id="palletPlanAmount">${pallet.planAmount}</span> 臺</td> --%>
					<td><span id="palletFinishAmount">${packAmount}</span>臺</td>
				  </tr>
				  <tr>
					<td align="center" colspan="2">PO號:</td>
					<td colspan="2">${poId}</td>
				  </tr>
				  <tr>
					<td align="center" colspan="2">外箱條碼:</td>
					<td colspan="2"><input name="goodsId" id="goodsId" type="text" autofocus="autofocus" data-reg="${order.route.regex}"/></td>
				  </tr>
				  <c:forEach items="${siteColumns}" var="column">
				 	 <tr>
						<td colspan="2" align="center" class="columnNames">${column.columnName}</td>
						<td colspan="2">
							<input type="hidden" name="siteColumnIds" class="siteColumnIds" value="${column.columnId}"/>
							<input type="text" name="columnValues" class="columnValues" data-reg="${column.regex}" data-name="${column.columnName}"/>
						</td>
				  	</tr>
			  	 </c:forEach>
			     <tr>
				  	<td colspan="4" align="center"><input type="submit" value="送出"  size="100"> </td>
				 </tr>
				 </table>
				</form>
					<h3 id="message">${message}</h3>
				<c:if test="${!empty goodses}">
						<table style="width: 700px;" border="1">
						  <tr align="center">
							<td>Item</td>
							<!-- <td>工單號碼</td> -->
							<td>客戶條碼</td>
							<td>機臺條碼</td>
							<c:forEach items="${siteColumns}" var="column">
		 						<td>${column.columnName}</td>
		 					</c:forEach>
							<td>棧板號</td>
							<td>入板时间</td>
						  </tr>	
						  <c:forEach items="${goodses}" var="goods" varStatus="a">
						  <tr align="center">
							<td>${a.index+1}</td>
							<%-- <td>${goods.order.orderId}</td> --%>
							 <td>${goods.goodsId}</td> 
							<td>${goods.barcodePrint.component.componentId}</td>
							<c:forEach items="${siteColumns}" var="column">
								<td><c:forEach items="${goods.attachmentParameters}"
										var="attachmentParameter">
								<c:if test="${attachmentParameter.column.columnId == column.columnId }">
			 						${attachmentParameter.columnValue}
			 					</c:if>
									</c:forEach></td>
							</c:forEach>
							<td>${goods.pallet.palletId}</td>
							<td><fmt:formatDate value="${goods.inPalletDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						  </tr>
						  </c:forEach>
						</table>
				</c:if>
			 </div>
</body>
</html>
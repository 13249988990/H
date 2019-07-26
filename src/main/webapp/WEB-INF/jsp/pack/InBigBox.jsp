<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${modelName} 包裝入箱</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/dumpling.css"/>" />
<script type="text/javascript" src="<c:url value="/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/validate.js"/>"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$(function(){
		$("#packForm").bind("submit",function(event){
			validate($("#packForm .columnValues"),event);
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
			
		});
		$("#goodsId").change(function(){
			var goodsId = $(this).val();
			var reg = new RegExp($(this).attr("data-reg"));
			if(reg.test(goodsId)){
				$(".columnNames").each(function(index){
					if($(this).text().indexOf("保證書")!=-1 || $(this).text().indexOf("外箱客戶條碼")!=-1){
						$(".columnValues").eq(index).attr("data-reg","^"+goodsId+"$");
					}
				});
			}
			
		});
		
		$("#goodsId").change(function(){
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
				window.location.href='<c:url value="/pack/InBox.html"/>';
			}
			
		}
		
		
		);
	});
	
});
</script>
</head>
<body>
<div id="mainbody">
<form id="packForm" method="post" action="<c:url value="/pack/packInbigBox.html"/>">
<input name="routeId" type="hidden" id="routeId" value="${routeId}">
<input name="siteId" type="hidden" value="${siteId}">
<!--  <input name="palletId" type="hidden" value="${pallet.palletId}">-->

<input name="palletId" type="hidden">
<input name="orderId" type="hidden" value="${order.orderId}">

		<table border="1">
				<caption>${site.siteName} <input type="button" value="退出包裝" id="closeButton" style="margin-left: 20px;"/></caption>
				 <tr>
					<th colspan="1">包裝工單</th>
					
					<th colspan="1">工單數量</th>
					 <th colspan="2">入大箱數量</th>
				  </tr>
				  <tr>
					<td colspan="1">${order.orderId}</td>
					
					<td colspan="1"><span  id="packPlanAmount">${order.planAmount}</span>臺</td>
					<td><span id="packPlanFinishAmount">${InBigboxAmount}</span>臺</td>
				  </tr>
				 <!--  <tr>
					<td colspan="4" align="center"><b>棧板信息</b></td>
				</tr> -->
				 <!--  <tr>
					<th>栈板号</th>
					<th>包裝類型</th>
					<th>包裝數量</th>
					<th>完成數量</th>
				  </tr>
				  <tr>
				  	<td>${pallet.palletId}</td>
				  	<td>${pallet.packType.name}</td>
					<td><span id="palletPlanAmount">${pallet.planAmount}</span> 臺</td>
					<td><span id="palletFinishAmount">${pallet.packAmount}</span>臺</td>
				  </tr>
				  -->
				<%--   <tr>
				   
					<td align="center" colspan="2">客戶條碼:</td>
					<td colspan="2"><input name="goodsId" id="goodsId" type="text"  data-reg="${order.route.regex}"/></td>
				  </tr> --%>
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
				<c:if test="${!empty boxes}">
						<table style="width: 80%" border="1">
						  <tr align="center">
							<td>Item</td>
							<!-- <td>客戶條碼</td>
							<td>機臺條碼</td> -->
							<c:forEach items="${siteColumns}" var="column">
		 						<td>${column.columnName}</td>
		 					</c:forEach>
							
							<td>入箱時間</td>
						  </tr>	
						 
						 
							
								
							
							<%-- <c:forEach items="${siteColumns}" var="column">
								
								
							 	
							 	<c:forEach items="${boxes}" var="box">
							 		 <tr align="center">
							 		 <td>${a.index+1}</td>
							 		<c:forEach items="${box.attachmentParametersList}"
							 		
											var="attachmentParameter">
											
											<c:if test="${attachmentParameter.column.columnId == column.columnId }">
			 									<td>${attachmentParameter.columnValue}</td> 
			 								</c:if>
			 								
									</c:forEach>
									
									<c:set var="packDate" value="${box.packDate }"></c:set>
									</tr>
									</c:forEach>
								 
							</c:forEach> --%>
							<c:forEach items="${boxes }" var="box" varStatus="index">
								<tr>
									<td>${index.count}</td>
									<c:forEach items="${siteColumns}" var="column">
										<td>
											<c:forEach items="${box.attachmentParametersList}" var="attachmentParameter">
											
											<c:if test="${attachmentParameter.column.columnId == column.columnId }">
			 									${attachmentParameter.columnValue}
			 								</c:if>
			 								
											</c:forEach>
										</td>
									</c:forEach>
									<td>${box.packDate}</td>
								</tr>
							
							</c:forEach>
							
							<%-- <td><fmt:formatDate value="${packDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td> --%>
						 
						 
						</table>
				</c:if>
			 </div>
</body>
</html>
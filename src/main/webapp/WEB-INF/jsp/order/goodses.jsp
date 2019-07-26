<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<%@ include file="../share/lib.jsp"%>
<title>${modelName} 生產管理系統--工單查詢</title>
<style type="text/css">
td{
	padding: 3px 5px;
	font-size: 13px;
}
</style>
</head>
<body>
	<div class="main" >
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<div id="mainbody">
				<c:if test="${!empty goodsViews}">
				<table border="1" style="text-align: center;">
					<caption>
					
					工單 ${orderId } 包装资料<br/><br/>
					<c:if test="${goodsViews.currentPage>1}">
						<a href="<c:url value="/order/showComponents.html"/>?orderId=${orderId}&pageNumber=${goodsViews.currentPage - 1}">上一頁</a> 
					</c:if>
					<c:if test="${goodsViews.currentPage<=1}">
						 上一頁
					</c:if>
					 &nbsp;&nbsp;當前頁:${goodsViews.currentPage}&nbsp;&nbsp;總頁數:${goodsViews.totalPages}&nbsp;&nbsp; 總記錄數:${goodsViews.totalRecords}&nbsp;&nbsp;
					<c:if test="${goodsViews.currentPage < goodsViews.totalPages }">
						 <a href="<c:url value="/order/showComponents.html"/>?orderId=${orderId}&pageNumber=${goodsViews.currentPage + 1}">下一頁</a>
					</c:if>
					<c:if test="${goodsViews.currentPage >= goodsViews.totalPages }">
						下一頁 
					</c:if>
					
					 </caption>
					<tr>
						<th>序號</th>
						<td>客戶條碼</td>
						<td>機臺條碼</td>
						<td>附件包條碼</td>
						<td>栈板号</td>
						<td>包裝日期</td>
					</tr>
					
						<c:forEach items="${goodsViews.records}" var="map" varStatus="s">
							<tr>
							<td>${s.count}</td>
							<c:forEach items="${map}" var="entry">
								<td>
									${entry.value}
								</td>
							</c:forEach>
							</tr>
						</c:forEach>
					
				</table>
			</c:if>		
				<c:if test="${empty goodsViews}">
					<h3>此工单未生产</h3>
				</c:if>
		</div>
	</div>
</body>
</html>
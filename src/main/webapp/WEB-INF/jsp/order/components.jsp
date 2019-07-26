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
				<c:if test="${!empty componentViews}">
				<table border="1" style="text-align: center;">
					<caption>
					
					工單 ${orderId } 機臺信息<br/><br/>
					<c:if test="${componentViews.currentPage>1}">
						<a href="<c:url value="/order/showComponents.html"/>?orderId=${orderId}&pageNumber=${componentViews.currentPage - 1}">上一頁</a> 
					</c:if>
					<c:if test="${componentViews.currentPage<=1}">
						 上一頁
					</c:if>
					 &nbsp;&nbsp;當前頁:${componentViews.currentPage}&nbsp;&nbsp;總頁數:${componentViews.totalPages}&nbsp;&nbsp; 總記錄數:${componentViews.totalRecords}&nbsp;&nbsp;
					<c:if test="${componentViews.currentPage < componentViews.totalPages }">
						 <a href="<c:url value="/order/showComponents.html"/>?orderId=${orderId}&pageNumber=${componentViews.currentPage + 1}">下一頁</a>
					</c:if>
					<c:if test="${componentViews.currentPage >= componentViews.totalPages }">
						下一頁 
					</c:if>
					
					 </caption>
					<tr>
						<!-- <th>序號</th>
						<th>工單號</th>
						<th>機臺條碼</th>
						<th>主板條碼</th>
						<th>投入日期</th> -->
						<!-- <th>MAC條碼</th> -->
						<td>${s.count}</td>
						<c:forEach items="${componentViews.records}" var="map" varStatus="s">
							<c:if test="${s.count==1 }">
								<c:forEach items="${map}" var="entry" varStatus="m">
								
									<td>${entry.key}</td>
								
							</c:forEach>
							</c:if>
						</c:forEach>
					</tr>
					
						<c:forEach items="${componentViews.records}" var="map" varStatus="s">
							<tr>
							<td>${s.count}</td>
							
							<c:forEach items="${map}" var="entry" varStatus="m">
								
									<td>${entry.value}</td>
								
							</c:forEach>
							
							</tr>
						</c:forEach>
					
				</table>
			</c:if>	
				<c:if test="${empty componentViews}">
					<h3>此工单未生产</h3>
				</c:if>
		</div>
	</div>
</body>
</html>
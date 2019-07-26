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
			<c:if test="${!empty attachmentViews}">
				<table border="1">
						<caption>
					工單 ${orderId } 附件信息<br/><br/>
					<c:if test="${attachmentViews.currentPage>1}">
						<a href="<c:url value="/order/showComponents.html"/>?orderId=${orderId}&pageNumber=${attachmentViews.currentPage - 1}">上一頁</a> 
					</c:if>
					<c:if test="${attachmentViews.currentPage<=1}">
						 上一頁
					</c:if>
					 &nbsp;&nbsp;當前頁:${attachmentViews.currentPage}&nbsp;&nbsp;總頁數:${attachmentViews.totalPages}&nbsp;&nbsp;總記錄數:${attachmentViews.totalRecords}&nbsp;&nbsp;
					<c:if test="${attachmentViews.currentPage < attachmentViews.totalPages }">
						 <a href="<c:url value="/order/showComponents.html"/>?orderId=${orderId}&pageNumber=${attachmentViews.currentPage + 1}">下一頁</a>
					</c:if>
					<c:if test="${attachmentViews.currentPage >= attachmentViews.totalPages }">
						下一頁 
					</c:if>
					
					 </caption>
					<tr>
						<th>序號</th>
						<th>附件包條碼</th>
						<c:forEach items="${siteColumns}" var="column">
		 				<th>${column.columnName}</th>
		 				</c:forEach>
						<th>投入时间</th>
					</tr>

					<c:forEach items="${attachmentViews.records}" var="attachment" varStatus="a">
						<tr>
							<td>${a.index +1}</td>
							<td>${attachment.attachmentNo}</td>
							<c:forEach items="${siteColumns}" var="column">
								<td><c:forEach items="${attachment.attachmentParameters}"
										var="attachmentParameter">
										<c:if
											test="${attachmentParameter.column.columnId == column.columnId }">
			 						${attachmentParameter.columnValue}
			 					</c:if>
									</c:forEach></td>
							</c:forEach>
							<td><fmt:formatDate value="${attachment.createDate}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
						</tr>
					</c:forEach>

				</table>
			</c:if>
				<c:if test="${empty attachmentViews}">
					<h3>此工单未生产</h3>
				</c:if>
		</div>
	</div>
</body>
</html>
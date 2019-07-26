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
<title>${modelName} 生產管理系統--棧板查詢</title>
</head>

<body style="background-color: #ECE9D8">
	<div class="main">
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<div  style="background-color: #ECE9D8; width: 1000px; margin: 20px auto;">
			<form id="myform" action="<c:url value="/query/queryOrder.html"/>">
						<table style="text-align: center; margin: 0 auto;">
							<tr>
								<td>請輸入工單號:</td>
								<td><input type="text" name="orderId"> </td>
								<td><input type="submit" value="送出"> </td>
							</tr>
						</table>
					
				</form>
			<h3 style="color:#FF0000; text-align: center;">${message}</h3>
			<c:if test="${!empty componentViews}">
				<table border="1" style="text-align: center;">
					<caption>
					
					工單 ${orderId } 機臺信息<br/><br/>
					<c:if test="${componentViews.currentPage>1}">
						<a href="<c:url value="/query/queryOrder.html"/>?orderId=${orderId}&pageNumber=${componentViews.currentPage - 1}">上一頁</a> 
					</c:if>
					<c:if test="${componentViews.currentPage<=1}">
						 上一頁
					</c:if>
					 &nbsp;&nbsp;當前頁:${componentViews.currentPage}&nbsp;&nbsp;總頁數:${componentViews.totalPages}&nbsp;&nbsp; 總記錄數:${componentViews.totalRecords}&nbsp;&nbsp;
					<c:if test="${componentViews.currentPage < componentViews.totalPages }">
						 <a href="<c:url value="/query/queryOrder.html"/>?orderId=${orderId}&pageNumber=${componentViews.currentPage + 1}">下一頁</a>
					</c:if>
					<c:if test="${componentViews.currentPage >= componentViews.totalPages }">
						下一頁 
					</c:if>
					
					 </caption>
					<tr>
						<th>序號</th>
						<th>工單號</th>
						<th>機臺條碼</th>
						<th>上模组</th>
						<th>投入日期</th>
						<th>上CIS</th>
						<th>投入日期</th>
						<th>下CIS</th>
						<th>投入日期</th>
						<!-- <th>MAC條碼</th> -->
					</tr>
					
						<c:forEach items="${componentViews.records}" var="map" varStatus="s">
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
			
		</div>
	</div>

</body>
</html>
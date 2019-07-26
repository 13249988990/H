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
		font-family: "宋体"
	}
	#tb2,#tb2 tr,#tb2 tr td,#tb2 tr th{
		border: solid 2px gray;
		
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
			<form id="myform" method="post" action="<c:url value="/query/cisQuery.html"/>">
				<input type="hidden" id="barcode" value="${queryType}">
						<table border="1" style="text-align: center; margin: 0 auto;">
							<tr>
								<th colspan="4">請選擇查詢方式:</th>
							</tr>
							<tr>
								<td>機臺條碼:<input type="radio" value="1" name="queryType"  checked="checked"> </td>
								<td>上模组:<input type="radio" value="2" name="queryType"></td>
								<td>上CIS:<input type="radio" value="3" name="queryType"></td>
								<td>下CIS:<input type="radio" value="4" name="queryType"></td>
							</tr>
							<tr>
								<td>請輸入條碼</td>
								<td colspan="2"><input type="text" name="queryNo" id="queryNo" required="required"> </td>
								<td ><input type="submit" value="送出"> </td>
							</tr>
						</table>
					
				</form>
			<h3 style="color:#FF0000; text-align: center;">${message}</h3>
			
			<c:if test="${not empty record }">
				<table id="tb2">
					<tr>
						<th>机台号</th>
						<th>上模组</th>
						<th>上CIS</th>
						<th>时间</th>
						<th>下模组</th>
						<th>下CIS</th>
						<th>时间</th>
					</tr>
					<tr>
						<td>${record.col_component_id}</td>
						<td>${record.shangmozu}</td>
						<td>${record.shangcis}</td>
						<td>${record.shangdate}</td>
						<td>${record.xiamozu}</td>
						<td>${record.xiacis}</td>
						<td>${record.xiadate}</td>
					</tr>
				</table>
			</c:if>
				
				
		</div>
	</div>

</body>
</html>
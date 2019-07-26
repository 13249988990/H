<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="../share/lib.jsp" %>
<title>${modelName} 生產管理系統</title>
<style type="text/css">
#myTable td{
		width: 100px;
		height: 50px;
		text-align:  center;
		font-size: 20px;
		font-weight: bold;	
	}
#myTable td input{
	text-align: center;
}
#packType{
	display: none;
}
</style>
<script>
 $(document).ready(function(){
	$("#submit1").click(function(){
		var routeId = ($("#palletId").val());
		
		if(routeId==null||routeId==""){
			alert('請輸入棧板號！');
			return false;
		};
		
		
		
		reg = new RegExp($("#palletId").attr("data-reg"));
		
		
		if(!reg.test($("#palletId").val())){
			alert("棧板號格式有誤 "+$("#palletId").val()+"=="+reg);
			$("#palletId").val("");
			
			return false;
		}
		
	});
	

}); 

</script>
</head>
<body style="background-color:#ECE9D8">
	<div style="text-align: center;">
		<div class="main">
			<div class="menu">
				<%@ include file="../share/menu.jsp"%>
			</div>
			<div id="mainbody">
				<form id="orderForm" method="post"
					action="<c:url value="/machine/unPallet.html"/>">
					<%-- <input type="hidden" value="${currentTime}" id="currentTime"> --%>
					<table border="1" style="width: 400px;">
						<caption>重入解板</caption>
						<tr>
							<td colspan="2">棧 板 號：<input type="text" required="required" name="palletId"  id="palletId" data-reg="^DR[257]\d{5}$"></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" id="submit1" value="送出"></td>
						</tr>
					</table>
					<h3 style="color: #FF0000">${message}</h3>
					
				</form>
				
			</div>
		</div>
	</div>

</body>
<!-- InstanceEnd --></html>
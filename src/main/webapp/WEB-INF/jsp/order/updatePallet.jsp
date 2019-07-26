<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="../share/lib.jsp" %>
<style type="text/css">
.packType{
	width: 80px;
}
</style>
<script type="text/javascript" src="<c:url value="/js/My97DatePicker/WdatePicker.js"/>"></script>
<title>${modelName} 更新棧板數量</title>
<script type="text/javascript">
$(document).ready(function(){
	
});
</script>
</head>

<body>
<div style="text-align: center;">
        <div class="main">
                <div class="menu">
                <%@ include file="../share/menu.jsp"%>
                </div>
                <div id="mainbody">
			<form id="shipPlanform" name="form1"  method="post" action="<c:url value="/plan/updatePallet.html"/>">
				<input type="hidden" name="palletId" value="${pallet.palletId}">
				<table border="1" style="width: 400px;">
				  <caption>更新棧板數量</caption>
				  		<tr>
							<td>棧板號:</td>
							<td class="myleft">${pallet.palletId}</td>
						</tr>
						<tr>
							<td>包裝方式:</td>
							<td class="myleft">${pallet.packPlan.packType.name}</td>
						</tr>
						<tr>
							<td>完成數量</td>
							<td class="myleft">${pallet.packAmount}</td>
						<tr>
						<tr>
							<td>棧板數量:</td>
							<td class="myleft"><input id="planAmount"
								name="planAmount" type="text" value="${pallet.planAmount}"
								pattern="\d+" required="required" /></td>
						</tr>
						<tr>
							<td colspan="2"><button type="submit" style="width: 100px;">更新</button></td>
						</tr>
					</table>
				<h3 style="color:red;">${message}</h3>
				</form>
				
                </div>
        </div>
</div> 

</body>
</html>
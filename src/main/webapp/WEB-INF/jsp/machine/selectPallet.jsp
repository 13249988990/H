<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../share/lib.jsp" %>
<title>${modelName} 生產管理系統</title>
<script type="text/javascript">
	$(function(){
		$("#subButton").remove("disabled");
		
		$("#myForm").submit(function(){
			if($("#modelId").val()==""){
				$("#modelId").focus();
				return false;
			}
			if($("#palletId").val()==""){
				$("#palletId").focus();
				return false;
			}

			var reg = new RegExp($("#palletId").attr("data-reg"));
			if(!reg.test($("#palletId").val())){
				alert("棧板號格式有誤 "+$("#palletId").val()+"=="+reg);
				$("#palletId").select();
				return false;
			}
			$("#subButton").attr("disabled","disabled");
		});
		$("#modelId").change(function(){
			var modelId = parseInt($(this).val());
			if(modelId>0)
			{
				$.get('<c:url value="/machine/getpallet.html"/>', {"modelId":modelId}, function(data){
					if(data){
						$("#palletId").attr("value",data);
					}
				});
			}

		});
		
	});
</script>

</head>
<body >
<div class="main">
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<div id="mainbody" >
		<form action="<c:url value="/machine/selectPallet.html"/>" method="post" id="myForm">
				<table border="1">
				<caption>裸機入板</caption>
				<tr>
					<th>機型:</th>
						<td class="myleft"><select name="modelId" id="modelId">
								<option value="">請選擇</option>
								<option value="1">1200</option>
								<option value="2">1250W</option>
								<option value="3">1700W</option>
								<option value="4">1700W(CH14)</option>
						</select></td>
					</tr>
				<tr>
					<th>棧板號:</th>
					<td><input type="text" id="palletId" name="palletId" data-reg="^DR[257J]\d{5}$" value="${palletId}"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="送出"> </td>
				</tr>
			</table>
			<h3 id="message">${message}</h3>
		</form>
		</div>
	</div>
</body>
</html>
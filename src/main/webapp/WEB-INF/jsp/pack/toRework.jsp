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
		
		$("#selectPlanForm").submit(function(){
			if($("#packTypeId").val()=="0"){
				alert("請選擇包裝方式!");
				return false;
			}
			if($("#lotId").val()==""){
				$("#lotId").focus();
				return false;
			}
			if($("#palletId").val()==""){
				$("#palletId").focus();
				return false;
			}
			var reg = new RegExp($("#palletId").attr("data-reg"));
			if(!reg.test($("#palletId").val())){
				alert("棧板號格式有誤 ");
				$("#palletId").select();
				return false;
			}
			$("#subButton").attr("disabled","disabled");
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
		<form action="<c:url value="/pack/toRework.html"/>" method="post" id="selectPlanForm">
				<table border="1">
				<caption>包裝入板</caption>
				 <tr>
						<th>包裝方式</th>
						<td class="myleft">
						  <select name="packTypeId" id="packTypeId" style="width: 155px;">
						  <option value="0">请选择</option>
						  <c:forEach items="${packTypes}" var="packType" varStatus="a">
						  		<option value="${packType.packTypeId}">${packType.name}</option>
						  </c:forEach>
						  </select>
						</td>
					</tr>
				<tr>
					<th>工單號:</th>
					<td><input type="text" name="lotId" required="required" id="lotId"> </td>
				</tr>
				<tr>
					<th>棧板號:</th>
					<td><input type="text" id="palletId" name="palletId" data-reg="^DO\d{6}$" value="${palletId}"></td>
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
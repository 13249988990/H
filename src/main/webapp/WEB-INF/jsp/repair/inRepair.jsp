<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp"%>
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="../share/lib.jsp"%>
<script type="text/javascript">
$(function(){
	$("#parentId").change(function(){
		$("#badItemId option:gt(0)").remove();
		var parentId = $(this).val();		
		if(parentId){
			$.get('<c:url value="/badItem/getChilds.html"/>',{"parentId": parentId},function(data){
				var html = "";
				for(var i=0; i < data.length; i++){
					html += "<option value='"+data[i].badItemId+"'>"+data[i].name+"</option>";
				}
				$("#badItemId").append(html);
			});
		}
	});
	$("#myForm").submit(function(){
		if($("#badItemId").val()==""){
			alert("請選擇不良項目!");
			return false;
		}
	});
});
</script>
<title>${modelName} 入檢修</title>
</head>

<body>
	<div class="main" >
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<div id="mainbody">
				<form id="myForm" method="post" action="<c:url value="/repair/inRepair.html"/>">
					<input type="hidden" value="${component.componentId}" name="componentId">
					<table border="1">
						<caption>入修系統</caption>
						<tr>
							<td>機臺條碼:</td>
							<td>${component.componentId}</td>
						</tr>
						<tr>
							<td>機種:</td>
							<td>${component.route.routeName}</td>
						</tr>
						<tr>
							<td>線別:</td>
							<td>${component.order.line}</td>
						</tr>
						<tr>
							<td>測試站別:</td>
							<td style="text-align: left;">
								<select id="parentId" name="parentId">
									<option value="">請選擇</option>
									<c:forEach items="${parents}" var="badItem">
										<option value="${badItem.badItemId}">${badItem.name}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td>不良項目</td>
							<td style="text-align: left;">
								<select id="badItemId" name="badItemId">
									<option value="">請選擇</option>
								</select>
								
							</td>
						</tr>
						<tr>
							<td>備註</td>
							<td style="text-align: left;"><textarea name="inRemark"></textarea></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="送出"> </td>
						</tr>
					</table>
				</form>
			<h1 style="color:#FF0000; ">${message}</h1>
		</div>
	</div>
	<hr />
	<div id="doc">
		<div class="demo">
			<marquee behavior="scroll" direction="left" scrollamount="2">
				<p>
					<span class="style1">客戶至上 技術領先 制度完善 全員參與
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Customer First Leading Technlongy
						Systematic Processes Employee Participation </span>
				</p>
			</marquee>
		</div>
	</div>

</body>
</html>
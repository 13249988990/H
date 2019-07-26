<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="../share/lib.jsp" %>
<script type="text/javascript" src="<c:url value="/js/My97DatePicker/WdatePicker.js"/>"></script>
<title>${modelName} 生產管理系統--創建po計劃</title>
<script>
$(document).ready(function(){	
	$("#myForm").bind("submit",function(){
		if($("#modelId").val()==""){
			alert("请选择機型");
			$("#modelId").focus();
			return false;
		}
		if($("#locationId").val()==""){
			
			alert("请选择國別");
			$("#locationId").focus();
			return false;
		}
		if(isNaN($("#planAmount").val())){
			alert("數量值只能是數字");
			$("#planAmount").select();
			return false;
		}
		if($("#planAmount").val()<=0){
			alert("请輸入數量");
			$("#planAmount").focus();
			return false;
		}
		if($("#packTypeId").val()=="" && $("#packType").css("display")!='none'){
			alert("请选择包裝方式!");
			
			$("#packTypeId").focus();
			return false;
		}
		if($("#palletType").val()==""&& $("#packType").css("display")!='none'){
			alert("请选择棧板類型");
			$("#palletType").focus();
			return false;
		}
		if($("#casemark2").val()==""){
			
			alert("请輸入casemark2");
			$("#casemark2").focus();
			return false;
		}
		if($("#casemark3").val()==""){
			
			alert("请輸入casemark3");
			$("#casemark3").focus();
			return false;
		}
		if($("#casemark4").val()==""){
			
			alert("请輸入casemark4");
			$("#casemark4").focus();
			return false;
		}
		if($("#planDate").val()=="" && $("#PlanDate").css("display")!='none'){
			alert("请選擇出貨日期!");
			
			$("#planDate").focus();
			return false;
		}
		if(parseInt($("#casemark6").val()) != parseInt($("#planAmount").val())){
			alert("計劃數量與casemark6不相等!");
			return false;
		}
	});
	//<option value="${location.locationId}">${location.locationName}-${location.locationType}-${location.modelCode}</option>
	$("#modelId").change(function(){
	    if($(this).val()==7){
			$("#packType").hide();
			$("#palletTypeId").hide();
			$("#PlanDate").hide();
	    }
	    $("#locationId").empty();
		$("#locationId").append("<option value=''>請選擇</option>");
		//var modelId = parseInt($(this).val());
		var modelName=$(this).find("option:selected").text();
		$.ajax({
		    type: "POST",
		    url: "getLocationByModelName.html",
		    async:false,
		    data: {modelName:modelName},
		    dataType:"json",
		    success: function(msg){
				
				
		      for(var i=0;i<msg.length;i++){
			  	$("#locationId").append("<option value='"+msg[i].locationId+"'>"+msg[i].locationName+"-"+msg[i].locationType+"-"+msg[i].modelCode+"</option>")
		      }
		    }
		 });
		//getLocationByModelName
		/* if(modelId==1){
			//alert($("#locationId").val(21))
            $("#locationId").val("");

			for(i=1;i<13;i++)
			{
				$("#locationId").children("option[value='"+i+"']").show();
			}
			for(i=13;i<=18;i++)
			{
				$("#locationId").children("option[value='"+i+"']").hide();
			}  
			for(i=31;i<=34;i++)
			{
				$("#locationId").children("option[value='"+i+"']").hide();
			}
			$("#packType").show();
			$("#palletTypeId").show();
			$("#PlanDate").show();	
        }else if(modelId==2){
            $("#locationId").val("");
            for(i=1;i<13;i++)
			{
				$("#locationId").children("option[value='"+i+"']").hide();
			}
			for(i=13;i<=18;i++)
			{
				$("#locationId").children("option[value='"+i+"']").show();
			}
			for(i=31;i<=34;i++)
			{
				$("#locationId").children("option[value='"+i+"']").hide();
			}
			$("#packType").show();
			$("#palletTypeId").show();
			$("#PlanDate").show();	
        }else{
        	$("#locationId").val("");
            for(i=1;i<=18;i++)
			{
				$("#locationId").children("option[value='"+i+"']").hide();
			}
			for(i=31;i<=34;i++)
			{
				$("#locationId").children("option[value='"+i+"']").show();
			}
			$("#packType").hide();
			$("#palletTypeId").hide();
			$("#PlanDate").hide();			
        } */
	});
	$("#locationId").change(function(){
		var locationId = parseInt($(this).val());
		if(locationId>0)
		{
			$.get('<c:url value="/plan/getcasemark1.html"/>', {"locationId":locationId}, function(data){
				if(data){
					$("#casemark1").attr("value",data);
				}
			});
			$.get('<c:url value="/plan/getcasemark7.html"/>', {"locationId":locationId}, function(data){
				if(data){
					$("#casemark7").attr("value",data);
				}
			});
			$.get('<c:url value="/plan/getcasemark8.html"/>', {"locationId":locationId}, function(data){
				if(data){
					$("#casemark8").attr("value",data);
				}
			});
		}

	});

	$("#planAmount").on('blur',function(){
		if($(this).val()!=''){
			$("#casemark6").val($(this).val());
		}
	});

});

</script>
</head>
<body style="background-color:#ECE9D8">
	<div style="text-align: center ;">
		<div class="main">
			<div class="menu">
				<%@ include file="../share/menu.jsp"%>
			</div>
			<div id="mainbody">
				<form id="myForm" method="post"
					action="<c:url value="/plan/poAdd.html"/>">
					<table border="1" style="width: 400px;">
						<caption>新增PO計劃</caption>
						<tr>
							<td>機型</td>
							<td class="myleft"><select name="modelId" id="modelId" class="font_input" 
								style="width: 200px;">
									<option value="">請選擇</option>
									<c:forEach items="${models}" var="model">
										<option value="${model.modelId}" >${model.modelName}</option>
									</c:forEach>
							</select></td>
						</tr>
						<tr id="location">
							<td>國別:</td>
							<td class="myleft"><select name="locationId" id="locationId"
								style="width: 200px;">
									<option value="">請選擇</option>

									<%-- <c:forEach items="${locations}" var="location">
										<option value="${location.locationId}">${location.locationName}-${location.locationType}-${location.modelCode}</option>
									</c:forEach> --%>
							</select></td>
						</tr>
						<tr>
							<td>數量</td>
							<td class="myleft"><input name="planAmount" id="planAmount"
								style="width: 200px;" type="text" data-reg="[1-9]\d?"></td>
						</tr>
						<tr id="packType">
							<td>包裝方式:</td>
							<td class="myleft"><select name="packTypeId" id="packTypeId"
								style="width: 200px;">
									<option value="">請選擇</option>
									<c:forEach items="${packTypes}" var="packType">
										<c:if test="${packTypeId==packType.packTypeId}">
											<option value="${packType.packTypeId}" selected="selected">${packType.name}</option>
										</c:if>
										<c:if test="${packTypeId!=packType.packTypeId}">
											<option value="${packType.packTypeId}">${packType.name}</option>
										</c:if>
									</c:forEach>
							</select></td>
						</tr>
						<tr id="palletTypeId">
							<td>棧板類型:</td>
							<td class="myleft"><select name="palletType" id="palletType"
								style="width: 200px;">
									<option value="">請選擇</option>
									<option value="膠棧板">膠棧板</option>
									<option value="木棧板">木棧板</option>
									
							</select></td>
						</tr>
						<tr>
							<td>Case Mark1</td>
							<td class="myleft"><input name="casemark1" id="casemark1"
								readonly="readonly"  type="text" style="width: 200px;"></td>
						</tr>
						<tr>
							<td>Case Mark2</td>
							<td class="myleft"><input name="casemark2" id="casemark2"
								type="text" style="width: 200px;"></td>
						</tr>
						<tr>
							<td>Case Mark3</td>
							<td class="myleft"><input name="casemark3" id="casemark3" type="text" 
								style="width: 200px;"></td>
						</tr>
						<tr>
							<td>Case Mark4</td>
							<td class="myleft"><input name="casemark4" id="casemark4" type="text" 
								style="width: 200px;"></td>
						</tr>
						<tr>
							<td>Case Mark5</td>
							<td class="myleft"><input name="casemark5" id="casemark5" type="text" 
								readonly="readonly" style="width: 200px;" value="MADE IN CHINA"></td>
						</tr>
						<tr>
							<td>Case Mark6</td>
							<td class="myleft"><input name="casemark6" id="casemark6" type="text" 
								readonly="readonly" style="width: 200px;"></td>
						</tr>
						<tr>
							<td>Case Mark7</td>
							<td class="myleft"><input name="casemark7" id="casemark7" type="text" 
								readonly="readonly" style="width: 200px;"></td>
						</tr>
						<tr>
							<td>Case Mark8</td>
							<td class="myleft"><input name="casemark8" id="casemark8" type="text" 
								readonly="readonly" style="width: 200px;"></td>
						</tr>
						<tr id="PlanDate">
							<td>出货日期:</td>
							<td class="myleft"><input name="planDate" id="planDate" style="width: 200px;"
								type="text" onClick="WdatePicker()" /></td>
						</tr>
						<tr>
						<td colspan="2"><input type="submit" value="送出"></td>
						</tr>
					</table>
					<h3 style="color: #FF0000">${message}</h3>
				</form>
				
			</div>
		</div>
	</div>

</body>
<!-- InstanceEnd --></html>
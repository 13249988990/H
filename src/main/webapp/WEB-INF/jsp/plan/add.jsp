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
<title>${modelName} 建立出貨計畫</title>
<script type="text/javascript">
$(document).ready(function(){
	$("#routeId").focus();
	
	$("#routeId").change(function(){
		var routeId = parseInt($(this).val());
		if(routeId > 0){
			$.get('<c:url value="/route/getLotRegex.html"/>', {"routeId":routeId}, function(data){
				$("#lotId").attr("data-reg",data);
			});
		}
		packTypeShow(routeId);
	});
	
	$("#lotId").change(function(){
		if($(this).val()){
			$.get('<c:url value="/plan/checkLot.html"/>', {"lotId":$(this).val()}, function(data){
				if(data=="1"){
					alert($("#lotId").val()+" lotId 已存在!");
					$("#lotId").select();
				}
			},"text");
		}
		
	});
	
	createPackItem($("#shipCount").val());
	
	$("#shipCount").change(function(){
		createPackItem($(this).val());
	});
	
	function createPackItem(amount){
		if(amount>0){
			var html = '<table border="1" style="width:400px;"><tr><th>序號</th><th>包裝方式</th><th>包裝數量</th><th>备注</th></tr>';
			for(var i=0; i<amount; i++){
				html += '<tr><td>'+(i+1)+'<input type="hidden" name="items"></td><td><select name="packTypeId" class="packType"></select></td><td><input type="text" name="packAmount" size="5" pattern="[0-9]+" required></td><td><input type="text" name="remark"></td></tr>'; 
			}
			html += "</table>";
			$("#packItem").html(html);
			$("select[name=packTypeId]").each(function(){
				$(this).append("<option value=0>請選擇</option>");
				<c:forEach items="${packTypes}" var="packType" varStatus="a">
				$(this).append("<option value=${packType.packTypeId}>${packType.name}</option>");
				</c:forEach>
			});
		}else{
			$("#packItem").html("");
		}
	}
	
	
	$("#shipPlanform").submit(function(event){
		if($("#routeId").val()<=0){
			alert("請選擇包裝流程!");
			$("#routeId").focus();
			return false;
		}
		if($("#lotId").val()==""){
			$("#lotId").focus();
			return false;
		}
		var reg = new RegExp($("#lotId").attr("data-reg"));
		if(!reg.test($("#lotId").val())){
			alert("Lot Id 編碼有誤!"+$("#lotId").val()+"=="+reg);
			return false;
		}
		if($("#totalAmount").val()=="" || $("#totalAmount").val()<=0){
			$("#totalAmount").focus();
			return false;
		}
		if(isNaN($("#totalAmount").val())){
			alert("出貨總數不能為非數字!");
			$("#totalAmount").select();
			return false;
		}
		if($("#planDate").val()==""){
			$("#planDate").focus();
			return false;
		}
		if($("#shipCount").val()<="0"){
			alert("請選擇棧板種類!");
			$("#shipCount").focus();
			return false;
		}
		
		$("select[name='packTypeId']").each(function(index){
			if($(this).val()<='0'){
				alert("請選擇 第"+(index+1)+"項的包裝方式!");
				event.preventDefault();
				return false;
			}
		});
		if(!event.isDefaultPrevented()){
			var totalAmount = 0;
			$("input[name='packAmount']").each(function(index){
				var amount = $(this).val();
				if(amount && !isNaN(amount)){
					totalAmount += parseInt(amount);
				}else{
					alert("包裝數量不為空或非數字!");
					event.preventDefault();
					return false;
				}
			});
			if(!event.isDefaultPrevented()){
				if($("#totalAmount").val()!=totalAmount){
					alert("包裝數量"+totalAmount+"與出貨總數"+$("#totalAmount").val()+"不相等!");
					return false;
				}
				$("input[name='items']").each(function(index){
					$packTypeId= $("select[name='packTypeId']").eq(index);
					$planAmount=$("input[name='packAmount']").eq(index);
					$remark = $("input[name='remark']").eq(index);
					var itemValue = $packTypeId.val()+"_"+$planAmount.val()+"_"+$remark.val();
					$(this).val(itemValue);
				});
			}
			
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
				<form id="shipPlanform" name="form1"  method="post" action="<c:url value="/plan/add.html"/>">
				<table border="1" style="width: 400px;">
				  <caption>創建出货计划</caption>
				   <tr>
						<td>出货國別:</td>
						<td class="myleft">
						  <select name="routeId" id="routeId" style="width: 155px;">
						  <option value="0">请选择</option>
									<c:forEach items="${routes}" var="route" varStatus="a">
										<c:if test='${route.routeType=="PACK"}'>
											<option value="${route.routeId}">${route.routeName}</option>
										</c:if>
									</c:forEach>
							</select>
						</td>
					</tr>
				  <tr>
				  	<td>Lot ID:</td>
					<td class="myleft">
					  <input type="text" id="lotId" name="lotId"  data-reg="^DO[AUECKIJ][USNOHP][1-6ARDN]\d{4}$" required>
					</td>
				  </tr>
				  <tr>
				  		<td>出貨總數:</td>
						<td class="myleft">	<input id="totalAmount" name="totalAmount" type="text" pattern="\d+" required="required"/>	</td>
				  </tr>
				  <tr>
						<td>出货日期:</td>
						<td class="myleft"><input name="planDate" id="planDate" type="text" onClick="WdatePicker()" required="required"/>
						</td>
					</tr>
				 
					<tr>
					<td>棧板種類:</td>
					
					<td class="myleft"> <select id="shipCount" name="shipCount" style="width: 155px;">
							<option value="0">請選擇</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</td>
				  </tr>
				</table>
				<h3 style="color:red;">${message}</h3>
				<div id="packItem">
				
				</div>
				
				<br/>
				<d:role url="/plan/toAdd.html">
					<button type="submit" style="width: 100px;">送　出</button>
				</d:role>
				</form>
				
                </div>
        </div>
</div> 

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${modelName} OBA檢測</title>
<%@ include file="../share/lib.jsp" %>
<script type="text/javascript">

	$(function(){
	    $(".goodsId:first").focus();
		/* $(".columnNames").each(function(index){
			if($(this).text().indexOf("保證書")!=-1 || $(this).text().indexOf("外箱客戶條碼")!=-1){
				$(".columnValues").eq(index).attr("data-reg","^"+$("#myGoodsId").val()+"$");
			}
		}); */
		$("#form1").bind("submit",function(event){
		    
			validate($(".goodsId"),event);
		});
	});
	
	/* function validate($columns,$results,event){
		$columns.each(function(index){
			var reg = new RegExp($(this).attr("data-reg"));
			if($(this).val()==null || $(this).val()==""){
				$(this).focus();
				event.preventDefault();
				return false;
			}
			if(reg.test($(this).val())){
				$results.eq(index).css("background-color","green");
			}else{
				$results.eq(index).css("background-color","red");
				$(this).select();
				event.preventDefault();
				return false;
			}
		});
	} */

</script>
</head>
<body>
<div class="main">
	<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
<div id="mainbody">
	<c:if test="${goods == null }">
		<form id="form1" action="<c:url value="/pack/OBACheckBox.html"/>" >
			<table border="solid 1px">
				<caption>OBA 檢測</caption>
				<tr>
					<td>里盒客戶條碼1:</td>
					<td><input type="text" class="goodsId" name="goodsIds" data-reg="^[UE]\w{14}$"></td>
					
				</tr>
				<tr>
					<td>里盒客戶條碼2:</td>
					<td><input type="text" class="goodsId" name="goodsIds" data-reg="^[UE]\w{14}$"></td>
					
				</tr>
				<tr>
					<td>里盒客戶條碼3:</td>
					<td><input type="text" class="goodsId" name="goodsIds" data-reg="^[UE]\w{14}$"></td>
					
				</tr>
				
				<tr>
					<td>外箱客戶條碼1:</td>
					<td><input type="text" class="goodsId" name="goodsIds" data-reg="^[UE]\w{14}$"></td>
					
				</tr>
				<tr>
					<td>外箱客戶條碼2:</td>
					<td><input type="text" class="goodsId" name="goodsIds" data-reg="^[UE]\w{14}$"></td>
					
				</tr>
				<tr>
					<td>外箱客戶條碼3:</td>
					<td><input type="text" class="goodsId" name="goodsIds" data-reg="^[UE]\w{14}$"></td>
					
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="送出"> </td>
				</tr>
			</table>
		</form>
	</c:if>
	
	<c:if test="${goods != null}">
		<form id="obaForm" action="<c:url value="/pack/OBACheck.html"/>">
		<input id="myGoodsId" value="${goods.goodsId}" type="hidden"/>
		<input name="pass" value="true" type="hidden"/>
		<table border="1" id="obaTable" style="width:400px;">
				<caption>OBA檢測 </caption>
				  <tr>
				  	<th>制品條碼</th>
				  	<th>機臺條碼</th>
					<th>栈板号</th>
					<th>PO 號</th>
				  </tr>
				  <tr>
				  	<td>${goods.goodsId}</td>
				  	<td>${goods.barcodePrint.component.componentId}</td>
				  	<td>${goods.pallet.palletId}</td>
					<td>${goods.pallet.shipPlan.poplan.casemark2}</td> 
				  </tr>
				  <tr>
					<td align="center">制品條碼</td>
					<td colspan="3"><input name="goodsId" id="goodsId" type="text" style="width: 300px" autofocus="autofocus" data-reg="^${goods.goodsId}$"/></td>
				  	<td class="results"></td>
				  </tr>
				  <c:forEach items="${siteColumns}" var="column" varStatus="v">
				  <tr>
					<td align="center" class="columnNames">${column.columnName}</td>
					<td colspan="3">						
						<input type="text" name="columnValues" style="width: 300px" class="columnValues" data-reg="${column.regex}"/>						
					</td>
					<td class="results" style="width: 40px;"></td>
				  </tr>
			  </c:forEach>
			   	<tr>
				  	<td colspan="4" align="center"><input type="submit" value="送出"  size="100" id="checkButton"> </td>
				  </tr>
		</table>
		</form>
	</c:if>
		<h3 id="message">${message}</h3>
</div>
</div>
</body>
</html>
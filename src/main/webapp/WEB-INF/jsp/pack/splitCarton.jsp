<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/LCDMES.dwt.jsp" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="../share/lib.jsp" %>
<title>${modelName} 生產管理系統</title>
</head>
<script type="text/javascript">
var M = {

}
$(function(){
	$("#isClear").attr("checked",false);
	//alert(123)
	/* $("#form1").submit(function(){
	    //alert($("#isClear").val())
		 if($("#isClear").val()=='3'){
		     alert()
		     M.dialog3 = jqueryAlert({
			    'title'   : '警告',
			    'content' : '请选择是否清零!',
			    'modal'   : true,
			    'height' : "140",
			    'width' : "200",
			    'buttons' :{
			        '清零' : function(){
			            $("#isClear").attr("checked",true);
						$("#isClear").val("0");
						
						$("#form1").submit();
						
			           
			            
			           
			        },
			        '不清零' : function(){
			            $("#isClear").attr("checked",false);
						$("#isClear").val("1");
						
						$("#form1").submit();
						
						
						 
			        }
			    }
		
			})
		     return false;
		 }else{
		     M.dialog3.close();
		     $("#form1").submit();
		 } */
	})
	
});

</script>
<body>
<div>
		<div class="main">
			<div class="menu">
				<%@ include file="../share/menu.jsp"%>
			</div>
			<div id="mainbody" style="background-color: #ECE9D8; width: 1000px;">
				<form id="form1" method="post" action="<c:url value="/pack/splitCarton.html"/>">
					<table border="solid 1px" width="40%">
						<caption>彩盒拆除</caption>
						<!-- <tr>
							
							<td>是否清零:</td>
							<td><input type="checkbox" name="isClear" id="isClear" value="3"></td>
						</tr> -->
						<tr>
							
							<td>客户条码:</td>
							<td><input name="goodsId" type="text" autofocus="autofocus" placeholder="彩盒对应的客户条码" required="required">
							</td>
						</tr>
						
						<tr>
							<td colspan="2"><input type="submit" name="Submit"
								value="拆除"></td>
						</tr>
						
					</table>
				</form>
				<br>
				<h3 id="message">${message}</h3>
				<br>
				<form action="<c:url value="/pack/splitBox.html"/>" method="post">
					<c:if test="${!empty goodses}">
					<input name="unpackPalletId" type="hidden" value="${goodses[0].pallet.palletId }" >
						<table border="1">
							<tr align="center">
								<th><input type="checkbox" id="selectall" name="selectall" value="0"/> 序號   </th>
								<th>制品序号</th>
								<th>包装工单</th>
								<th>箱号</th>
								<th>外箱状态</th>
								<th>包裝方式</th>
								<th>入箱日期</th>
							</tr>
							<c:forEach items="${goodses}" var="goods" varStatus="a">
								<tr align="center">
									<td><input type="checkbox" value="${goods.goodsId}" name="goodsIds" class="goodsIds">${a.index+1}</td>
									<td>${goods.goodsId}</td>
									<td>${goods.order.orderId}</td>
									<td>${goods.box.boxNo}</td>
									<td>${goods.box.state}</td>
									<td>${goods.box.packType.name}</td>
									<td><fmt:formatDate value="${goods.inBoxDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
								</tr>
							</c:forEach>
						</table>
						<d:role url="/pack/toUnpack.html">
							<div style="margin: 10px 10px; text-align: center;">
							<input style="color: black;" type="submit" value="拆除大箱"
								onclick="goBack('${goodses[0].pallet.palletId}')">
						</div>
						</d:role>
						
					</c:if>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
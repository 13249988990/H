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
$(function(){
    $(".goodsIds").attr("checked","checked");
	$("#selectall").click(function(){
		
		if($(this).attr("checked")){
			$(".goodsIds").attr("checked","checked");
		}else{
			$(".goodsIds").attr("checked","checked");
		}
	});
	$(".goodsIds").click(function(){
	    $(this).attr("checked","checked");
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
				<form method="post" action="<c:url value="/pack/splitBox.html"/>">
					<table>
						<caption>大箱 --> 彩盒</caption>
						<tr>
							<td>客户条码:</td>
							<td><input name="goodsId" type="text" placeholder="大箱中任何一个客户条码" required="required">
							</td>
							<td><input type="submit" name="Submit"
								value="查詢"></td>
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
									<td><fmt:formatDate value="${goods.box.packDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
								</tr>
							</c:forEach>
						</table>
						<%-- <d:role url="/pack/toUnpack.html"> --%>
							<div style="margin: 10px 10px; text-align: center;">
							<input style="color: black;" type="submit" value="拆除大箱"
								onclick="goBack('${goodses[0].pallet.palletId}')">
						</div>
						<%-- </d:role> --%>
						
					</c:if>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
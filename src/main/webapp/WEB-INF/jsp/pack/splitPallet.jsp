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
	$("#selectall").click(function(){
		
		if($(this).attr("checked")){
			$(".goodsIds").attr("checked","checked");
		}else{
			$(".goodsIds").attr("checked",false);
		}
	});
});

</script>
<body>
<div>
		<div class="main">
			<div class="menu">
				<%@ include file="../share/menu.jsp"%>
			</div>
			<div id="mainbody" style="background-color: #ECE9D8; width: 1000px;">
				<form method="post" action="<c:url value="/pack/splitPallet.html"/>">
					<table>
						<caption>栈板 --> 大箱</caption>
						<tr>
							<td>請輸入栈板号:</td>
							<td><input name="palletId" type="text" required="required" pattern="\w{0,15}">
							</td>
							<td><input type="submit" name="Submit"
								value="查詢"></td>
						</tr>
					</table>
				</form>
				<br>
				<h3 id="message">${message}</h3>
				<br>
				<form action="<c:url value="/pack/unpack.html"/>" method="post">
					<c:if test="${!empty boxes}">
					<input name="unpackPalletId" type="hidden" value="${boxes[0].pallet.palletId }" >
						<table border="1" width="50%">
							<tr align="center">
								<th><input type="checkbox" id="selectall" name="selectall" value="0"/> 序號   </th>
							
								<th>外箱序号</th>
							</tr>
							<c:forEach items="${boxes}" var="box" varStatus="a">
								<tr align="center">
									<td><input type="checkbox" value="${box.boxNo}" name="goodsIds" class="goodsIds">${a.index+1}</td>
									<%-- <td>${box.boxNo}</td> --%>
									<c:forEach items="${box.attachmentParametersList }" var="attachmentParameter">
										<c:if test="${ attachmentParameter.column.columnName=='外箱序号'}">
										<td>${attachmentParameter.columnValue }</td>
										</c:if>
									</c:forEach>
									
									
								</tr>
							</c:forEach>
						</table>
						<%-- <d:role url="/pack/toUnpack.html"> --%>
							<div style="margin: 10px 10px; text-align: center;">
							<input style="color: black;" type="submit" value="刪除大箱"
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
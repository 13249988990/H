<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/LCDMES.dwt.jsp" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="../share/lib.jsp" %>
<title>${modelName} 生產管理系統</title>
</head>
<script type="text/javascript">
$(function(){
    $(".goodsIds").attr("checked","checked");
    $(".goodsIds").click(function(){
		$(this).attr("checked","checked");
    })
	$("#selectall").click(function(){
		
		if($(this).attr("checked")){
			$(".goodsIds").attr("checked","checked");
		}else{
		    $(".goodsIds").attr("checked","checked");
		}
	});
	$("#deletePacking").click(function(){
		$("#form2").attr("action","<%=basePath %>/pack/unpackPalletAndPo.html")
	})
	$("#deleteInPallet").click(function(){
		
			if(confirm("确定删除入板？"))
				 
		    {
				$("#form2").attr("action","<%=basePath %>pack/deleteInPallet.html")
		        location.href="http://www.baidu.com";
		 
		     }else{
		 
		        //否则说明下了，赫赫
		 
		     
		        return false
		 
		    }
	
		
	})
	$("#form1").submit(function(){
		
		
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
				<form method="post" action="<c:url value="/pack/toUnpack.html"/>" name="form1" id="form1">
					<table>
						<caption>棧板&&PO刪除</caption>
						<tr>
							<td>請輸入栈板号:</td>
							<td><input name="palletId" type="text" required="required">
							</td>
							<td><input type="submit" name="Submit"
								value="查詢"></td>
						</tr>
					</table>
				</form>
				<br>
				<h3 id="message">${message}</h3>
				<br><!-- /pack/unpack.html -->
				<form action="<c:url value="/pack/unpackPalletAndPo.html"/>" method="post" id="form2" name="form2">
					<c:if test="${!empty goodses}">
					<input name="unpackPalletId" type="hidden" value="${goodses[0].pallet.palletId }" >
						<table border="1">
							<caption><input type="checkbox" name="machineSign" value="0">:清除Machine数据&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<input type="checkbox" name="at5Sign" value="1">:清除At5(Card&&Chart)&nbsp;&nbsp;&nbsp;</caption>
							<tr align="center">
								<th><input type="checkbox" id="selectall" name="selectall" value="0"/> 序號   </th>
								<th>制品序号</th>
								<th>出貨計畫</th>
								<th>栈板号</th>
								<th>棧板狀態</th>
								<th>包裝方式</th>
								<th>包裝日期</th>
							</tr>
							<c:forEach items="${goodses}" var="goods" varStatus="a">
								<tr align="center">
									<td><input type="checkbox" value="${goods.goodsId}" name="goodsIds" class="goodsIds">${a.index+1}</td>
									<td>${goods.goodsId}</td>
									<td>${goods.order.orderId}</td>
									<td>${goods.pallet.palletId}</td>
									<td>${goods.pallet.state.name}</td>
									<td>${goods.pallet.packType.name}</td>
									<td><fmt:formatDate value="${goods.packDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									
								</tr>
							</c:forEach>
						</table>
						<d:role url="/pack/toUnpack.html">
							<div style="margin: 10px 10px; text-align: center;">
							<input id="deletePacking" style="color: black;" type="submit" value="刪除栈板及PO"
								onclick="goBack('${goodses[0].pallet.palletId}')">
							<!-- <input id="deleteInPallet" style="color: black;" type="submit" value="刪除入板"/> -->
						</div>
						</d:role>
						
						
					</c:if>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
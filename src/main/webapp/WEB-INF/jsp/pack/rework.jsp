<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<title>${modelName} 生產管理系統--包裝重工</title>
<%@ include file="../share/lib.jsp" %>
<script type="text/javascript" src="<c:url value="/js/validate.js"/>"></script>
<script type="text/javascript">
$(function(){
	$("#closeButton").click(function(){
		if (confirm("確定要退出嗎?")) {
			window.location.href='<c:url value="/pack/toRework.html"/>';
		}
	});
	
	$("#reworkForm").submit(function(){
		var reg = new RegExp($("#goodsId").attr("data-reg"));
		if($("#goodsId").val()==null || $("#goodsId").val()==""){
			$("#goodsId").focus();
			return false;
		}
		if(!reg.test($("#goodsId").val())){
			alert("制品條碼編碼有誤! ");
			$("#goodsId").focus().val("");
			return false;
		}
	});
});

</script>
</head>
<body>
<div>
        <div class="main">
                <div class="menu">
                <%@ include file="../share/menu.jsp"%>
                </div>
                <div id="mainbody" style="background-color:#ECE9D8">
				<form id="reworkForm" method="post" action="<c:url value="/pack/rework.html"/>" >
					<input type="hidden" name="palletId" value="${pallet.palletId}">
						<input type="hidden" name="planId" value="${pallet.packPlan.planId}">
					<table border="1" id="formTable">
						<caption>${pallet.packPlan.route.routeName} 重工 <input type="button" value="退出重工" id="closeButton" style="margin-left: 20px;"/></caption>
						<tr>
							<th>LotId</th>
							<th>包装類型</th>
							<th>工單數量</th>
							<th>完成數量</th>
						</tr>
						<tr>
							<td>${pallet.packPlan.lotId}</td>
							<td>${pallet.packPlan.packType.name}</td>
							<td><span id="packPlanAmount">${pallet.packPlan.planAmount}</span>臺</td>
							<td><span id="packPlanFinishAmount">${pallet.packPlan.packAmount}</span>臺</td>
						</tr>
						<tr>
							<td colspan="4" align="center"><b>棧板信息</b></td>
						</tr>
						<tr>
							<th>栈板号</th>
							<th>包裝類型</th>
							<th>包裝數量</th>
							<th>完成數量</th>
						</tr>
						<tr>
							<td>${pallet.palletId}</td>
							<td>${pallet.packPlan.packType.name}</td>
							<td><span id="palletPlanAmount">${pallet.planAmount}</span>
								臺</td>
							<td><span id="palletFinishAmount">${pallet.packAmount}</span>臺</td>
						</tr>
						<tr>
							<td>制品條碼:</td>
							<td colspan="3"><input id="goodsId" name="goodsId" type="text" autofocus="autofocus" data-reg="${pallet.packPlan.route.regex}"></td>
						</tr>
						<tr>
							<td colspan="4"><button type="submit">送出</button></td>
						</tr>
					</table>
				</form>
				
				<h3 id="message">${message}</h3>
				<c:if test="${!empty goodses}">
						<table style="width: 600px;" border="1">
						  <tr align="center">
							<td>Item</td>
							<td>制品序号</td>
							<td>機臺條碼</td>
							<td>附件包</td>
							<td>包裝时间</td>
						  </tr>	
						  <c:forEach items="${goodses}" var="goods" varStatus="a">
						  <tr align="center">
							<td>${a.index+1}</td>
							<td>${goods.goodsId}</td>
							<td>${goods.barcodePrint.component.componentId}</td>
							<td>${goods.attachment.attachmentNo}</td>
							<td><fmt:formatDate value="${goods.packDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						  </tr>
						  </c:forEach>
						</table>
				</c:if>
                </div>
        </div>
</div>
</body>
</html>
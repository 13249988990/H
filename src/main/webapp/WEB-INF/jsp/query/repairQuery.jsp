<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<%@ include file="../share/lib.jsp"%>
<script type="text/javascript" src="<c:url value="/js/My97DatePicker/WdatePicker.js"/>"></script>
<style type="text/css">
#repairTable{
	width: 1000px;
}
#repairTable td,#repairTable th{
	font-size: 14px;
}

</style>
<script>
$(function(){
	$("#state").val('${state}');
	hideOrShowDate();
	
	$("#myForm").submit(function(){
		if($("#componentId").val()==""){
			$("#message").html("請輸入機臺號!");
			return false;
		}
	});
	
	
	$("#state").change(function(){
		hideOrShowDate();
	});
	
	function hideOrShowDate(){
		if($("#state").val()==1){
			$(".date").hide();
		}else if($("#state").val()==2){
			$(".date").show();
		}
	}
});
</script>
<title>${modelName} 生產管理系統--檢修查询</title>

</head>

<body style="background-color: #ECE9D8">
	<div class="main" >
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<div id="mainbody">
			<form id="myForm" method="post" action="<c:url value="/query/repairQuery.html"/>">
				<table border="1">
					<caption>维修查询</caption>
					<tr>
						<td>状态:</td>
						<td>
							<select id="state" name="state">
								<option value="2">已出检修</option>
								<option value="1">未出检修</option>
							</select>
						</td>
					</tr>
					<tr class="date">
						<td>开始日期:</td>
						<td class="myleft"><input type="text" name="beginDate" class="Wdate" id="beginDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'2013-06-01 00:00:00'})" value="${beginDate}"/></td>
					</tr>
					<tr class="date">
						<td>截止日期:</td>
							<td class="myleft">
							<input type="text" name="endDate" class="Wdate" id="endDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'2013-06-01 00:00:00'})" value="${endDate}"/>
							</td>
					</tr>
					<tr>
						<td colspan="2"><button type="submit">送出</button> </td>
					</tr>
				</table>
			</form>
			<h3 style="color:red; text-align: center;" id="message">${message}</h3>
			<c:if test="${!empty repairInfos}">
			<h3 style="color:green; text-align: center;">總計: ${total}</h3>
					<table border="1" id="repairTable">
					<tr>
						<th>序号</th>
						<th>機臺條碼</th>
						<th>入修時間</th>
						<th>出修時間</th>
						<th>不良原因</th>
						<th>測試站</th>
						<th>不良項目</th>
						<th>不良類別</th>
						<th>維修方法</th>
						<th>維修人</th>
						<th>入修備註</th>
						<th>出修備註</th>
					</tr>
					<c:forEach items="${repairInfos}" var="repairInfo" varStatus="s">
						<tr>
						<td>${s.count}</td>
						<td>${repairInfo.component.componentId}</td>
						<td><fmt:formatDate value="${repairInfo.inDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
						<td><fmt:formatDate value="${repairInfo.outDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td>${repairInfo.cause}</td>
						<td>${repairInfo.badItem.parent.name}</td>
						<td>${repairInfo.badItem.name}</td>
						<td>${repairInfo.badType}</td>
						<td>${repairInfo.repairMethod }</td>
						<td>${repairInfo.repairer}</td>
						<td>${repairInfo.inRemark}</td>
						<td>${repairInfo.outRemark}</td>
					</tr>
					</c:forEach>
				</table>
				</c:if>
		</div>
	</div>
</body>
</html>
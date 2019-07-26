<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>${modelName} 生產管理系統-machine 測試結果查詢</title>
<%@ include file="../share/lib.jsp" %>
<script type="text/javascript" src="<c:url value="/js/My97DatePicker/WdatePicker.js"/>"></script>
<style type="text/css">
td,th{
	padding: 2px 5px;
}
.date{
	display:none;
}
</style>

<script type="text/javascript">
	$(function(){
		$("#modelId").val(${modelId});
		$("#testType").val(${testType});
		
		$("#queryType").val(${queryType});
		
		redraw(${queryType});
		
		$("#queryType").change(function(){
			redraw($(this).val());
		});
		
		function redraw(type){
			if(type==1){
				$("#machine").show();
				$(".date").hide();
			}else{
				$("#machine").hide();
				$(".date").show();
			}
		}
		
		$("#machineTest").submit(function(){
				if($("#modelId").val()==0){
					alert("請選擇機型!")
					$("#modelId").select();
					return false;
				}
				if($("#testType").val()=="0"){
					alert("請選擇測試類型!")
					$("#testType").select();
					return false;
				}

				if($("#queryType").val()==1){
					if($("#machineId").val()==""){
						$("#machineId").focus();
						return false;
					}
				}else{
					if($("#beginDate").val()==""){
						$("#beginDate").focus();
						return false;
					}
					if($("#endDate").val()==""){
						$("#endDate").focus();
						return false;
					}
				}
				
		});
		
	});
</script>
</head>
<body >
<div class="main">
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<div id="mainbody" style="margin: 10px;">
		<form id="machineTest" action="<c:url value="/query/machineTestQuery.html"/>" method="post">
				<input type="hidden" name="query" value="true">
				<table border="1">
					<caption>Machine Test 查詢</caption>
					<tr>
						<th>查詢類型:</th>
						<td>
							<select name="queryType" id="queryType">
								<option value="1">單機查詢</option>
								<option value="2">日期查詢</option>
						</select>
						</td>
					</tr>
					<tr>
						<th>機型</th>
						<td><select name="modelId" id="modelId">
							<option value="0">請選擇</option>
							<option value="1">1200</option>
							<option value="2">1250</option>
							<option value="3">1700</option>
							
						</select></td>
					</tr>
					<tr>
						<th>測試類型:</th>
						<td> <select name="testType" id="testType">
								<option value="0">請選擇</option>
								<option value="1">Find_Edge</option>
								<option value="2">UpdateNVRAM</option>
						</select>
						</td>
					</tr>
					<tr id="machine">
						<th>機臺條碼:</th>
						<td><input type="text" name="machineId" id="machineId" autofocus="autofocus" value="${machineId}">
						</td>
					</tr>
					<tr class="date">
						<th>开始日期:</th>
						<td><input type="text" name="beginDate"
							class="Wdate" id="beginDate"
							onfocus="WdatePicker({dateFmt:'yyyy-MM-dd 00:00:00',minDate:'2013-06-01 00:00:00'})"
							value="${beginDate}" /></td>
					</tr>
					<tr class="date">
						<th>截止日期:</th>
						<td><input type="text" name="endDate"
							class="Wdate" id="endDate"
							onfocus="WdatePicker({dateFmt:'yyyy-MM-dd 23:59:59',minDate:'2013-06-01 00:00:00'})"							
							value="${endDate}" /></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="送出"></td>
					</tr>
				</table>
				<h3 id="message">${message}</h3>
				
				<c:if test="${!empty resultSet}">
					<table border="1" style="font-size: 12px;">
					<tr>
						<th>序號</th>
						<c:forEach items="${resultSet[0]}" var="entry" varStatus="a">
						<c:if test="${testType==1}">
							<c:if test="${a.index==1||a.index==3 || a.index==5 || a.index>8}">	
								<th>${entry.key}</th>
							</c:if>
						</c:if>
						<c:if test="${testType==2}">
							<c:if test="${a.index==1||a.index==3 || a.index==5 || a.index==6 || a.index>9}">	
								<th>${entry.key}</th>
							</c:if>
						</c:if>
						</c:forEach>
					</tr>
						<c:forEach items="${resultSet}" var="map" varStatus="s">
							<tr>
								<td>${s.count}</td>

								<c:forEach items="${map}" var="entry" varStatus="m">
									<c:if test="${testType==1}">
										<c:if test="${m.index==1||m.index==3 || m.index==5 || m.index>8}">
											<th>${entry.value}</th>
										</c:if>
									</c:if>
									<c:if test="${testType==2}">
										<c:if
											test="${m.index==1||m.index==3 || m.index==5 ||m.index==6 || m.index>9}">
											<th>${entry.value}</th>
										</c:if>
									</c:if>
								</c:forEach>
							</tr>
						</c:forEach>
					</table>
				</c:if>
				
		</form>
		</div>
	</div>
</body>
</html>
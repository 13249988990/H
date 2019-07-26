<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/LCDMES.dwt.jsp" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="../share/lib.jsp" %>
<style type="text/css">
#queryTable td{
	padding: 2px 10px;
}
</style>
<script>
$(function(){
	$(".delButton").click(function(){
		var poId = $(this).attr("id");
		if(confirm("確定要刪除poId為"+poId+"ASP計畫嗎?")){
			window.location.href = '<c:url value="/plan/aspDelete.html?poId="/>'+$(this).attr("id");
		}
	});
	
	$(".upButton").click(function(){
		window.location.href = '<c:url value="/plan/toAspUpdate.html?poId="/>'+$(this).attr("id");
	});
	$("#closeButton").click(function(){
			window.location.href='<c:url value="/plan/asplist.html?aspId=allASP"/>';
		
	});
});

</script>
<title>${modelName} 生產管理系統--出貨計畫管理</title>
<script type="text/javascript" src="<c:url value="/js/My97DatePicker/WdatePicker.js" />"></script>
</head>

<body>
<div>
        <div class="main">
                <div class="menu">
                <%@ include file="../share/menu.jsp"%>
                </div>
                <div id="mainbody">
         		<!-- InstanceBeginEditable name="EditRegion3" -->

				<table border="1">
				<caption>ASP PO資料 <input type="button" value="顯示所有ASP計劃" id="closeButton" style="margin-left: 20px;"/></caption>
				<tr>
					<th>序號</th>
					<th>PO號</th>
					<th>出貨國別</th>
					<th>CaseMark3</th>
					<th>CaseMark4</th>
					<th>CaseMark6</th>
					<th>CaseMark7</th>
					<th>CaseMark8</th>	
					<th>投入數量</th>						
					<d:role url="/plan/toAspUpdate.html">
						<th>更新</th>
					</d:role>
					<d:role url="/plan/aspDelete.html">
						<th>刪除</th>
					</d:role>
				</tr>
				<c:forEach items="${poplans}" var="poplan" varStatus="a">
					<tr class="poplan" data-lot="${poplan.casemark2}" >
						<td>${a.count}</td>
						<td class="${poplan.casemark2}" id="${poplan.casemark2}">${poplan.casemark2}</td>						
						<td>${poplan.casemark1}</td>
						<td>${poplan.casemark3}</td>
						<td>${poplan.casemark4}</td>
						<td>${poplan.casemark6}</td>	
						<td>${poplan.casemark7}</td>
						<td>${poplan.casemark8}</td>	
						<td>${poplan.putInAmount}</td>										
						<d:role url="/plan/toAspUpdate.html">
							<td><input type="button" value="更新" class="upButton" id="${poplan.casemark2}"> </td>
						</d:role>
						<d:role url="/plan/aspDelete.html">
							<td><input type="button" value="刪除" class="delButton" id="${poplan.casemark2}" > </td>
						</d:role>						
					</tr>
				</c:forEach>
				</table>
				<br/>
				<h3 style="text-align: center; color: red;">${message}</h3>
				 </div>
                </div>
        </div>
        <br/><br/>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<%@ include file="../share/lib.jsp" %>
<title>${modelName} 生產管理系統</title>
<style type="text/css">
.select{
background-color: #D1EEEE;
}
</style>
</head>

<script type="text/javascript">
$(function(){
    $("table tr").click(function(){
		$(this).addClass("select").siblings().removeClass("select");
    })
})
</script>
<body>
        <div class="main">
                <div class="menu">
                <%@ include file="../share/menu.jsp"%>
                </div>
                <div id="mainbody">
					<table border="1" style="width: 100%;">
						<caption style="padding: 5px;">所有流程一覽表 <span style="margin-left: 20px;">
						<d:role url="/route/toAdd.html">
						<a href="<c:url value="/route/toAdd.html"/>"> 新增流程</a>
						</d:role>
						</span>
						
						</caption>
						<tr class="tr1">
							<th>序號</th>
							<th>流程名稱</th>
							<th>制品編碼原則</th>
							<th>工單編碼原則</th>
							<th>Lot編碼原則</th>
							<th>類別</th>
							<th>國別</th>
							<th>菜單索引</th>
							<th>站點總數</th>
							<d:role url="/route/toUpdate.html">
								<th>更新 </th>
							</d:role>
							<d:role url="/route/delete.html">
								<th>删除 </th>
							</d:role>
							
							<th>站别管理</th>
						</tr>
						<c:forEach items="${routeList}" var="route" varStatus="s">
							<c:if test='${route.routeType=="PRODUCTION"}'>
							<tr class="tr1">
								<td >${s.count}</td>
								<td >${route.routeName}</td>
								<td >${route.regex}</td>
								<td >${route.orderRegex}</td>
								<td >無</td>
								<td >${route.routeType.name}</td>
								<td >${route.location.locationType}</td>
								<td >${route.menuIndex}</td>
								<td >${route.siteAmount}</td>
								<d:role url="/route/toUpdate.html">
									<td ><a href="<c:url value="/route/toUpdate.html?routeId=${route.routeId}"/>" >更新</a> </td>
								</d:role>
								<d:role url="/route/delete.html">
									<td ><a href="#" onclick="deleteBox('<c:url value="/route/delete.html?routeId=${route.routeId}')"/>">删除</a> </td>
								</d:role>
								<td ><a href="<c:url value="/site/list.html?routeId=${route.routeId}"/>" >站别管理</a> </td>
							</tr>
							</c:if>
						</c:forEach>
						<tr>
							<td style="font-weight: bold;" colspan="11">CIS 流 程</td>
						</tr>
						<c:forEach items="${routeList}" var="route" varStatus="s">
							<c:if test='${route.routeType=="CIS"}'>
							<tr class="tr1">
								<td >${s.count}</td>
								<td >${route.routeName}</td>
								<td >${route.regex}</td>
								<td >${route.orderRegex}</td>
								<td >無</td>
								<td >${route.routeType.name}</td>
								<td >${route.location.locationType}</td>
								<td >${route.menuIndex}</td>
								<td >${route.siteAmount}</td>
								<d:role url="/route/toUpdate.html">
									<td ><a href="<c:url value="/route/toUpdate.html?routeId=${route.routeId}"/>" >更新</a> </td>
								</d:role>
								<d:role url="/route/delete.html">
									<td ><a href="#" onclick="deleteBox('<c:url value="/route/delete.html?routeId=${route.routeId}')"/>">删除</a> </td>
								</d:role>
								<td ><a href="<c:url value="/site/list.html?routeId=${route.routeId}"/>" >站别管理</a> </td>
							</tr>
							</c:if>
						</c:forEach>
						<tr>
							<td style="font-weight: bold;" colspan="11">附 件 流 程</td>
						</tr>
						<c:forEach items="${routeList}" var="route" varStatus="s">
							<c:if test='${route.routeType=="ATTACHMEN"}'>
							<tr class="tr1">
								<td >${s.count}</td>
								<td >${route.routeName}</td>
								<td >${route.regex}</td>
								<td >${route.orderRegex}</td>
								<td >無</td>
								<td >${route.routeType.name}</td>
								<td >${route.location.locationType}</td>
								<td >${route.menuIndex}</td>
								<td >${route.siteAmount}</td>
								<d:role url="/route/toUpdate.html">
									<td ><a href="<c:url value="/route/toUpdate.html?routeId=${route.routeId}"/>" >更新</a> </td>
								</d:role>
								<d:role url="/route/delete.html">
									<td ><a href="#" onclick="deleteBox('<c:url value="/route/delete.html?routeId=${route.routeId}')"/>">删除</a> </td>
								</d:role>
								<td ><a href="<c:url value="/site/list.html?routeId=${route.routeId}"/>" >站别管理</a> </td>
							</tr>
							</c:if>
						</c:forEach>
						<tr>
							<td style="font-weight: bold;" colspan="11">包 裝 流 程</td>
						</tr>
							<c:forEach items="${routeList}" var="route" varStatus="s">
							<c:if test='${route.routeType=="PACK"}'>
							<tr class="tr1">
								<td >${s.count}</td>
								<td >${route.routeName}</td>
								<td >${route.regex}</td>
								<td >${route.orderRegex}</td>
								<td >${route.lotRegex}</td>
								<td >${route.routeType.name}</td>
								<td >${route.location.locationType}</td>
								<td >${route.menuIndex}</td>
								<td >${route.siteAmount}</td>
								<d:role url="/route/toUpdate.html">
									<td ><a href="<c:url value="/route/toUpdate.html?routeId=${route.routeId}"/>" >更新</a> </td>
								</d:role>
								<d:role url="/route/delete.html">
									<td ><a href="#" onclick="deleteBox('<c:url value="/route/delete.html?routeId=${route.routeId}')"/>">删除</a> </td>
								</d:role>
								<td ><a href="<c:url value="/site/list.html?routeId=${route.routeId}"/>" >站别管理</a> </td>
							</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
		
        </div>
</body>
</html>
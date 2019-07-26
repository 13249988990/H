<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<%@ include file="../share/lib.jsp" %>
<title>${modelName} 生產管理系統--生產站別列表</title>
</head>
<body>
        <div class="main">
                <div class="menu">
                <%@ include file="../share/menu.jsp"%>
                </div>
         		<div id="mainbody">
					<table  border="1" style="width: 100%;">
						<caption style="padding: 5px;">
						<span><a href="<c:url value="/route/list.html"/>">返回上一层</a> </span>
						<span>生产流程${route.routeName }站别一覽表</span> 
						<span style="margin-left: 20px;">
						<d:role url="/site/toAdd.html">
							<a href="<c:url value="/site/toAdd.html?routeId=${route.routeId}"/>"> 新增站别</a>
						</d:role>
						</span></caption>
						<tr>
							<th>序号</th>
							<th>站别名稱</th>
							<th>站别索引</th>
							<th>站别插件类名</th>
							<d:role url="/site/toUpdate.html"><th>更新 </th></d:role>
							<d:role url="/site/delete.html"><th>删除 </th></d:role>
							<th>输入列管理</th>
						</tr>
						<c:forEach items="${sites}" var="site" varStatus="s">
							<tr>
								<td>${s.index+1}</td>
								<td>${site.siteName}</td>
								<td>${site.siteIndex}</td>
								<td>${site.className}</td>
								<d:role url="/site/toUpdate.html">
									<td><a href="<c:url value="/site/toUpdate.html?siteId=${site.siteId}&&routeId=${route.routeId}"/>">更新</a> </td>
								</d:role>
							<d:role url="/site/delete.html">
								<td><a href="#" onclick="deleteBox('<c:url value="/site/delete.html?siteId=${site.siteId}&&routeId=${route.routeId}"/>')">删除</a> </td>
							</d:role>
							<td><a href="<c:url value="/siteColumn/list.html?siteId=${site.siteId}&&routeId=${route.routeId}"/>">输入列管理</a> </td>
							</tr>
						</c:forEach>
					</table>
				</div>

                </div>
</body>
</html>
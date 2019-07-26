<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="../share/lib.jsp" %>
<title>${modelName} 生產管理系統--輸入列列表</title>
</head>
<body>
	<div class="main">
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<div id="mainbody">
			<table border="1" style="width: 100%;">

				<caption style="padding: 5px;">
					<span><a
						href="<c:url value="/site/list.html?routeId=${routeId}"/>">返回上一层</a>
					</span> <span>所屬站别: ${site.siteName}</span> <span
						style="margin-left: 20px;">
						<d:role url="/siteColumn/toAdd.html">
							<a href="<c:url value="/siteColumn/toAdd.html?siteId=${site.siteId}&&routeId=${routeId}"/>">新增站别输入列</a>
						</d:role>
					</span>
				</caption>
				<tr>
					<th>序号</th>
					<th>名稱</th>
					<th>索引</th>
					<th>正则表达式</th>
					<th>比对表达式</th>
					<d:role url="/siteColumn/toUpdate.html">
						<th>更新</th>
					</d:role>
					<d:role url="/siteColumn/delete.html">
						<th>删除</th>
					</d:role>
					
				</tr>
				<c:forEach items="${siteColumns}" var="siteColumn" varStatus="s">
					<tr>
						<td>${s.index+1}</td>
						<td>${siteColumn.columnName}</td>
						<td>${siteColumn.columnIndex}</td>
						<td>${siteColumn.regex}</td>
						<td>${siteColumn.condition}</td>
						<d:role url="/siteColumn/toUpdate.html">
							<td><a
							href="<c:url value="/siteColumn/toUpdate.html?routeId=${routeId}&&siteId=${site.siteId}&&columnId=${siteColumn.columnId}"/>">更新</a>
						</td>
						</d:role>
						<d:role url="/siteColumn/delete.html">
							<td><a href="#"
							onclick="deleteBox('<c:url value="/siteColumn/delete.html?routeId=${routeId}&&siteId=${site.siteId}&&columnId=${siteColumn.columnId}"/>')">删除</a>
							</td>
						</d:role>
						
					</tr>
				</c:forEach>
			</table>
		</div>

	</div>
</body>
</html>
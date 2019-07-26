<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../share/lib.jsp" %>
<title>${modelName} 生產管理系統</title>
</head>
<body >
<div class="main">
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<div id="mainbody" >
			<table border="1" id="boardTable" style="width: 400px;">
				<caption>看板管理 		<a style="padding-left: 20px;" href="<c:url value="/board/monitor.html"/>">產能看板</a></caption>
					<thead>
						<tr>
							<td rowspan="2">名稱</td>
							<td rowspan="2">人力</td>
							<td rowspan="2">每小時目標</td>
							<td rowspan="2">總目標</td>
							<td rowspan="2">操作</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${boards}" var="board" varStatus="a">
							<tr class="board">
								<td>${board.boardName}</td>
								<td>${board.peopleNumber}</td>
								<td>${board.target}</td>
								<td>${board.totalTarget}</td>
								<td><a href='<c:url value="/board/toUpdate.html?id="/>${board.id}'>更新</a> </td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<h3 id="message">${message}</h3>
		</div>
	</div>
</body>
</html>
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
			<form action="<c:url value="/board/update.html"/>" method="post">
				<input type="hidden" name="id" value="${board.id}">
				<table border="1" id="boardTable">
					<caption>更新產能看板</caption>
					<tr>
						<td>名稱</td>
						<td>${board.boardName}</td>
					</tr>
				<tr>
					<td style="width: 50px;">人力</td>
					<td><input type="text" name="peopleNumber"
						value="${board.peopleNumber}"></td>
				</tr>
				<tr>
				<td>每小時目標</td>
					<td><input type="text" name="target" value="${board.target}">
					</td>
				</tr>
				<tr>
				<td>總目標</td>
					<td><input type="text" name="totalTarget" value="${board.totalTarget}">
					</td>
				</tr>
				<tr><td colspan="2"><input type="submit" value="更新" > </td></tr>
			</table>
			</form>
			
				<h3 id="message">${message}</h3>
		</div>
	</div>
</body>
</html>
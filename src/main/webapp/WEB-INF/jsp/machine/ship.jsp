<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<%@ include file="../share/lib.jsp" %>
<title>${modelName} 生產管理系統--裸機出庫</title>
</head>
<body>
<div>
        <div class="main">
                <div class="menu">
                <%@ include file="../share/menu.jsp"%>
                </div>
                <div id="mainbody" style="background-color:#ECE9D8">
				<form name="form1" method="post" action="<c:url value="/machine/ship.html"/>" >
					<table border="1" id="formTable">
						<caption>裸機出库</caption>
						<tr>
							<td>栈板号:</td>
							<td class="myleft"><input name="palletId" type="text" required="required"></td>
						</tr>
						<tr>
							<td>机台号:</td>
							<td class="myleft"><input name="machineId" type="text"  required="required"></td>
						</tr>
						<tr>
							<td colspan="2"><button type="submit">送出</button></td>
						</tr>
					</table>
				</form>
				
				<h3 id="message">${message}</h3>
				<c:if test="${!empty machineses}">
					<table border="1">
					  <tr align="center">
						<th>序號</th>
						<th>机台序号</th>
						<th>栈板号</th>
						<th>包裝日期</th>
						<th>入庫日期</th>
						<th>出庫日期</th>
					  </tr>	
					  <c:forEach items="${machineses}" var="machines" varStatus="a">
					  <tr align="center">
						<td>${a.index+1}</td>
						<td>${machines.machineId}</td>
						<td>${machines.pallet.palletId}</td>
						<td><fmt:formatDate value="${machines.packDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td><fmt:formatDate value="${machines.pallet.acceptDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td><fmt:formatDate value="${machines.pallet.shipDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					  </tr>
					  </c:forEach>
					</table>
				</c:if>
                </div>
        </div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<%@ include file="../share/lib.jsp" %>
<title>${modelName} 生產管理系統--測試站</title>
</head>

<body style="background-color:#ECE9D8; margin: 0 auto;">
        <div class="main">
                <div class="menu">
                <%@ include file="../share/menu.jsp"%>
                </div>
         		<div id="mainbody">
         		<c:if test="${parent !=null}">
         			<b>測試站:${parent.name}</b>
         		</c:if>
         		<br/><br/>
					<table border="1">
						<caption style="padding: 5px;">
						<a href='<c:url value="/badItem/list.html" />'>返回上一級</a> ${beanName}列表  <a href='<c:url value="/badItem/toAdd.html?parentId=${parent.badItemId}"/>'> 新增${beanName}</a>
						</caption>
						<tr>
							<th class="th1">序號</th>
							<th class="th1">${beanName}名</th>
							<th class="th1">備註</th>
							<th>更新</th>
							<th>刪除 </th>
							<c:if test="${parent==null}">
								<th>壞項管理</th>
							</c:if>
						</tr>
						<c:forEach items="${badItems}" var="badItem" varStatus="s">
							<tr class="tr1">
								<td class="th1">${s.count}</td>
								<td class="td2">${badItem.name}</td>
								<td class="td2">${badItem.remark}</td>
							<td class="th1"><a href="<c:url value="/badItem/toUpdate.html?badItemId=${badItem.badItemId}"/>">更新</a> </td>
							<td class="th1"><a href="#" onclick="deleteBox('<c:url value="/badItem/delete.html?badItemId=${badItem.badItemId}&parentId=${parent.badItemId}')"/>">删除</a> </td>
							<c:if test="${parent==null}">
								<td class="th1"><a href="<c:url value="/badItem/childList.html?parentId=${badItem.badItemId}"/>">壞項管理</a> </td>
							</c:if>
							
							</tr>
						</c:forEach>
					</table>
				</div>
        </div>
</body>
</html>
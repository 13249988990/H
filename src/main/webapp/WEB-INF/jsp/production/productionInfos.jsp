<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${!empty productionInfos}">
<table border="1">
	<tr align="center">
		<td>Item</td>
		<td>產品序號</td>
		<c:forEach items="${siteColumns}" var="column">
			<td>${column.columnName}</td>
		</c:forEach>
		<td>時間</td>
	</tr>
	<c:forEach items="${productionInfos}" var="productionInfo" varStatus="a">
	<tr align="center">
		<td>${a.index+1}</td>
		<td>${productionInfo.component.componentId}</td>
		<c:forEach items="${siteColumns}" var="column">
			<c:forEach items="${productionInfo.columnDatas}" var="columnData">
				<c:if test="${columnData.siteColumn.columnId == column.columnId}">
					<td>
							${columnData.columnValue}
					</td>
			</c:if>
		</c:forEach>
		</c:forEach>
		
		<td><fmt:formatDate value="${productionInfo.productionDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
	</tr>
	</c:forEach>
</table>
</c:if>
<br/>
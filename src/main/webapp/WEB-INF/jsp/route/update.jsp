<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="../share/lib.jsp" %>
<title>${modelName} 生產管理系統</title>
<script type="text/javascript">
	$(function(){
		if($("#routeType").val()==="PACK"){
			$("#lot_tr").show();
		}		
	});	
</script>
</head>
<body>
        <div class="main">
                <div class="menu">
                <%@ include file="../share/menu.jsp"%>
                </div>
                	<div id="mainbody">
						<form name="routeForm" method="post" action="<c:url value="/route/update.html"/>">
							<input type="hidden" value="${route.routeId}" name="routeId">
							<table border="1" id="formTable">
								<tr>
									<th colspan="2">更新生产流程</th>
								</tr>
								<caption>更新生产流程  <a href="<c:url value="/route/list.html?routeId=${routeId}"/>">返回流程列表</a></caption>
								<tr>
									<td>類別:</td>
									<td class="myleft">
										<select name="routeType" id="routeType" disabled="disabled">
											<option value="">請選擇</option>
											<c:forEach items="${routeTypes}" var="routeType">
												<c:if test="${routeType==route.routeType}"><option value="${routeType}" selected="selected">${routeType.name}</option></c:if>
												<c:if test="${routeType!=route.routeType}"><option value="${routeType}">${routeType.name}</option></c:if>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr id="location">
									<td>國別:</td>
									<td class="myleft">
										<select name="locationId" id="locationId" disabled="disabled">
											<option value="">請選擇</option>
											<c:forEach items="${locations}" var="location" >
												<c:if test="${route.location.locationId==location.locationId}"><option value="${location.locationId}" selected="selected">${location.locationName}-${location.locationType}-${location.serialType}</option></c:if>
												<c:if test="${route.location.locationId!=location.locationId}"><option value="${location.locationId}">${location.locationName}-${location.locationType}-${location.serialType}</option></c:if>												
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td>流程名:</td>
									<td class="myleft"><input type="text" name="routeName" value="${route.routeName}" required="required"/></td>
								</tr>
								<tr>
									<td>制品編碼原則:</td>
									<td class="myleft"><input type="text" name="regex" value="${route.regex}" required="required"/></td>
								</tr>
								<tr>
									<td>工單編碼原則:</td>
									<td class="myleft"><input type="text" name="orderRegex" value="${route.orderRegex}" required="required"/></td>
								</tr>
								<tr style="display: none;" id="lot_tr">
									<td>Lot編碼原則:</td>
									<td class="myleft"><input type="text" name="lotRegex" value="${route.lotRegex}"/></td>
								</tr>
								<tr>
									<td>站點總數:</td>
									<td class="myleft"><input type="text" name="siteAmount" value="${route.siteAmount}" pattern="[0-9]+" required="required"/></td>
								</tr>
								<tr>
									<td>菜單索引:</td>
									<td class="myleft"><input type="text" name="menuIndex" value="${route.menuIndex}" pattern="[0-9]+" required="required"/></td>
								</tr>
								
								<tr>
									<td colspan="2"><input type="submit"  value="送出"/></td>
								</tr>
							</table>
						</form>
						<h3 style="text-align: center;color: red;">${message}</h3>
					</div>
        </div>
</body>
</html>
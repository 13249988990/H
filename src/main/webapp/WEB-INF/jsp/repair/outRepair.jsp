<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<%@ include file="../share/lib.jsp"%>
<title>${modelName} 生產管理系統</title>
</head>

<body style="background-color: #ECE9D8">
	<div class="main" >
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<div id="mainbody">
			<div>
				<form method="post" action="<c:url value="/repair/outRepair.html"/>">
					<input type="hidden" value="${repair.repairInfoId}" name="repairInfoId">
					<table border="1" id="formTable">
						<caption>出檢修系統</caption>
						<tr>
							<td>條碼</td>
							<td>${repair.component.componentId}</td>
						</tr>
						<tr>
							<td>機種</td>
							<td>${repair.component.route.routeName}</td>
						</tr>
						<tr>
							<td>線別</td>
							<td>${repair.component.order.line}</td>
						</tr>
						<tr>
							<td>不良站</td>
							<td>${repair.badItem.parent.name}</td>
						</tr>
						<tr>
							<td>不良現象</td>
							<td>${repair.badItem.name}</td>
						</tr>
						<tr>
							<td>入修備註</td>
							<td>${repair.inRemark}</td>
						</tr>
						<tr>
							<td>不良原因</td>
							<td>
								<input name="cause" type="text">
							</td>
						</tr>
						<tr>
							<td>維修方法</td>
							<td>
								<textarea rows="3" cols="15" name="repairMethod"></textarea>
							</td>
						</tr>
						<tr>
							<td>不良歸屬</td>
							<td>
								<select name="badType" id="badType">
									<option value="">請選擇</option>
									<c:forEach items="${badTypes}" var="badType">
											<option value="${badType}">${badType}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td>維修人</td>
							<td><input name="repairer" type="text" required="required"></td>
						</tr>
						<tr>
							<td>備註</td>
							<td><input name="outRemark" type="text"></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="送出"> </td>
						</tr>
					</table>
				</form>
			</div>
			<h1 style="color:#FF0000; ">${message}</h1>
		</div>
	</div>

</body>
</html>
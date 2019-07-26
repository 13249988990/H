<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/LCDMES.dwt.jsp" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="../share/lib.jsp" %>
<style type="text/css">
#queryTable td{
	padding: 2px 10px;
}
</style>
<script>
</script>
<title>${modelName} 序列號查詢</title>
<script type="text/javascript" src="<c:url value="/js/My97DatePicker/WdatePicker.js" />"></script>
</head>

<body>
<div>
        <div class="main">
                <div class="menu">
                <%@ include file="../share/menu.jsp"%>
                </div>
                <div id="mainbody">
         		<!-- InstanceBeginEditable name="EditRegion3" -->
				<form name="form1" method="post" action="<c:url value="/query/serialNumQuery.html"/>">
				<input type="hidden" name="query" value="true">
					<table border="1" id="queryTable">
						<caption>序列號查詢</caption>
						<tr>
							<td>序列號:</td>
							<td><input type="text" name="serialNumber" value="${serialNumber}" style="width: 98%;"></td>
							<td rowspan="4" style="text-align:center;"><input type="submit" value="查詢" style="width: 50px;height: 50px;"></td>
						</tr>
						<tr>
							<td>狀態:</td>
							<td>
								<select name="state">
									<option value="">請選擇</option> 
									<option value="0">未打印</option> 
									<option value="1">未綁定</option>
									<option value="2">已完成</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>開始日期:</td>
							<td>
								<input name="beginDate" type="text" onClick="WdatePicker()" value="${beginDate}"/>
							</td>
							</tr>
						<tr>
							<td>結束日期:</td>
							<td>
							<input name="endDate" type="text" onClick="WdatePicker()" value="${endDate}" />
							</td>
						</tr>
						
					</table>
				</form>
				<h3 style="text-align: center; color: red;">${message}</h3>
				<table border="1">
				<tr>
					<th>序列號</th>
					<th>打印時間</th>
					<th>機種</th>
					<th>機台號</th>
				</tr>
				
				</table>
				 </div>
                </div>
        </div>
        <br/><br/>
</body>
</html>
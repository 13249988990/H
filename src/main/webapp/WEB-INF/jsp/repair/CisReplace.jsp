<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<%@ include file="../share/lib.jsp"%>
<script type="text/javascript" src="<c:url value="/js/validate.js"/>"></script>
<script>
$(function(){
	$("#mbForm").submit(function(event){
	    //alert(111)
		//var reg = new RegExp($("#componentId").attr("data-reg"));
		/* if(!reg.test($("#componentId").val())){
			alert("機台的編碼格式有誤!");
			return false;
		}
		reg = new RegExp($("#oldMBNo").attr("data-reg"));
		if(!reg.test($("#oldMBNo").val())){
			alert("舊主板的編碼格式有誤!");
			return false;
		}else if(!reg.test($("#newMBNo").val())){
			alert("新主板的編碼格式有誤!");
			return false;
		} */
		if($("#componentId").val()==''){
		    $("#componentId").focus();
		    return false;
		}else if($("#oldCis").val()==''){
		    $("#oldCis").focus();
		    return false;
		}else if($("#newCis").val()==''){
		    $("#newCis").focus();
		    return false;
		}
		return true;
		
	});
});
</script>
<title>${modelName} 生產管理系統--主板替換</title>
</head>

<body>
	<div class="main" >
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<div id="mainbody">
				<form id="mbForm" method="post" action="<c:url value="/repair/ReplaceCis.html"/>">
					<table border="1">
						<caption>CIS替换</caption>
						<tr>
							<td>机台号码:</td>
							<td><input type="text"
								name="componentId" id="componentId"  data-reg="^\w*$" required="required"></td>
						</tr>
						<tr>
							<td>旧CIS条码:</td>
							<td><input type="text"
								name="oldCis" id="oldCis" value="${oldMBNo}" data-reg="^\w*$" required="required"></td>
						</tr>
						<tr>
							<td>新CIS条码:</td>
							<td><input type="text"
								name="newCis" id="newCis"  value="${newMBNo}" data-reg="^\w*$" required="required"></td>
						</tr>
						<tr>
							<td colspan="2"><button type="submit">送出</button> </td>
						</tr>
						</table>
				</form>
				<h3 style="color:#FF0000;text-align: center; ">${message}</h3>
			
			<c:if test="${columnData!=null}">
				<table border="1" style="text-align: center; margin: 10px auto;">
					<caption>替換後機臺的資料</caption>				
					<tr>
						<th>機臺條碼</th>
						<th>主板條碼</th>
						<th>站名</th>
						<th>列名</th>
					</tr>
					<tr>
					<td>${columnData.productionInfo.component.componentId}</td>
					<td>${columnData.columnValue}</td>
					<td>${columnData.productionInfo.site.siteName }</td>
					<td>${columnData.siteColumn.columnName}</td>
					</tr>
				</table>
			</c:if>
			
		</div>
	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/LCDMES.dwt.jsp" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ include file="../share/lib.jsp" %>
<title>${modelName} 倉庫出貨</title>
<script type="text/javascript">
	$(function(){
		$("#invoiceNo").focus();
		$("#form1").submit(function(){
			var $invoiceNo = $("#invoiceNo");
			var $containerNo = $("#containerNo");
			var $poNo = $("#poNo");
			//var $shipBarcode = $("#shipBarcodeId");
			
			if($invoiceNo.val()==""){
				$invoiceNo.focus();
				return false;
			}
			
			if($containerNo.val()==""){
				$containerNo.focus();
				return false;
			}
			
			if($poNo.val()==""){
				$poNo.focus();
				return false;
			}
			
			/* if($shipBarcode.val()==""){
				alert("請選擇Barcode!");
				$shipBarcode.focus();
				return false;
			} */
		});
	});
</script>
</head>
<body>
<div>
	<div class="main">
			<div class="menu">
				<%@ include file="../share/menu.jsp"%>
			</div>
			<div id="mainbody" style="background-color: #ECE9D8">
				<form id="form1" method="post"
					action="<c:url value="/ship/addShipInfo.html"/>">
					<input type="hidden" value="1" id="shipBarcodeId" name="shipBarcodeId">
					<table border="1" style="width: 400px;">
						<caption>倉庫出貨</caption>
						<tr>
							<td>Invoice:</td>
							<td class="myleft"><input type="text" name="invoiceNo" id="invoiceNo">
							</td>
						</tr>
						<tr>
							<td>貨櫃號:</td>
							<td class="myleft"><input type="text" name="containerNo"
								id="containerNo"></td>
						</tr>
						<tr>
							<td>PO號:</td>
							<td class="myleft"><input type="text" name="poNo" id="poNo">
							</td>
						</tr>
							<%-- <tr>
							<td>Barcode:</td>
							<td class="myleft">
								<select id="shipBarcodeId" name="shipBarcodeId">
									<option value="">請選擇</option>
									<c:forEach items="${shipBarcodes}" var="shipBarcode">
										<option value="${shipBarcode.id}">${shipBarcode.location}_${shipBarcode.barcode}</option>
									</c:forEach>
								</select>
							</td>
						</tr> --%>
						<tr>
							<td colspan="2"><input type="submit" value="送出"></td>
						</tr>
					</table>
				</form>
				<br>
				<h3 id="message">${message}</h3>
			</div>
		</div>
	</div>
</body>
</html>
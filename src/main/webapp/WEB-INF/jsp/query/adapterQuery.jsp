<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<%@ include file="../share/lib.jsp"%>
<script type="text/javascript" src="<c:url value="/js/My97DatePicker/WdatePicker.js"/>"></script>
<!-- dataTable -->
<link href='<c:url value="/js/DataTables-1.10.8/media/css/jquery.dataTables.min.css"/>' rel="stylesheet" type="text/css"  />
<script type="text/javascript" src='<c:url value="/js/DataTables-1.10.8/media/js/jquery.dataTables.min.js"/>'></script>
<!-- dataTableTool -->
<link href='<c:url value="/js/TableTools-2.2.4/css/dataTables.tableTools.min.css"/>' rel="stylesheet" type="text/css"  />
<script type="text/javascript" src='<c:url value="/js/TableTools-2.2.4/js/dataTables.tableTools.min.js"/>'></script>
<!-- 导出pdf，excel需要的文件路径 -->
<c:url value="/js/TableTools-2.2.4/swf/copy_csv_xls_pdf.swf" var="swf_url"/>
<style type="text/css">
#repairTable{
	width: 1000px;
}
#repairTable td,#repairTable th{
	font-size: 14px;
}
#myForm{
	width:30%;
	border: solid 1px;
	border-radius:5px;
	margin: auto;
	line-height: 10px;
}

#div_tb1{
	width: 80%;
	margin: auto;
}
#div_tb1 tbody tr td,#div_tb1 thead tr td{
border: solid 1px;
text-align: center;
}
</style>
<script>
$(function(){
	$("#myForm").submit(function(){
		if($("#state").val()==""){
			alert("請選擇類型!");
			return false;
		}
	});
	var addd=0;
var t = $('#tb1').DataTable({
		
		dom : 'T<"clear">lfrtip',
		tableTools : {
			"sSwfPath" : "${swf_url}"
		},
		"aoColumnDefs": [
		{
 			sDefaultContent: '',
 			aTargets: [ '_all' ]
  		}
		],
		
		//"bSort":false,
		/* "bPaginate": false */
		"language": {
            "lengthMenu": "_MENU_ 条记录每页",
            "zeroRecords": "没有找到记录",
            "info": "第 _PAGE_ 页 ( 总共 _PAGES_ 页 )",
            "infoEmpty": "无记录",
            "infoFiltered": "(从 _MAX_ 条记录过滤)",
            "paginate": {
                "previous": "上一页",
                "next": "下一页"
            }
        
        },
        "footerCallback": function ( row, data, start, end, display ) {
        	var currentCount =0;
        	//alert(data[start][5])
        	for(var i = start;i<end;i++){
        		//alert((data[i][5])
        		currentCount+=parseInt(data[i][5])
        		
        	}
        	$("#tb1 tfoot tr td:last").html(currentCount) 
           
        }
        
	}); 
 	/* var total_count=0;
	$("#tb1 tbody tr:not(#tb1 tr:first)").each(function(i){
		total_count += parseInt($(this).children('td:last').html())
	})
	//$("#tb1").append("<tr><td>合计</td><td></td><td></td><td></td><td></td><td></td></tr>")
	alert(total_count)
	$("#tb1 tfoot tr td:last").html(total_count) */
	$("tb1 tfoot tr td:last").html('test')
});
</script>
<title>${modelName} 生產管理系統--料号查询</title>

</head>

<body>
	<div class="main" >
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<div id="mainbody">
			<form id="myForm" method="post" action="<c:url value="/query/adapterQuery.html"/>">
				<h2>包装料号信息</h2>
				<label id="show">开始时间：</label><label id="data"><input type="text" id="startDate" name="startDate" onclick="WdatePicker()"></label><br><br>
				<label id="show">结束时间：</label><label id="data"><input type="text" id="endDate" name="endDate" onclick="WdatePicker()"></label><br><br>
				<input type="submit" value="送出"><br><br>
				
			</form>
			<h3 style="color:red; text-align: center;" id="message">${message}</h3>
			<div id="div_tb1">
			<table id="tb1">
				<thead>
					<tr>
						<td>序号</td>
						<td>包装日期</td>
						<td>料号</td>
						<td>国别</td>
						<td>料号名称</td>
						<td>数量</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${Lists}"  var="list" varStatus="index">
						<tr>
							<td>${index.count}</td>
							<td>${list.col_pack_date}</td>
							<td>${list.col_column_value}</td>
							<td>${list.col_route_name}</td>
							<td>${list.col_column_name}</td>
							<td>${list.count}</td>
						</tr>
					</c:forEach>
				
					
				</tbody>
				<tfoot>
            <tr>
                <td colspan="5" style="text-align:right">Total:</td>
                <td></td>
            </tr>
        </tfoot>
			</table>
			</div>
		</div>
	</div>
</body>
</html>
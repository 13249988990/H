<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../share/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../share/lib.jsp" %>
<script type="text/javascript" src="<c:url value="/js/My97DatePicker/WdatePicker.js"/>"></script>
<title>${modelName} 生產管理系統</title>
<style type="text/css">
.auth{
margin: 10px;
}
</style>
<script type="text/javascript">
	$(function(){
		$("#type").change(function(){
			if($(this).val()==0){
				//选择年，不能出现其它选择，所以其它选择行移除
				//判断其它选择行是否存在
				if($("#otherInfo").length>0){
					$("#otherInfo").parent("td").parent("tr").remove();
				}
			}else{
				//选择季度、半年、月时 添加其它选择行
				if($("#otherInfo").length==0){
					var tab=document.getElementById("condition");
					var row =tab.insertRow(3);
					var cell1=row.insertCell(0);
					var cell2=row.insertCell(1);
					cell1.innerHTML="其它选择";
					cell2.innerHTML="<select id='otherInfo' name='otherInfo' ></select>";
				}
				
				$.ajax({
					   type: "POST",
					   url: "getContentByType.html",
					   data: {"type":$(this).val()},
					   dataType:"json",
					   async:false,
					   success: function(msg){
						  console.log(msg[0].id)
						   $("#otherInfo").empty();
					     for(var i=0;i<msg.length;i++){
					    	 
					    	 $("#otherInfo").append("<option value="+i+">"+msg[i].id+"</option>")
					     }
					   }
					});
			}
			
		})
		
	})
</script>
</head>
<body >
<div class="main">
		<div class="menu">
			<%@ include file="../share/menu.jsp"%>
		</div>
		<c:if test="${empty message }">
		<div id="mainbody" >
			<form action="<c:url value="/performance/selectType.html"/>" method="post">
				<table id="condition" border="1" style="width: 600px;">
				<caption>绩效考核类型选择 <a href="<c:url value="/department/list.html"/>">返回列表</a></caption>
				<tr>
					<td style="width: 30%;">部门选择</td>
					<td><select name="departmentId" id="departmentId">
							<c:forEach items="${departments }" var="department">
								<option value="${department.id }">${department.departmentName }</option>
							</c:forEach>
					</select> </td>
				</tr>
				<tr>
					<td style="width: 30%;">类型选择</td>
					<td><select name="type" id="type">
							<option value="0">年</option>
							<option value="1">半年</option>
							<option value="2">季度</option>
							<option value="3">月</option>
					</select> </td>
				</tr>
				<tr>
					<td style="width: 30%;">年份选择</td>
					<td><input type="text" name="year" class="Wdate"  onfocus="WdatePicker({dateFmt:'yyyy'})"/> </td>
				</tr>
				<!-- <tr>
					<th style="width: 30%;">其它选择</th>
					<td>
						<select id="otherType" name="otherType">
						
						</select>
					</td>
				</tr> -->
				<tr>
					<td colspan="2"><input type="submit" value="送出"> </td>
				</tr>
			</table>
			</form>
		</div>
		</c:if>
		<h3 id="message">${message}</h3>
	</div>
</body>
</html>
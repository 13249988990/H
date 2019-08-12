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
		$("form").submit(function(event){
			//alert("调用了检查")
			validate($("input[name='cores']"),event);
			
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
			<form action="saveCore.html" method="get">
				<table id="condition" border="1" style="width: 90%;">
				<caption>${user.username} 绩效考核 </caption>
					
						<!-- <div colspan="7"> </div> -->
					
					<thead>
						<th>序号
						<input name="type" type="hidden" value="${type }">
						<input name="year" type="hidden" value="${year }">
						<input name="otherInfo" type="hidden" value="${otherInfo }">
						<input name="userId" type="hidden" value="${user.id }">
						<input name="departmentId" type="hidden" value="${departmentId }">
						</th>
						<th>一级指标</th>
						<th>二级指标</th>
						<th>分值</th>
						<th>评分标准</th>
						<th>评价指标值</th>
						<th>打分</th>
						
					</thead>
					<tbody>
						<c:forEach items="${performance }" var="per" varStatus="item">
							<tr>
								<td>${item.count }<input name="ids" type="hidden" value="${per.id }"></td>
								<td>${per.firstkpi }</td>
								<td>${per.secondkpi }</td>
								<td>${per.signleCore }</td>
								<td>${per.coreStandard }</td>
								<td>${per.appraiseStandard }</td>
								<td><input type="text" name="cores" style="width:20px" min="0" max="${per.signleCore } "></td>
							</tr>
						</c:forEach>
						<tr><td colspan="5">基本工资:<input required="required" type="text" style="margin-left: 2px" name="basicMoney"><td colspan="2"><input type="submit" value="提交"> </td></tr>
					</tbody>
					
				</table>
			</form>
				
			
		</div>
		</c:if>
		<h3 id="message">${message}</h3>
	</div>
</body>
</html>
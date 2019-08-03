<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.foxlink.com/dumpling" prefix="d" %>
<div id="smoothmenu1" class="ddsmoothmenu">
	<ul>
		<li><a href="#">系統管理</a>
			<ul>
				
					<li><a href="<c:url value="/department/list.html"/>">部门管理</a></li>
				
				
					<li><a href="<c:url value="/admin/list.html"/>">用戶管理</a></li>
				
				<d:role url="/role/list.html">
					<li><a href="<c:url value="/role/list.html"/>">角色管理</a></li>
				</d:role>
				<li><a href="<c:url value="/performance/selectType.html"/>">绩效填写</a></li>
				
				<li><a href="<c:url value="/systemReload.html"/>">刷新系统</a></li>
				<li><a href="<c:url value="/Firefox21.0.exe"/>">火狐下载</a></li>
				<li><a href="<c:url value="/jre.exe"/>">Java_JDK</a></li>
			</ul>
		</li>
		<li><a href="#">工单管理</a>
			<ul>
				<d:role url="/order/toAdd.html">
					<li><a href="<c:url value="/order/toAdd.html"/>">新增工单</a></li>
				</d:role>
				<li><a href="<c:url value="/order/list.html"/>">工单管理</a></li>
				<li><a href="<c:url value="/order/showOrder.html"/>">查看排程</a></li>
				<li><a href="<c:url value="/order/report.html"/>">生產報表</a></li>
			</ul>
		</li>
		
		<%@ include file="ObjectMenu.jsp"%>
	</ul>
	<br style="clear: left" />
</div>

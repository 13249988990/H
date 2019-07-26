<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.foxlink.com/dumpling" prefix="d" %>
<li><a href="#">生产系統</a>
	
		<ul>
		
			<c:forEach items="${routes}" var="route">
			
			<c:if test='${route.routeType=="PRODUCTION"}'>
				<li><a href="#">${route.routeName }</a>
					<ul>
						<c:forEach items="${route.sites}" var="site">
						<%-- <c:if test="${site.siteIndex == 1&&site.display==true}"> --%>
							<li><a href='<c:url value="/${site.actionUrl}?routeId=${route.routeId}&siteId=${site.siteId }"/>'>${route.routeName}-${site.siteName}</a></li>
						<%-- </c:if>			 --%>			
					</c:forEach> 
					</ul>
					
				</li>
					
			</c:if>
		</c:forEach>		 
		<li><a href="<c:url value="/production/showTestState.html"/>">整机测试结果查詢</a></li>
		<!-- 
		<d:role url="/production/rework.html">
			<li><a href="<c:url value="/production/rework.html"/>">生產重工解除綁定</a></li>
		</d:role>
		-->
	</ul>
</li>
<li><a href="#">附件系統</a>
	<ul>
		<c:forEach items="${routes}" var="route">
			<c:if test='${route.routeType=="ATTACHMEN"}'>
				<li><a href="<c:url value="/attachment/selectOrder.html?routeId=${route.routeId}"/>">${route.routeName}</a></li>
			</c:if>
		</c:forEach>
		<d:role url="/attachment/delete.html">
			<li><a href="<c:url value="/attachment/delete.html"/>">附件包刪除</a></li>
		</d:role>
	</ul>
</li>
<li><a href="#">維修系統</a>
	<ul>
		<li><a href="<c:url value="/repair/toInRepair.html"/>">進入檢修</a></li>
		<li><a href="<c:url value="/repair/toOutRepair.html"/>">退出檢修</a></li>
		<li><a href="<c:url value="/badItem/toAdd.html"/>">添加站別</a></li>
		<li><a href="<c:url value="/badItem/list.html"/>">站別管理</a></li>
		<li><a href="<c:url value="/repair/toMBReplace.html"/>">主板替換</a></li>
		<li><a href="<c:url value="/repair/ReplaceCis.html"/>">CIS替换</a></li>
		<d:role url="/repair/toUnbind.html">
		<li><a href="<c:url value="/repair/toUnbind.html"/>">Key Part解除綁定</a></li>
		</d:role>
	
	</ul>
</li>
<li><a href="#">出貨計畫管理</a>
	<ul>
		<d:role url="/plan/toPoAdd.html">
			<li><a href="<c:url value="/plan/toPoAdd.html"/>">新增出貨計畫</a></li>
		</d:role>
		<%-- <d:role url="/plan/toAdd.html">
			<li><a href="<c:url value="/plan/toAdd.html"/>">新增出貨計畫</a></li>
		</d:role> --%>
		<li><a href="<c:url value="/plan/list.html"/>">出貨計畫管理</a></li>
		<li><a href="<c:url value="/plan/asplist.html"/>">散貨計畫管理</a></li>
		
		<d:role url="/packType/toAdd.html">
			<li><a href="<c:url value="/packType/toAdd.html"/>">新增包裝方式</a></li>
		</d:role>
		<d:role url="/packType/list.html">
			<li><a href="<c:url value="/packType/list.html"/>">包裝方式管理</a></li>
		</d:role>
	</ul>
</li>
<li><a href="#">包裝系統</a>
	<ul>	
		<li><a href="<c:url value="/production/InBinding.html"/>">客戶條碼綁定</a></li>
		<li><a href="<c:url value="/pack/InBox.html"/>">包裝入小箱</a></li>
		<li><a href="<c:url value="/pack/InBigBox.html"/>">包裝入大箱</a></li>
		<li><a href="<c:url value="/pack/selectPackPlan.html"/>">包裝入板</a></li>
		<li><a href="<c:url value="/pack/toUnderPallet.html"/>">尾數板預入庫</a></li>
		<%-- <li><a href="<c:url value="/pack/checkStorage.html"/>">栈板包装检测</a></li>
		<li><a href="<c:url value="/pack/checkPalletlast.html"/>">尾數栈板包装檢測</a></li> --%><!-- 因IE要求，開會討論後添加了棧板包裝檢測和尾數棧板包裝檢測頁面 -->
			<%-- <d:role url="/pack/toUnpack.html">
			<li><a href="<c:url value="/pack/toUnpack.html"/>">棧板刪除</a></li>
		</d:role> --%>
		<d:role url="/pack/toUnpack.html">
		<li><a href="<c:url value="/pack/toUnpack.html"/>">棧板&&PO刪除</a></li>
		</d:role>
		<d:role url="/pack/splitPallet.html">
		<li><a href="<c:url value="/pack/splitPallet.html"/>">棧板-->大箱</a></li>
		</d:role>
		<d:role url="/pack/splitBox.html">
		<li><a href="<c:url value="/pack/splitBox.html"/>">大箱-->彩盒</a></li>
		</d:role>
		<d:role url="/pack/splitCarton.html">
		<li><a href="<c:url value="/pack/splitCarton.html"/>">拆除彩盒</a></li>
		</d:role>
		<d:role url="/pack/showPallet.html">
			<li><a href="<c:url value="/pack/showPallet.html"/>">棧板加鎖/解鎖</a></li>
		</d:role>
		<li><a href="<c:url value="/pack/OBACheck.html"/>">OBA檢測</a></li>
		<li><a href="<c:url value="/pack/OBACheckBox.html"/>">OBA大箱抽测</a></li>
		<li><a href="<c:url value="/pack/toStorage.html"/>">制造入庫</a></li>
		<d:role url="/pack/deletePallet.html">
			<li><a href="<c:url value="/pack/deletePallet.html"/>">入板资料删除</a></li>
		</d:role>
		<!-- 
			<li><a href="<c:url value="/pack/toRework.html"/>">包裝重工</a></li>
		 -->
	</ul>
</li>
<li><a href="#">裸機系統</a>
	<ul>
	<li><a href="<c:url value="/machine/selectPallet.html"/>">裸機入板</a></li>
	<li><a href="<c:url value="/machine/toStorage.html"/>">裸機入庫</a></li>
	<li><a href="<c:url value="/machine/toShip.html"/>">裸機出庫</a></li>
	<li><a href="<c:url value="/machine/toUnderPallet.html"/>">尾數板預入庫</a></li>
	<li><a href="<c:url value="/machine/toUnPallet.html"/>">重入解板</a></li>
	<li><a href="<c:url value="/machine/queryPallet.html"/>">裸機棧板查詢</a></li>
	</ul>
</li>
<li><a href="#">出貨系統</a>
	<ul>
		
		<li><a href="<c:url value="/ship/toSelectPlan.html"/>">倉庫入庫</a></li>
		<li><a href="<c:url value="/ship/toShip.html"/>">倉庫出貨</a></li>
		<!-- 
		<li><a href="<c:url value="/pack/toReplace.html"/>">整機替換</a></li>
		 -->
		 <d:role url="/ship/toUnaccept.html">
		<li><a href="<c:url value="/ship/toUnaccept.html"/>">倉庫退回</a></li>
		</d:role>
		<d:role url="/ship/toUnship.html">
			<li><a href="<c:url value="/ship/toUnship.html"/>">出貨退回</a></li>
		</d:role>
		<%-- <li><a href="<c:url value="/ship/showEDI.html"/>">EDI 導入</a></li> --%>
	</ul>
</li>
<li><a href="#">查詢系統</a>
	<ul>
		<li><a href="<c:url value="/query/packQuery.html"/>">包裝產出查詢</a></li>
		<li><a href="<c:url value="/query/queryByOne.html"/>">單機查詢</a></li>
		<li><a href="<c:url value="/query/queryPallet.html"/>">棧板查詢</a></li>
		<li><a href="<c:url value="/query/queryOrder.html"/>">工單查詢</a></li>
		<%-- <li><a href="<c:url value="/query/toRepairQuery.html"/>">维修查询</a></li> --%>
		<!--  
		<li><a href="<c:url value="/query/toPalletQuery.html"/>">入庫查询</a></li>
		-->
		<li><a href="<c:url value="/query/lotQuery.html"/>">出貨資料查询</a></li>
		<li><a href="<c:url value="/query/machineTestQuery.html"/>">Machine Test查询</a></li>
		<li><a href="<c:url value="/query/adapterQuery.html"/>">包装料查询</a></li>
		<li><a href="<c:url value="/query/replaceQuery.html"/>">替换查询</a></li> 
		<li><a href="<c:url value="/query/At5Query.html"/>">At5&&Card重测查询</a></li>
		<li><a href="<c:url value="/query/machineQuery.html"/>">Machine_Test重测查询</a></li>
		<li><a href="<c:url value="/query/cisQuery.html"/>">CIS查询</a></li>
		<%-- <li><a href="<c:url value="/query/serialNumQuery.html"/>">序列號查询</a></li> --%>
		
	
		
	</ul>
</li>
<li><a href="#">看板管理</a>
	<ul>
		<li><a href="<c:url value="/board/monitor.html"/>">產能看板</a></li>
		<d:role url="/board/list.html">
			<li><a href="<c:url value="/board/list.html"/>">看板管理</a></li>
		</d:role>
		
	</ul>
</li>

<c:if test="${dumpling_user!=null}">
	<li>
	<a href="<c:url value="/admin/logout.html"/>">[${dumpling_user.username}]退出登錄</a>
	</li>
</c:if>
<c:if test="${dumpling_user==null}">
	<li>
	<a href="<c:url value="/admin/login.html"/>">用戶登錄</a>
	</li>
</c:if>
<li>
	<a href="#">[2,4,6,2018-06-09]</a>
</li>
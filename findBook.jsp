
<%@page import="com.zking.oa.entity.MyUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="/mytag" prefix="m"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>飞凡网上书店</title>

<link href="css/main.css" rel="stylesheet" type="text/css" />
<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
</head>

<body>
	<!--top-->



		<div id="top_div">
	
	<%
		Object attribute = request.getSession().getAttribute("user");
	%>
	
	<s:url id="UseridoneURL" action="ShopCatAction_SelectByUserid"></s:url>
		
		<s:url id="exitloginURL" action="UserAction_Exitlogin"></s:url>

		<p class="left">您好，欢迎来到飞凡网上书店 ！</p>
		<p class="right">
		
		<%
		if(attribute==null){
		%>
			<a href="login.jsp">登陆</a> | 
			<a href="register.jsp">注册</a> | 
		<%
		}else{
			MyUser user = (MyUser)attribute;
		%>
			账号：<%=user.getUserName() %>  | 
				<s:a href="%{#exitloginURL}">退出登陆</s:a>
		<%	
		}
		%>
			<s:a href="%{#UseridoneURL}">我的购物车</s:a> | 
			<a href="index.jsp">网站首页</a>
		</p>





		<div class="fixed"></div>
	</div>

	<div id="header_div">
		<div id="search">
			<!--下面form标签的id属性不能修改，因为在css中使用了一个id选择器-->
			<s:form action="BooksAction_selectAll" method="post" theme="simple"
				id="form">
				<table width="413" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td>
							<!-- <input type="text" name="" value="" id="input"/> --> <s:textfield
								id="input" theme="simple" name="bookName"></s:textfield>
						</td>
						<td><input type="image" name="imageField"
							src="images/btn_search.png" /></td>
					</tr>
				</table>
			</s:form>
		</div>
	</div>

	<!--nav-->
	<div id="nav">
		<ul id="menu">
			<li>-</li>
		</ul>
	</div>
	<!--end nav-->

	<!--end top-->

	<!--con-->
	<div class="w960 mt10">
		<div class="side left">
			<h3>图书分类</h3>
			<ul class="classify bgf7e4e4 bdf7e4e4">
				<s:action name="BooksAction_selectBookType" id="type"
					ignoreContextParams="true"></s:action>
				<s:iterator value="#type.result" var="vtype">
					<li><s:url id="stateURL" action="BooksAction_selectBookByType">
							<s:param name="bookCategoryId" value="#vtype.bookCategoryId"></s:param>
						</s:url> <s:a href="%{#stateURL}">
							<s:property value="#vtype.bookCategoryName" />
						</s:a></li>
				</s:iterator>

				<div class="fixed"></div>
			</ul>

		</div>
		<!-- ------------------------------------------------------------------------------- -->
		<div class="w740 right">
			<div class="order02 pb10">

				<s:iterator value="result" var="v">
					<dl class="findbook">
						<dt class="left">
						
							<s:url id="imageURL" action="UploadAction_doOpen">
								<s:param name="id" value="#v.bookImage"></s:param>
							</s:url>
							<img width="150dp" height="200dp" src='<s:property value="#imageURL"/>'/>
					
						</dt>
						<dd class="right">
							<h4>
								<s:property value="#v.bookName" />
							</h4>
							<p>
								<strong>作者：</strong>
								<s:property value="#v.bookAuthor" />
							</p>
							<p>
								<strong>价格：</strong>￥
								<s:property value="#v.bookPrice" />
							</p>
							<p>
								<strong>出版社：</strong>
								<s:property value="#v.publishing" />
							</p>
							<p>
								<strong>书籍简介：</strong>
								<s:property value="#v.bookDesc" />
							</p>
							<p class="mt10">
							<s:url id="bookidURL" action="ShopCatAction_addCat">
								<s:param name="Bid" value="#v.bookId"></s:param>
							</s:url>
							
							<%
							if(attribute!=null){
							%>
								<s:a href="%{#bookidURL}"><img src="images/btn_shopping.png" /></s:a>
							<%
							}else{
							%>	
								<s:a href="login.jsp"><img src="images/btn_shopping.png" /></s:a>
							<%
							}
							%>
							
							<%-- <s:url id="addorderoneURL" action="OrderAction_">
								<s:param name="Bid" value="#v.bookId"></s:param>
							</s:url> --%>
							
							<s:url id="bookidtwoURL" action="OrderAction_aaa">
								<s:param name="bookId" value="#v.bookId"></s:param>
								<s:param name="bookPrice" value="#v.bookPrice"></s:param>
							</s:url>
							<%
							if(attribute!=null){
							%>
							<s:a href="%{#bookidtwoURL}"><img src="images/btn_accounts.png" /></s:a>
							<%
							}else{
							%>	
								<s:a href="login.jsp"><img src="images/btn_accounts.png" /></s:a>
							<%
							}
							%>
							</p>
						</dd>
						<div class="fixed"></div>
					</dl>
				</s:iterator>

			</div>

			<!-- page -->
			<div style="text-align: right;">
				<!-- 每页 5 行 共 9 行 第 1 页 共 2 页 <a href='javascript:gotoPage(1)'>首页</a> <a href='javascript:gotoPage(1)'>上一页</a> <a href='javascript:gotoPage(2)'>下一页</a> <a href='javascript:gotoPage(2)'>尾页</a> 页数 <input type='text' id='pageNumber'  style='width:20px;' /> <a href='javascript:jumpPage()'>GO</a> -->
				<m:page pageBean="${requestScope.PageBean }" />
			</div>
			<!-- end page -->

		</div>

		<!-- ------------------------------------------------------------------------------- -->

		<div class="fixed"></div>
	</div>
	<!--end con-->
	<!--end con-->

	<!--footer-->

	<div id="footer_wrap">
		<p>Copyright ©2014 飞凡教育，版权所有</p>
	</div>

	<!--end footer-->
</body>
</html>

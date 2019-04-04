
<%@page import="com.zking.oa.entity.MyUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="/mytag" prefix="m"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>飞凡网上书店</title>

<link href="css/main.css" rel="stylesheet" type="text/css" />
<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
		<meta http-equiv="expires" content="0"/>
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
				
				
				
				<s:a href="listMyOrder1.jsp">我的订单</s:a>
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
		<ul id="menu"></ul>
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
		<div class="w740 right">
			<div class="main_div">
				<div class="banner left">
					<img src="images/banner.png" />
				</div>
				<div class="fixed"></div>
			</div>

			<div class="main_div mt10">
				<h2>
					<cite class="left">新书上架</cite>
					<div class="fixed"></div>
				</h2>

				<ul class="arivals">

					<s:action name="BooksAction_SelectBookBydate" id="zuixing"
						ignoreContextParams="true"></s:action>
						
					<s:iterator value="#zuixing.result" var="v">
						<li><s:url id="selectByidURL" action="UploadAction_doOpen">
								<s:param name="id" value="#v.bookImage"></s:param>
							</s:url> 
							
							
							<s:url
									id="OneBookURL" action="BooksAction_SelectBookByIdIndex">
									<s:param name="bookId" value="bookId"></s:param>
								</s:url>
							<s:a href="%{#OneBookURL}">
								<img width="50dp" height="100dp"
									src='<s:property value="#selectByidURL"/>' />
							</s:a>

							<p>
								<s:property value="#v.bookName" />
							</p>
							<p class="red">
								￥
								<s:property value="#v.bookPrice" />
							</p> <!-- <a href="#"><img src="imgs/9.png" /></a><p>爱的样子</p><p class="red">￥23.60</p> -->
						</li>
					</s:iterator>
					<div class="fixed"></div>
				</ul>
			</div>

			<div class="main_div mt10">
				<h2>
					<cite class="left">热销图书</cite>
					<div class="fixed"></div>
				</h2>

				<ul class="arivals">


					<s:action name="BooksAction_SelectBookBySalesVolume"
						id="xiaoliangaction" ignoreContextParams="true"></s:action>
					<s:iterator value="#xiaoliangaction.result" var="v">
						<li><s:url id="imageURL" action="UploadAction_doOpen">
								<s:param name="id" value="#v.bookImage"></s:param>
							</s:url> 
								<s:url
									id="OneBookURL" action="BooksAction_SelectBookByIdIndex">
									<s:param name="bookId" value="bookId"></s:param>
								</s:url>
							<s:a href="%{#OneBookURL}"><img width="50dp" height="100dp"src='<s:property value="#imageURL"/>' /></s:a>




							<p>
								<s:property value="#v.bookName" />
							</p>
							<p class="red">
								￥
								<s:property value="#v.bookPrice" />
							</p> <!-- <a href="#"><img src="imgs/1.png" /></a><p>冷间谍</p><p class="red">￥28.50</p> -->
						</li>
					</s:iterator>
					<div class="fixed"></div>
				</ul>
			</div>
		</div>
		<div class="fixed"></div>
	</div>
	<!--end con-->

	<!--footer-->

	<div id="footer_wrap">
		<p>Copyright ©2014 飞凡教育，版权所有</p>
	</div>

	<!--end footer-->
</body>
</html>

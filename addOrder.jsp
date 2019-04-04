<%@page import="com.zking.oa.entity.MyUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
		<form id="form">
		<table width="413" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td>
					<input type="text" name="" value="" id="input">
				</td>
				<td>
					<input type="image" name="imageField" src="images/btn_search.png" />
				</td>
			</tr>
		</table>
		</form>
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
			<div class="o-mt">
	        	<h2>订单新增</h2>
	        </div>
	        <div class="order02 pb10">
	        <s:form action="OrderAction_addOrder" method="post" theme="simple">
	        	<s:if test="#request.testone!='one'">
	        		<s:hidden name="bookId"></s:hidden>
	        		<s:hidden name="bookPrice"></s:hidden>
	        	</s:if>
	        	<table width="738" align="center" cellpadding="0" cellspacing="0">
	        		<tr class="bd2">
	        			<th width="20%" align="center" class="bd2">收货人</td>
	        			<td width="80%"  align="left" class="bd1 pl9" >
	        				<!-- <input type="text" name="" value="" id="" class="input w300"> -->
	        				<s:textfield name="consignee"  class="input w300" theme="simple"></s:textfield>
	        				
	        				<span class="required">*</span>
	        			</td>
	        		</tr>
	        		<tr class="bd2">
	        			<th width="20%" align="center" class="bd2">收货人电话</td>
	        			<td width="80%"  align="left" class="bd1 pl9" >
	        				<s:textfield name="phone"  class="input w300" theme="simple"></s:textfield><span class="required">*</span>
	        			</td>
	        		</tr>
	        		<tr class="bd2">
	        			<th width="20%" align="center" class="bd2">收货人邮编</td>
	        			<td width="80%"  align="left" class="bd1 pl9" >
	        				<s:textfield name="postalcode"  class="input w300" theme="simple"></s:textfield><span class="required">*</span>
	        			</td>
	        		</tr>
	        		<tr class="bd2">
	        			<th width="20%" align="center" class="bd2">收货人地址</td>
	        			<td width="80%"  align="left" class="bd1 pl9" >
	        				<s:textfield name="address"  class="input w300" theme="simple"></s:textfield><span class="required">*</span>
	        			</td>
	        		</tr>
	        		
	        		<tr class="bd2">
	        			<th width="20%" align="center" class="bd2">发货方式</td>
	        			<td width="80%"  align="left" class="bd1 pl9">
	        				<select name="sendtype"  style="width:305px;">
	        					<option value="1">平邮(默认)</option>
	        					<option value="2">快递</option></select> 
	        					<span class="required">*</span>
	        			</td>
	        		</tr>
	        	</table>
	        	
	        	<table width="738" border="0" cellspacing="0" cellpadding="0" class="mt10" align="center">
	        		<tr>
	        			<td width="20%" align="center" class="bd2"></td>
	        			<td width="80%" align="left" class="pl9" >
	        				<input type="submit" value="确定" class="btn"/>
	        			</td>
	        		</tr>
        		</table>
        		</s:form>
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

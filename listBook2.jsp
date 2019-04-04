 <%@page import="com.zking.oa.entity.MyUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
 <%@taglib uri="/struts-tags" prefix="s"%>
 <%@taglib uri="/mytag" prefix="m" %>
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
		MyUser usertwo = (MyUser)request.getSession().getAttribute("user");
		%>
		<p class="left">您好管理员，欢迎来到飞凡网上书店 ！</p>
		<p class="right">
			您好：<%=usertwo.getUserName() %>| <s:a href="UserAction_Exitlogin">退出系统</s:a> | <a href="index.jsp">网站首页</a>
		</p>

		<div class="fixed"></div>
	</div>
   
<div id="header_div">
	<div id="search">
		<!--form的id与下面文本框的id不能修改，因为使用了id选择器定义样式-->
		<form name="bookForm" id="form" method="post" action="#">
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
 
	<!--content-->
	<div class="w960 mt10">
		<div class="breadcrumb"></div>
	</div>
 
	<div class="w960">
		<div class="side left">
			
 
			<!--nav-->
			<h4>书籍管理</h4>   
	      	<ul class="classify E6">
		      	<li>&nbsp;&nbsp;<a href="addBook.jsp">新&nbsp;&nbsp;增</a></li>
				<li>&nbsp;&nbsp;<a href="BooksAction_selectBooks">未上架</a></li>
				<li>&nbsp;&nbsp;<a href="BooksAction_selectBooks2">已上架</a></li>
				<li>&nbsp;&nbsp;<a href="BooksAction_selectBooks3">已下架</a></li>
		      	<div class="fixed"></div>
			</ul>
			<h4>订单管理</h4>        
		    <ul class="classify E6">
		      	<li>&nbsp;&nbsp;<a href="OrderAction_selectAllOrder">未发货</a></li>
		      	<li>&nbsp;&nbsp;<a href="OrderAction_selectAllOrder2">已发货</a></li>
		      	<li>&nbsp;&nbsp;<a href="OrderAction_selectAllOrder3">已签收</a></li>
		      	<div class="fixed"></div>
			</ul>
			<!--end nav-->
 
		</div>
    
		<div class="w740 right">
			<div class="o-mt">
	        	<h2>已上架书籍</h2>
	        </div>
	        <div class="order01">
	        <!-- 88888888888888888888888888888888888888888888888888888888888888888888888888888888888 -->
	        <s:form action="BooksAction_selectBooks2" method="post" theme="simple"> 
	        	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
	        		<tr>
	        			<td width="15%" align="right">书名：</td>
	        			<td width="15%">
	        			 <!-- <input type="text" name="bookName" value="" class="w110 input">  -->
	        			<s:textfield name="bookName" class="w110 input" theme="simple"></s:textfield> 
	        			</td>
	        			<td width="15%" align="right"></td>
	        			<td width="15%">
	        				<input type="image" name="imageField2" src="images/btn_cx.png" />
	        			</td>
	        			<td width="15%" align="right"></td>
        				<td width="25%"></td>
              		</tr>
			  	</table>
			  	</s:form>
	        </div>
	        
	        <div class="order02">
	        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	              <tr>
	                <th width="15%" class="bd2">书名</th>
	                <th width="15%" class="bd2">作者</th>
	                <th width="15%" class="bd2">价格</th>
	                <th width="25%" class="bd2">出版社</th>
	                <th width="30%" class="bd2">操作</th>
	              </tr>
	              
	              
	              <s:iterator value="result" var="v">
	              <tr>
	                <td width="15%" class="text"><s:property value="#v.bookName" /></td>
	                <td width="15%" class="text"><s:property value="#v.bookAuthor" /></td>
	                <td width="15%" class="text"><s:property value="#v.bookPrice" /></td>
	                <td width="25%" class="text"><s:property value="#v.publishing" /></td>
	                <td width="30%" class="text">
	                <s:url id="stateURL2" action="BooksAction_State2">
									<s:param name="bookId" value="bookId"></s:param>
									<s:param name="bookState" value="3"></s:param>
								</s:url> <s:a href="%{#stateURL2}">下架</s:a></td>
	              </tr>
	              </s:iterator>
	            </table>
	        </div>
	        
	        <!-- page -->
	        <div style="text-align: right;">
	        	<!-- 每页 5 行 共 1 行 第 1 页 共 1 页 <a href='javascript:gotoPage(1)'>首页</a> <a href='javascript:gotoPage(1)'>上一页</a> <a href='javascript:gotoPage(1)'>下一页</a> <a href='javascript:gotoPage(1)'>尾页</a> 页数 <input type='text' id='pageNumber'  style='width:20px;' /> <a href='javascript:jumpPage()'>GO</a> -->
	        	<m:page pageBean="${requestScope.PageBean }" />
	        </div>
	        <!-- end page -->
	        
	        <!-- 88888888888888888888888888888888888888888888888888888888888888888888888888888888888 -->
	        
	        <!-- end page -->
	    </div>
 		<div class="fixed"></div>   
	</div>
	<!--end content-->
 
	<!--footer-->
	
<div id="footer_wrap">
	<p>Copyright ©2014 飞凡教育，版权所有</p>
</div>
 
	<!--end footer-->
</body>
</html>


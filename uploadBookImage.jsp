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
	
		
		
			
				
					<p class="left">您好admin，欢迎来到飞凡网上书店 ！</p>
					<p class="right"><a href="#">后台管理</a> | <a href="#">退出系统</a> | <a href="#">网站首页</a></p>
				
				
			
		
	
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
	        	<h2>图片上传</h2>
	        </div>
	        <div class="order02 pb10">
	        <s:form action="UploadAction_Upload" method="post" theme="simple" enctype="multipart/form-data" >
	        	<table width="738" align="center" cellpadding="0" cellspacing="0">
	        		<tr class="bd2">
	        			<td width="20%" align="center" class="bd2">图片</td>
	        			<%-- <td width="80%"  align="left" class="bd1 pl9" >
	        				<input type="file" id="" name="" class="input w300"/><span class="required">*</span>
	        			</td> --%>
	        			<td width="80%"  align="left" class="bd1 pl9" >
	        			
	        				<s:file class="input w300" theme="simple" name="img"/><span class="required">*</span>
	        			
	        			<s:hidden name="bookId"></s:hidden>
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
	<!--end content-->

	<!--footer-->
	
<div id="footer_wrap">
	<p>Copyright ©2014 飞凡教育，版权所有</p>
</div>

	<!--end footer-->
</body>
</html>

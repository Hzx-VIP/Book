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

	<!--content-->
	<div class="w960 mt10">
		<div class="breadcrumb"></div>
	</div>

	<div class="w960">
		<div class="side left">
			

			<!--nav-->
			<h4>我的订单</h4>        
		    <ul class="classify E6">
		      	<li>&nbsp;&nbsp;<a href="listMyOrder1.jsp">未发货</a></li>
		      	<li>&nbsp;&nbsp;<a href="listMyOrder2.jsp">已发货</a></li>
		      	<li>&nbsp;&nbsp;<a href="listMyOrder3.jsp">已签收</a></li>
		      	<div class="fixed"></div>
			</ul>
			<!--end nav-->

		</div>
    
		<div class="w740 right">
			<div class="o-mt">
	        	<h2>已签收订单</h2>
	        </div>
	        <div class="order02">
	        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	              <tr>
	                <th width="10%" class="bd2">下单日期</th>
	                <th width="15%" class="bd2">收货人</th>
	                <th width="15%" class="bd2">收货人电话</th>
	                <th width="15%" class="bd2">收货人邮编</th>
	                <th width="15%" class="bd2">收货人地址</th>
	                <th width="10%" class="bd2">发货方式</th>
	                <th width="10%" class="bd2">订单总价</th>
	                <th width="10%" class="bd2">操作</th>
	              </tr>
	              
	              
	              <s:action name="OrderAction_selectOrder3" id="there"
					ignoreContextParams="true"></s:action>
	              <s:iterator value="#there.result" var="v">
	              <tr>
	                <td width="10%" class="text"> <s:property value="#v.orderDatetime"/> </td>
	                <td width="15%" class="text"><s:property value="#v.consignee"/></td>
	                <td width="15%" class="text"><s:property value="#v.phone"/></td>
	                <td width="15%" class="text"><s:property value="#v.postalcode"/></td>
	                <td width="15%" class="text"><s:property value="#v.address"/></td>
	                <td width="10%" class="text">
	                	<s:if test="#v.sendType==1">
	                		平邮
	                	</s:if>
	                	<s:else>
	                		快递
	                	</s:else>
	                <td width="10%" class="text">￥<s:property value="#v.orderPrice"/></td>
	                <td width="10%" class="text">
	                
	                	
	                </td>
	              </tr>
	              
	              </s:iterator>
	              
	              
	            </table>
	        </div>
	        
	        <!-- page -->
	        <div style="text-align: right;">
	        <m:page pageBean="${requestScope.PageBean }" />
	        </div>
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

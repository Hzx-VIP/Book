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
  <script type="text/javascript">
  
  function tj(){
	  var ach = document.getElementsByName("sa");
	  var bookid = new Array();
	  var counts = new Array();
	  for ( var j = 0; j <ach.length; j++) {
			  //商品
			  var value = document.getElementById("bookId"+(j+1)).value;
			  bookid[j] = value;
	          	//数量
	          	var count = document.getElementById("num"+(j+1)).value;
		      	counts[j] = count;
	  }
	  //总价
	  var summoney = document.getElementById('total').value;
	  window.location.href = "OrderAction_MydoValue.action?bookIds="+bookid+"&counts="+counts+"&summoney="+summoney;
  }
  
  
  
	function changeNumber(i) {
		var num = parseInt(document.getElementById("num" + i).value);
		if (num > 100) {
			document.getElementById("num" + i).value = 100;
		} else if (num < 1) {
			document.getElementById("num" + i).value = 1;
		}
		//获取数量
		var count = document.getElementById("num" + i).value;
		var ccount = parseInt(count);
		//获取单价
		var price = document.getElementById("price" + i).value;
		var cprice = parseFloat(price);
		//获取总金额
		document.getElementById("money" + i).value = "" + ccount * cprice;
		
		
		//设置数量
		document.getElementById("setcount").value=ccount;
		document.getElementById("Cid").value=document.getElementById("catid"+i).value;
		priceTotal();

	}
	
	// 用js实现在加载完成一个页面后自动执行一个方法
	/*用window.onload调用priceTotal()*/
	window.onload=priceTotal;//不要括号
	
	function priceTotal(){
		//总价
		var total = document.getElementById("total");
		
		//根据name获取多选框集合
		var cks = document.getElementsByName("sa");
		
		//遍历设值小计
		for(var j =1;j<=cks.length;j++){
			var price = document.getElementById("price"+j).value;
			var cprice = parseFloat(price);
			var num = document.getElementById("num"+j).value;
			var ccount = parseInt(num);
			document.getElementById("money"+j).value = "" + ccount * cprice;
		}
		
		//总价
		var sum = 0;
		//遍历设值总价
		for(var j =1;j<=cks.length;j++){
			var rowsum = document.getElementById("money"+j).value;
			sum+=parseFloat(rowsum);
		}
		document.getElementById("total").value = "" + sum;
	}
	
	
</script>
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
			<div class="order02">
	        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	              <tr>
	                <th width="20%" class="bd2">书名</th>
	                <th width="20%" class="bd2">单价</th>
	                <th width="20%" class="bd2">数量</th>
	                <th width="20%" class="bd2">小计</th>
	                <th width="20%" class="bd2">操作</th>
	              </tr>
	              
	              <!-- ------------------------------------------- -->
	              
	             <%--  <s:action id="catitem" name="ShopCatAction_SelectByUserid" ignoreContextParams="true"></s:action> --%>
	              <%-- <s:iterator value="#catitem.result" var="v"> --%>
	              
	              
	              <s:iterator value="result" var="v" status="s">
	              
	              <input type="hidden" id="bookId<s:property value="#s.count" />"
	              	value="<s:property value="#v.Bid" />"
	              />
	              
	             <s:action id="catitem" name="ShopCatAction_SelectByBookId" ignoreContextParams="true"	>
	              	<s:param name="Bid" value="#v.Bid"></s:param>
	              </s:action>
	              
	              <tr>
	                <td width="20%" class="text"><input type="checkbox" name="sa" style="display: none" checked="checked" /><s:property value="#catitem.result.bookName"/>
	                
	                	<input
								type="hidden"
								id="catid<s:property value="#s.count" />"
								value="<s:property value="#v.Cid"/>"
	                />
	                
	                 </td>
	                
	                <td width="20%" class="text">
	                <input class="input"
	                			readonly="readonly"
								style="width: 50px; text-align: center; border: 0;" type="text"
								id="price<s:property value="#s.count" />"
								value="<s:property value="#catitem.result.bookPrice"/>"
	                />
	                </td>
	                
	                 <s:form method="post" theme="simple" action="ShopCatAction_UpdateCatBookCount" id="sub">
		                <td width="20%" class="text">
		                <input class="input"
									onchange="changeNumber(<s:property value="#s.count" />)"
									style="width: 50px;text-align: center;" type="text"
									id="num<s:property value="#s.count" />"
									value="<s:property value="#v.Ccount"/>"
									/>
									<s:hidden id="setcount" name="Ccount"></s:hidden>
									<s:hidden id="Cid" name="Cid"></s:hidden>
		                </td>
	                <td width="20%" class="text">
						<input class="input"
								readonly="readonly"
								style="width: 50px; text-align: center; border: 0;" type="text"
								id="money<s:property value="#s.count" />"
								value="<s:property value="#catitem.result.bookPrice" />"
								/>元
	                </td>
	                
	                <td width="20%" class="text">
	                <s:url id="deleteBycatidURL" action="ShopCatAction_Deletecatitem">
	                		<s:param name="Cid" value="#v.Cid"></s:param>
	                </s:url>
	                <s:a href="%{#deleteBycatidURL}">删除</s:a>
	                
	                <%-- <s:url id="updatecountURL" action="ShopCatAction_UpdateCatBookCount">
	                	<s:param name="Cid" value="#v.Cid"></s:param>
	                	<s:param name="Ccount" value="#v.Ccount"></s:param>
	                </s:url>
	                <s:a href="%{#updatecountURL}">更新</s:a> --%>
	                
	                <s:a name="submit" theme="simple" onclick="document.getElementById('sub').submit();return false">更新</s:a>
	                
	                </td>
	                </s:form>
	              </tr>
	              </s:iterator>
	              <!-- ------------------------------------------- -->
	              
	            </table>
	            
	            <table width="100%" border="0" cellspacing="0" cellpadding="0"  class="bd2">
	             	<tr bgcolor="#fefcea">
	             		<td width="80%" align="right"><strong>订单总价：</strong></td>
	             		
	             		<%-- <td width="20%" align="left"><strong><span class="STYLE1">53.30</span></strong></td> --%>
	             		
	             		<td width="20%" align="left">
		             		<strong>
		             			<span> 
		             				<input class="input" readonly="readonly" style="width: 50px; border: 0;color:red;background-color: #FEFCEA;font-weight: bold;" type="text"
										id="total"/> 元
								</span>
							</strong>
						</td>
	             		
             		</tr>
            	</table>
            	<table width="738" border="0" cellspacing="0" cellpadding="0" class="mt10">
            		<tr>
            			<td width="5%" align="center" ></td>
            			<td width="30%" align="center" >
            			<s:url id="deleteallbookURL" action="ShopCatAction_Deleteallbook"></s:url>
            			<s:a href="%{#deleteallbookURL}"><img src="images/btn_shoppingcart.png"/></s:a>
           				</td>
           				<td width="30%" align="center" >
           					<a href="index.jsp"><img src="images/btn_jxgm.png"/></a>
          				</td>
          				
          				
          				
          				<td width="30%" align="center" >
          					 <a onclick="tj()"><img src="images/btn_accounts.png"/></a>
          					<!-- <a href="OrderAction_MydoValue"><img src="images/btn_accounts.png"/></a> -->
          				</td>
          				
          				
          				<td width="5%"></td>
         			</tr>
         		</table>
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

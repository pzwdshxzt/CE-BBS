<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>回复板块</title>
	<base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script> 
    <!-- Custom styles for this template -->
    <link href="css/dashboard.css" rel="stylesheet">
 	<script type="text/javascript" src="js/layer.js"></script> 

  </head>
  
   <script type="text/javascript">
  	
  </script>	
  <body>
  	 <h3>&nbsp;&nbsp;Topic Manage &nbsp;&nbsp;</h3>	
  		<form class="form-inline" action="hfglController.do?param=seach" method="post">
	    	<input type="text" name="seach" class="form-control"  placeholder="用户名/内容">
	  		<button type="submit" class="btn btn-success">seach</button>
		</form>
  	 <table class="table table-hover table-striped">
  	 	<tr align="center">
  	 		<td>回复Id</td>
  	 		<td>回复人</td>
  	 		<td>回复内容</td>
  	 		<td>操作</td>
  	 	</tr>
  	 	<c:forEach var="hf" items="${replys}">
    	<tr align="center">
    	<td>${hf.replyId}</td>
    	<td>${hf.user.userName}</td> 
    	<td>${hf.replyContent}</td>   	
        <td><a id="${hf.replyId}" class="btn btn-danger" onclick="deleteEntity(this.id)">删除</a></td>
    	<tr>
        </c:forEach>
        <tr align="center"><td colspan="8"></td></tr>
  	 </table>
  	 	<nav aria-label="Page navigation " align="center">
  			<div class="message" >搜索到<i class="blue">${num}</i>条记录</div>
		</nav> 
  </body>
  
  		
</html>

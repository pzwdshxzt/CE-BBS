<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>管理员添加</title>
	<base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/layer.js"></script> 
    <script type="text/javascript" src="js/admin.js"></script>
	<link rel="stylesheet" href="css/bootstrap.min.css">
  </head>

  <body>

<div>
    <form action="adminContrl.do?param=add" method="post" >
    		<div style="text-align: center;margin:0 auto ">
    				<h2>管理员添加</h2>
	          		<div class="form-group">
					    <label for="username">username</label>
					    <input id="username" type="text" name="admin.username" class="form-control"  placeholder="username">
					</div>
					<div class="form-group">
					    <label for="password">password</label>
					    <input id="password" type="password" name="admin.password" class="form-control"  placeholder="password">
					</div>
					<div class="form-group">	
					    <label for="again">again password</label>
					    <input id="againx" type="password"  class="form-control"  placeholder="again password">
					</div>

    			    <button id="add" type="submit" class="btn btn-success">Add</button>
    			</div>
        </form>
     </div>   
  </body>
  
</html>

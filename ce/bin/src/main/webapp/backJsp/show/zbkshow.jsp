<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 
  <head>
    <title>fkbshow</title>
  <base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/layer.js"></script> 
	<link rel="stylesheet" href="css/bootstrap.min.css">
  </head>
 
  <body>

<div class="pd-20">
        <table align="center" >	
            <tr>
            <td>所属父板块:${show.parentFlate.flateName}</td>
            </tr>
    	    <tr><td>板块名称:</td></tr>
    		<tr><td>${show.flateName}</td></tr>
    		<tr><td>板块图片:</td></tr>
    		<tr><td><img alt="${show.flateName}板块的图片" height="auto" width="100%" src="${show.imageUrl}"></td></tr>
    		<tr><td>板块说明:</td></tr>
    		<tr><td>${show.flateContent}</td></tr>
   	    	</table> 
     </div>   
  </body>
</html>

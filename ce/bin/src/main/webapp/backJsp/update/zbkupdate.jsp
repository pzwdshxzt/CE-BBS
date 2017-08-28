<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 
  <head>
    <title>fkbadd</title>
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
    <form action="zbkController.do?param=update" method="post" enctype="multipart/form-data">
            <table align="center" >	
    			<tr><td>板块名称:<input type="hidden" value="${show.flateId}" name="flate.flateId">
    			                <input type="hidden" value="${show.topicNum}" name="flate.topicNum">
    			                <input type="hidden" value="${show.lookNumber}" name="flate.lookNumber">
    			                <input type="hidden" value="${show.contentNumber}" name="flate.contentNumber">
    			                <input type="hidden" value="${show.imageUrl}" name="flate.imageUrl">
    			                <input type="hidden" value="${show.parentFlate.flateId}" name="parentFlate.flateId">
    			                
    							</td></tr>
    			<tr><td><input  class="form-control" type="text" name="flate.flateName" value="${show.flateName}"/></td></tr>
    			<tr><td>板块图片:</td></tr>
    			<tr><td><img alt="${show.flateName}板块的图片" height="auto" width="100%" src="${show.imageUrl}"></td></tr>
    			<tr><td>修改图片:</td></tr>
    			<tr><td><input  class="form-control" type="file" name="filePhoto" /></td></tr>
    			<tr><td>板块说明:</td></tr>
    			<tr><td><textarea rows="10px" cols="75px"  name="flate.flateContent"/>${show.flateContent}</textarea>
    				</td></tr>
    			<tr><td colspan="3" align="center"><input  type="submit" class="btn btn-info" value="更新" /></td></tr>
   	    	</table> 
        </form>
     </div>   
  </body>
</html>

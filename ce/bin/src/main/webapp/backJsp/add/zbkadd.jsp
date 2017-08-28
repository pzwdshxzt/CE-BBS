<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'employee_add.jsp' starting page</title>
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
    <form action="zbkController.do?param=add" method="post" enctype="multipart/form-data">
              <table align="center" ><caption>
    		<h2>子板块添加</h2>
           </caption>		
    			<tr>
    				<td>所属父板块</td>
    				<td>
    				<select	id="one"  name="parentFlate.flateId">
    				<option >选择父板块</option>
    				<c:forEach items="${addParentFlates}" var="pl">
    					<option value="${pl.flateId}">${pl.flateName}</option>
    				</c:forEach>
    				</select>
    				</td>
    			</tr>	
    			<tr>
    				<td>板块名称:</td>
    				<td><input  type="text" name="flate.flateName"/></td>
    			</tr>
    			<tr>
    				<td>板块图片:</td>
    				<td><input   type="file" name="filePhoto"/></td>
    			</tr>
    			<tr>
    				<td>板块说明:</td>
    				<td><textarea rows="20px" cols="50px"  name="flate.flateContent"/></textarea> </td>
    			</tr>
    			<tr>
    				<td  colspan="3 " align="center"><input  type="submit" class="btn btn-info" value="添加" /></td>
    			</tr>
    			
   	    	</table> 
   	    	
        </form>
     </div>   
  </body>
  
</html>

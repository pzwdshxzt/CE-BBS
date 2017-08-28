<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>会员管理</title>
	<base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script> 
    <link href="css/dashboard.css" rel="stylesheet">
 	<script type="text/javascript" src="js/layer.js"></script> 

  </head>
  
   <script type="text/javascript">
  			
  		function deleteEntity(id2){
  			layer.confirm('是否删除？', {
  		 	 btn: ['是','否'] //按钮
  			}, function(){
  		 	 $.ajax({
   				url:"userContrl.do?param=delete",
   				data:{"user.userId":id2},
   				type:"post",
   				async:true,
   				dataType:"json",
   				success:function(data){							
   				 if(data==1){
   					layer.msg('删除成功', {
   		  		   	 time: 2000, //2s后自动关闭
   		  		 	 });
   					document.location.reload();//当前
   				 }
   				 if(data==0){
   					 layer.msg('删除失败');
   				 }
   			   }
   		     })
  			}, function(){
  		 	 layer.msg('删除取消', {
  		   	 time: 2000, //2s后自动关闭
  		 	 });
  		  });
  		}
  </script>	
  <body>
  	 <h3>&nbsp;&nbsp;MEMBER Manage &nbsp;&nbsp;  
	  	 <a onclick="document.location.reload();"  class="btn btn-success">refresh</a>
  	 </h3>	
  	 <table class="table table-hover table-striped">
  	 	<tr align="center">
  	 	    <td>用户Id</td>
  	 		<td>用户名称</td>
  	 		<td>用户性别</td>
  	 		<td>用户生日</td>
  	 		<td>用户地址</td>
  	 		<td>操作</td>
  	 	</tr>
  	 	<c:forEach var="user" items="${users}">
    	<tr align="center">
    	<td>${user.userId}</td>
    	<td><mark>${user.userName}</mark></td>   
    	<c:if test="${user.sex == 0}">
    		<td>男</td>
    	</c:if>	
    	<c:if test="${user.sex == 1}">
    		<td>女</td>
    	</c:if>	
    	<c:if test="${user.sex == 2}">
    		<td>保密</td>
    	</c:if>	
    
    	<td><fmt:formatDate value="${user.birthDay}" type="date"/></td>
     	<td>${user.address}</td>
        <td><a id="${user.userId}" class="btn btn-danger" onclick="deleteEntity(this.id)">删除成员</a></td>
    	<tr>
        </c:forEach>
		
  	 	<tr align="center">
				<td colspan="8">
			
				</td>		
		</tr>
  	 </table>
  		
  	 	<nav aria-label="Page navigation " align="center">
  			<div class="message" >共<i class="blue">${pr.totalCount}</i>条记录，当前显示第&nbsp;<i class="blue">${pr.currentPage}&nbsp;</i>页,每页显示&nbsp;<i class="blue">${pr.pageSize}&nbsp;</i>条记录</div>
  			<ul class="pagination pagination-lg">
    			<c:if test="${pr.currentPage==1}">
    			<li class="disabled"><span aria-hidden="true">&laquo;</span></li>
    			</c:if>
    			<c:if test="${pr.currentPage >1 && pr.currentPage!=1 }">
    			<li class="active">
     				 <a href="userContrl.do?param=trunPag&pr.currentPage=${pr.currentPage-1}" aria-label="Previous">
       				 <span aria-hidden="true">&laquo;</span>
     				 </a>
    			</li>
    			</c:if>
   				 <li class="disabled"><a>${pr.currentPage}</a></li>
   				 <c:if test="${pr.currentPage+1 < pr.totalPage}">
   				 <li><a href="userContrl.do?param=trunPag&pr.currentPage=${pr.currentPage+1}">${pr.currentPage+1}</a></li>
   				   <li><a href="javascript:;">...</a></li>
   				  </c:if>
   				  <c:if test="${pr.currentPage != pr.totalPage}">
    			   <li><a href="userContrl.do?param=trunPag&pr.currentPage=${pr.totalPage}">${pr.totalPage}</a></li>
   				 
    			  </c:if>
    			  <c:if test="${pr.currentPage<pr.totalPage}">
   				 <li>
     			 <a href="userContrl.do?param=trunPag&pr.currentPage=${pr.currentPage+1}" aria-label="Next">
       			 <span aria-hidden="true">&raquo;</span>
     			 </a>
   				 </li>
   				 </c:if>
   				  <c:if test="${pr.currentPage>=pr.totalPage}">
   				   <li class="disabled"> <span aria-hidden="true">&raquo;</span></li>
   				  </c:if>
 			</ul>
		</nav> 
  </body>
  
  		
</html>

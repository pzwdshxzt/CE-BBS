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
    <title>管理员管理</title>
	<base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link href="css/dashboard.css" rel="stylesheet">
	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script> 
 	<script type="text/javascript" src="js/layer.js"></script> 
 	<script type="text/javascript" src="js/admin.js"></script>

  </head>
  
  <body>
  	 <h3>&nbsp;&nbsp;Admin Manage &nbsp;&nbsp;  
  	 	 <!-- Button trigger modal -->
		 <button type="button" class="btn btn-success" data-toggle="modal" data-target="#addAdmin">
		   add Admin
		 </button>
	  	 <a onclick="document.location.reload();"  class="btn btn-success">refresh</a>
  	 </h3>	
  	 <table class="table table-hover table-striped">
  	 	<tr align="center">
  	 	    <td>Id</td>
  	 		<td>账户</td>
  	 		<td>角色</td>
  	 		<td>操作</td>
  	 	</tr>
  	 	<c:forEach var="admin" items="${admins}">
	    	<tr align="center">
	    	<td>${admin.adminId}</td>
	    	<td><mark>${admin.username}</mark></td>
    	<c:if test="${admin.authority == 0}">
    		<td>初级管理员</td>
    	</c:if>
    	<c:if test="${admin.authority == 1}">
    		<td>中级管理员</td>
    	</c:if>
    	<c:if test="${admin.authority == 2}">
    		<td>高级管理员</td>
    	</c:if>
	      <td>
	        <c:if test="${sessionScope.adminKey.username == admin.username || admin.authority == 2 || admin.username=='ce' }">
	         <a id="${admin.adminId}" class="btn btn-danger" disabled="disabled">不可操作</a>&nbsp;
	        </c:if>	
	        <c:if test="${(admin.authority < 2 && sessionScope.adminKey.username != admin.username) && admin.username!='ce' || sessionScope.adminKey.username=='ce'}">
		        <c:if test="${admin.authority == 0 || admin.authority == 1 }">
		         <a id="${admin.adminId}" class="btn btn-success" href="javascript:void;" onclick="upgradeEntity(this.id)">升级</a>
		        </c:if>
		        <c:if test="${admin.authority == 1 || ( admin.authority == 2 && !(sessionScope.adminKey.username=='ce'))}">
		         <a id="${admin.adminId}" class="btn btn-info" href="javascript:void;" onclick="degradeEntity(this.id)">降级</a>
		        </c:if>
	            <c:if test="${sessionScope.adminKey.username != admin.username  }">
	             <a id="${admin.adminId}" class="btn btn-danger" href="javascript:void;" onclick="deleteEntity(this.id)">删除</a>
	            </c:if>	
            </c:if>
	      </td>
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
     				 <a href="adminContrl.do?param=trunPag&pr.currentPage=${pr.currentPage-1}" aria-label="Previous">
       				 <span aria-hidden="true">&laquo;</span>
     				 </a>
    			</li>
    			</c:if>
   				 <li class="disabled"><a>${pr.currentPage}</a></li>
   				 <c:if test="${pr.currentPage+1 < pr.totalPage}">
   				 <li><a href="adminContrl.do?param=trunPag&pr.currentPage=${pr.currentPage+1}">${pr.currentPage+1}</a></li>
   				   <li><a href="javascript:;">...</a></li>
   				  </c:if>
   				  <c:if test="${pr.currentPage != pr.totalPage}">
    			   <li><a href="adminContrl.do?param=trunPag&pr.currentPage=${pr.totalPage}">${pr.totalPage}</a></li>
   				 
    			  </c:if>
    			  <c:if test="${pr.currentPage<pr.totalPage}">
   				 <li>
     			 <a href="adminContrl.do?param=trunPag&pr.currentPage=${pr.currentPage+1}" aria-label="Next">
       			 <span aria-hidden="true">&raquo;</span>
     			 </a>
   				 </li>
   				 </c:if>
   				  <c:if test="${pr.currentPage>=pr.totalPage}">
   				   <li class="disabled"> <span aria-hidden="true">&raquo;</span></li>
   				  </c:if>
 			</ul>
		</nav> 
		
		
		<!-- Modal -->
		<div class="modal fade" id="addAdmin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">添加管理员</h4>
		      </div>
		      <div class="modal-body">
		        <h2>管理员添加</h2>
	          		<div class="form-group">
					    <label for="username">username</label>
					    <input id="adminname" type="text" name="admin.username" class="form-control"  placeholder="username">
					</div>
					<div class="form-group">
					    <label for="password">password</label>
					    <input id="adminpass" type="password" name="admin.password" class="form-control"  placeholder="password">
					</div>
					<div class="form-group">	
					    <label for="againx">again password</label>
					    <input id="againx" type="password"  class="form-control"  placeholder="again password">
					</div>
    			    <a id="add"  class="btn btn-success">Add</a>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		
  </body>
  
  		
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>话题板块</title>
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
 	<script type="text/javascript" src="js/back.js"></script> 

  </head>
  
 
  <body>
  	 <h3>&nbsp;&nbsp;Find Manage &nbsp;&nbsp;</h3>	
  	<form class="form-inline" action="fxglController.do?param=seach" method="post">
    	<input type="text" name="seach" class="form-control"  placeholder="标题/内容">
  		<button type="submit" class="btn btn-success">seach</button>
  		<a onclick="document.location.reload();"  class="btn btn-success">refresh</a>
	</form>
		
  	 <table class="table table-hover table-striped">
  	 	<tr align="center">
  	 		<td>所属板块</td>
  	 		<td>话题名称</td>
  	 		<td>创建人</td>
  	 		<td>话题关注数量</td>
  	 		<td>话题回复数量</td>
  	 		<td>状态</td>
  	 		<td>操作</td>
  	 	</tr>
  	 	<c:forEach var="ht" items="${topics}">
    	<tr align="center">
    	<td><a id="${ht.fid}bk" onmouseover="wacthFlate(${ht.fid})">${ht.fid}</a></td>
     	
    	<td>
    	<button type="button" onclick="show(${ht.topicId})" class="btn btn-primary"  >
  			${ht.title}
	    </button>
    	</td> 
    	<td><a id="${ht.uid}user" onmouseover="wacthUser(${ht.uid})">${ht.uid}</a></td>      	
    	<td>${ht.fousNumber}</td>
    	<td>${ht.replyNumber}</td>
    	<td>
    		<c:if test="${ht.state == 0}">正常</c:if>
    		<c:if test="${ht.state == 1}">置顶</c:if>
    	</td>
        <td>
       		<c:if test="${ht.state == 0}">  <a class="btn btn-warning" onclick="changeStick(${ht.topicId},${ht.state})">置顶</a>&nbsp;</c:if>
      		<c:if test="${ht.state == 1}">  <a class="btn btn-warning" onclick="changeStick(${ht.topicId},${ht.state})">取消置顶</a>&nbsp;</c:if>
			<c:if test="${ht.findFlag == 0}">  <a class="btn btn-warning" onclick="changeFlag(${ht.topicId},${ht.findFlag})">加到发现</a></c:if>
      		<c:if test="${ht.findFlag == 1}">  <a class="btn btn-warning" onclick="changeFlag(${ht.topicId},${ht.findFlag})">移除发现</a></c:if>
			  								<a class="btn btn-danger" onclick="deleteEntity(${ht.topicId})">删除</a>
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
    			<li class="disabled">
     				 <a>
       				 <span aria-hidden="true">&laquo;</span>
     				 </a>
    			</li>
    			</c:if>
    			<c:if test="${pr.currentPage >1 && pr.currentPage!=1 }">
    			<li class="active">
     				 <a href="fxglController.do?param=trunPag&pr.currentPage=${pr.currentPage-1}" aria-label="Previous">
       				 <span aria-hidden="true">&laquo;</span>
     				 </a>
    			</li>
    			</c:if>
   				 <li class="disabled"><a>${pr.currentPage}</a></li>
   				 <c:if test="${pr.currentPage+1 < pr.totalPage}">
   				 <li><a href="fxglController.do?param=trunPag&pr.currentPage=${pr.currentPage+1}">${pr.currentPage+1}</a></li>
   				   <li><a href="javascript:;">...</a></li>
   				  </c:if>
   				  <c:if test="${pr.currentPage != pr.totalPage}">
    			   <li><a href="fxglController.do?param=trunPag&pr.currentPage=${pr.totalPage}">${pr.totalPage}</a></li>
   				 
    			  </c:if>
    			  <c:if test="${pr.currentPage<pr.totalPage}">
   				 <li>
     			 <a href="fxglController.do?param=trunPag&pr.currentPage=${pr.currentPage+1}" aria-label="Next">
       			 <span aria-hidden="true">&raquo;</span>
     			 </a>
   				 </li>
   				 </c:if>
   				  <c:if test="${pr.currentPage>=pr.totalPage}">
   				   <li class="disabled">
     			 <a aria-label="Next">
       			 <span aria-hidden="true">&raquo;</span>
     			 </a>
   				 </li>
   				  </c:if>
 			</ul>
		</nav> 
		
		<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title" id="myModalLabel">
        	暂无标题！
        </h3>
      	</div>
      	<div  id="mybody" class="modal-body">
      		暂无信息！
      	</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
  </body>
  
  		
</html>

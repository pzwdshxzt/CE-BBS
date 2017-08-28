<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理界面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="icon" href="img/ce.png">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script> 
    <link href="css/dashboard.css" rel="stylesheet">
  </head>
  <body>
 	<!-- 页面上导航 -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">众人齐心 · 其利断金</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">${sessionScope.adminKey.username}</a></li>
            <li><a href="http://localhost:8080/biyesheji/backJsp/admin.jsp">退出</a></li>
          </ul>
         <!-- <form class="navbar-form navbar-right">
              <input type="text" class="form-control" placeholder="Search...">
              </form>  搜索功能
           --> 
        </div>
      </div>
    </nav>
	
	<!--页面下  -->
    <div class="container-fluid">
      <div class="row"> <!-- 页面分块 -->
        <!-- 左边导航 begin-->
        <div class="col-sm-3 col-md-2 sidebar">    <!-- 左边导航栅栏分 -->    
        <ul class="nav nav-pills nav-stacked"  role="tablist" id="myTab">
            <li class="active"><a href="#fx"  data-toggle="tab" >发现</a></li>
            <li><a href="#htgl"  data-toggle="tab" >话题管理</a></li>
            <li><a href="#hfgl"  data-toggle="tab" >回复管理</a></li>
            <li><a href="#fbk"   data-toggle="tab" >父板块管理</a></li>
            <li><a href="#zbk"   data-toggle="tab">子板块管理</a></li>
		</ul> 
        </div>  <!-- 左边导航 end-->
     
     	<!-- 右边内容显示 -->
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
       	 <div  id="myTabContent" class="tab-content" >
			<!-- 父板块 -->
		     <div role="tabpanel" class="tab-pane fade in active" id="fx">
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
		     				 <a href="htglController.do?param=trunPag&pr.currentPage=${pr.currentPage-1}" aria-label="Previous">
		       				 <span aria-hidden="true">&laquo;</span>
		     				 </a>
		    			</li>
		    			</c:if>
		   				 <li class="disabled"><a>${pr.currentPage}</a></li>
		   				 <c:if test="${pr.currentPage+1 < pr.totalPage}">
		   				 <li><a href="htglController.do?param=trunPag&pr.currentPage=${pr.currentPage+1}">${pr.currentPage+1}</a></li>
		   				   <li><a href="javascript:;">...</a></li>
		   				  </c:if>
		   				  <c:if test="${pr.currentPage != pr.totalPage}">
		    			   <li><a href="htglController.do?param=trunPag&pr.currentPage=${pr.totalPage}">${pr.totalPage}</a></li>
		   				 
		    			  </c:if>
		    			  <c:if test="${pr.currentPage<pr.totalPage}">
		   				 <li>
		     			 <a href="htglController.do?param=trunPag&pr.currentPage=${pr.currentPage+1}" aria-label="Next">
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
             </div>
             
			<!-- 父板块 -->
		     <div role="tabpanel" class="tab-pane fade in active" id="fbk">
		    	 <iframe src="backJsp/onload/fbk.jsp"   frameBorder=0 scrolling=no width="100%" height="100% ">
		   	 </iframe> 
             </div>
     		
     		 <!--  子版块-->
     		 <div role="tabpanel" class="tab-pane fade" id="zbk">
     		 <iframe src="backJsp/onload/zbk.jsp"  frameBorder=0 scrolling=no width="100%" height="100% "   >
		   	 </iframe> 
  	         </div>
  	  
  	    	 <!-- 话题管理 标签页 -->
  	   		 <div role="tabpanel" class="tab-pane fade" id="htgl">
  	 		 <iframe src="backJsp/onload/htgl.jsp" frameBorder=0 scrolling=no width="100%" height="100%"  ></iframe> 
  			 </div>  <!-- 员工管理结束 -->  
  	
  	    	 <!-- 员工请假单管理 标签页 -->
  	    	 <div role="tabpanel" class="tab-pane fade" id="hfgl">
  	         <iframe src="backJsp/onload/hfgl.jsp"  frameBorder=0 scrolling=no width="100%" height="100% "   >
		   	 </iframe> 
             </div> <!-- 员工请假单结束 -->
        
          </div> <!-- 一级导航内容结束 tab content end -->
        </div>  <!-- 右边内容 end -->
      </div>
    </div>
  </body>
</html>

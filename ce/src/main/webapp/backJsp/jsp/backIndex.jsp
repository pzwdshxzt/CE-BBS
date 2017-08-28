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
	<script type="text/javascript" src="js/layer.js"></script>
	<script type="text/javascript">
	function exitSys(){
		$.post("adminExitCe.do", function(data) {
			 layer.msg('再见 ， '+data);
			 window.location.href="backJsp/admin.jsp";
			});
	}</script>
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
            <li><a href="javascript:;" onclick="exitSys()">退出</a></li>
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
	            <li  class="active"><a href="#hfgl"  data-toggle="tab" >回复管理</a></li>
	            <li><a href="#htgl"  data-toggle="tab" >话题管理</a></li>
            <c:if test="${sessionScope.adminKey.authority ==  1 || sessionScope.adminKey.authority ==  2}">
	            <li><a href="#fx"  data-toggle="tab" >发现管理</a></li>
	            <li><a href="#zbk"   data-toggle="tab" >板块管理</a></li>
	            <li><a href="#hygl"   data-toggle="tab" >会员管理</a></li>
	            <li><a href="#adminlog"   data-toggle="tab" >查看日志</a></li>
            </c:if>
            <c:if test="${sessionScope.adminKey.authority ==  2 }">
           		<li><a href="#glygl"   data-toggle="tab" >管理员管理</a></li>
            </c:if>
		</ul> 
        </div>  <!-- 左边导航 end-->
     
     	<!-- 右边内容显示 -->
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
       	 <div  id="myTabContent" class="tab-content" >
             
     		 <!-- 回复管理 标签页 -->
  	    	 <div role="tabpanel" class="tab-pane fade  in active" id="hfgl">
  	         	<iframe src="backJsp/onload/hfgl.jsp"  frameBorder=0 scrolling=no width="100%" height="100% " ></iframe> 
             </div> 
             <!-- 回复结束 -->
             
  	    	 <!-- 话题管理 标签页 -->
  	   		 <div role="tabpanel" class="tab-pane fade" id="htgl">
  	 		 	<iframe src="backJsp/onload/htgl.jsp" frameBorder=0 scrolling=no width="100%" height="100%" ></iframe> 
  			 </div>  
  			 <!-- 话题管理结束 --> 
              <c:if test="${sessionScope.adminKey.authority == 2 ||sessionScope.adminKey.authority == 1 }">
     		 <!--  版块管理-->
     		 <div role="tabpanel" class="tab-pane fade" id="zbk">
     			 <iframe src="backJsp/onload/zbk.jsp"  frameBorder=0 scrolling=no width="100%" height="100% " ></iframe> 
  	         </div>
  	         
  	          <!-- 发现板块 -->
		     <div role="tabpanel" class="tab-pane fade" id="fx">
		   		<iframe src="backJsp/onload/fxgl.jsp"   frameBorder=0 scrolling=no width="100%" height="100% "></iframe> 
             </div>
       
  	         <!--  会员版块-->
     		 <div role="tabpanel" class="tab-pane fade" id="hygl">
     			 <iframe src="backJsp/onload/hygl.jsp"  frameBorder=0 scrolling=no width="100%" height="100% " ></iframe> 
  	         </div>
  	         
  	          <!--  日志版块-->
     		 <div role="tabpanel" class="tab-pane fade" id="adminlog">
     			 <iframe src="backJsp/onload/adminLog.jsp"  frameBorder=0 scrolling=no width="100%" height="100% " ></iframe> 
  	         </div>
  			  </c:if>
  			 <c:if test="${sessionScope.adminKey.authority == 2 }">
  			  <!-- 管理员管理 标签页 -->
  	   		 <div role="tabpanel" class="tab-pane fade" id="glygl">
  	 		 	<iframe src="backJsp/onload/glygl.jsp" frameBorder=0 scrolling=no width="100%" height="100%" ></iframe> 
  			 </div>  <!--  管理员管理结束 -->   
  			 </c:if>
  	    	
             
          </div> <!-- 一级导航内容结束 tab content end -->
        </div>  <!-- 右边内容 end -->
      </div>
    </div>
  </body>
</html>

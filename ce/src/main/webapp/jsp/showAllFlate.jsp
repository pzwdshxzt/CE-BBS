<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%> 
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta content="text/html;charset=utf-8" http-equiv="Content-Type" />
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta name="renderer" content="webkit" />
<meta name="keywords" content="CE,论坛"> 
<meta name="description" content="这是一个新的论坛，希望大家支持下！">
<meta name="author" content="hjx">
<title>板块广场 --CE</title>
<link href="img/ce.png" rel="shortcut icon" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link href="css/bootstrap.min.css" rel="stylesheet">	
<script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>
<script src="js/layer.js" type="text/javascript"></script>
<script type="text/javascript" src="js/login.js"></script>
<link href="css/default.css" rel="stylesheet" type="text/css" />
<link href="css/defaultlink.css" rel="stylesheet" type="text/css" />

</head>
<noscript unselectable="on" id="noscript">
    <div class="aw-404 aw-404-wrap container">
        <img src="http://wenda.bootcss.com/static/common/no-js.jpg">
        <p>你的浏览器禁用了JavaScript, 请开启后刷新浏览器获得更好的体验!</p>
    </div>
</noscript>

<body>
<div class="navbar-wrapper">
      <div class="container">
        <nav class="navbar navbar-default  navbar-fixed-top" role="navigation">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" >CE</a>
            </div>
             
            <div id="navbar" class="navbar-collapse collapse">
           		 <ul class="nav navbar-nav navbar-left">
		            	<li><a href="onload.do">首页</a></li>
		                <li><a href="bkController.do?param=onload">板块</a></li>
		                <li><a href="http://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&email=h_TiquXl9Mf29qnk6Oo" >联系我们</a></li>
			     </ul>
              <ul class="nav navbar-nav navbar-right">
                <li class="dropdown" >
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <img src="${sessionScope.personMessage.imageUrl}" width="20" height="20" class="img-circle" alt="Generic placeholder thumbnail"></a>
                  <ul  class="dropdown-menu" role="menu">
                  <li><a href="user.do">个人信息</a></li>
                  <li><a href="fous.do">关注信息</a></li>
                  <li><a href="javascript:;" onclick="exitSys()">exit</a></li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </nav>
      </div>
    </div>
<div id="logincontroller">
	<nav  class="navbar navbar-default navbar-fixed-bottom" role="navigation">
  <div class="container">
   <div id="login" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right" role="form">
            <div class="form-group">
              <input id="email" type="text" placeholder="Email" class="form-control">
            </div>
            <div class="form-group">
              <input id="password" type="password" placeholder="Password" class="form-control">
            </div>
            <a href="javascript:;"  onclick="loginSys()"  class="btn btn-success">Sign in</a>
            <a href="javascript:; " onclick="window.location.href='login.jsp';"  class="btn btn-success">Register</a>
          </form>
        </div><!--/.navbar-collapse -->
  </div>
</nav>

</div>

<div class="container">
</div>
	
	<div class="aw-container-wrap">
	    <div class="container">&nbsp;
	        <div class="row">
	            <div class="aw-content-wrap clearfix">
	                <div class="col-sm-12 col-md-9 aw-main-content">
	                    <!-- tab切换 -->
	                    <ul class="nav nav-tabs aw-nav-tabs active hidden-xs">
	                        <li class="active"><a onclick="javascript:void();">全部</a></li>
	                        <h2 class="hidden-xs"><i class="icon icon-topic"></i>全部板块</h2>
	                    </ul>
	                    <!-- end tab切换 -->
	
	                    <!-- 板块 -->
	                    <div class="aw-mod aw-topic-list">
	                       <div class="mod-body clearfix">
							<c:forEach var="flate" items="${flates}">                      
		                        <div class="aw-item">
			                        <div>
			                        	 <!-- 话题图片 -->
			                        	 <a class="img aw-border-radius-5" href="bkController.do?param=show&flate.flateId=${flate.flateId}" data-id="5">
			                       		 <img width="80px" height="80px" src="${flate.imageUrl}" alt="${flate.flateName}" /> </a>
			                             <!-- end 话题图片 -->
			                        </div>
			                        <div style="margin-left:40px ">
			                             <p class="clearfix">
			                             <!-- 话题内容 -->
			                      	     <span class="topic-tag" data-id="5">
			                       		 <a class="text" href="bkController.do?param=show&flate.flateId=${flate.flateId}">${flate.flateName}</a>
			                      	     </span>
			                     	     <!-- end 话题内容 -->
			                     	     </p>
			                     	     <p class="text-color-999">
			                     	     <span>${flate.topicNumber}个话题</span>
			                             </p>
			                             <p class="text-color-999">
			                       		 <span>${flate.fousNumber}个关注</span>
			                             </p>
			                        </div>
		                        </div>
		                      </c:forEach>
	                        </div>
	                       	 
	                    </div>
	                    <!-- end 板块 -->、
	                </div>
	                <!-- 侧边栏 -->
	                <div class="col-sm-3 col-md-3 aw-side-bar hidden-sm hidden-xs">
	                    <!-- 新增板块 -->
	                    <div class="aw-mod new-topic">
	                        <div class="mod-head">
	                            <h3>热门板块</h3>
	                        </div>
	                        <div class="mod-body clearfix">
	                            <div class="aw-topic-bar">
	                                   <c:forEach items="${newflates}" var="flate">
	                                   <div class="mod-body">
											<dl>
												<dt class="pull-left aw-border-radius-5">
												<a href="bkController.do?param=show&flate.flateId=${flate.flateId}"><img alt="${flate.flateName}" src="${flate.imageUrl}" /></a>
												</dt>
												<dd class="pull-left">
													<a href="bkController.do?param=show&flate.flateId=${flate.flateId}" data-id="3356" class="aw-user-name">${flate.flateName}</a>
													<p class="signature"></p>
													<p><b>${flate.topicNumber}</b> 个话题, <b>${flate.fousNumber}</b>个关注</p>
												</dd>
											</dl>
										</div> 
	                                  </c:forEach>
	                            </div>
	                        </div>
	                    </div>
	                    <!-- end 新增话题 -->
	                                    </div>
	                <!-- end 侧边栏 -->
	            </div>
	        </div>
	    </div>
	</div>

<script type="text/javascript" src="js/footer.js"></script>
<a class="aw-back-top hidden-xs" href="javascript:;" onclick="$.scrollTo(1, 600, {queue:true});"><i class="icon icon-up"></i></a>
 	<script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/docs.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
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
<title>板块广场 --CE</title>
<meta name="keywords" content="bootstrap,html,css,javascript,前端" />
<meta name="description" content="Bootstrap是Twitter推出的一个用于前端开发的开源工具包。它由Twitter的设计师Mark Otto和Jacob Thornton合作开发，是一个CSS/HTML框架。目前，Bootstrap最新版本为3.0 。Bootstrap中文网致力于为广大国内开发者提供详尽的中文文档、代码实例等，助力开发者掌握并使用这一框架。"  />
<base href="http://wenda.bootcss.com/" /><!--[if IE]></base><![endif]-->
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
              <a class="navbar-brand" href="#">CE</a>
            </div>
             
            <div id="navbar" class="navbar-collapse collapse">
           		 <ul class="nav navbar-nav navbar-left">
		            	<li><a href="#">首页</a></li>
		                <li><a href="jsp/showAllFlate.jsp">板块</a></li>
		                <li><a href="#contact">联系我们</a></li>
             	</ul>
              <ul class="nav navbar-nav navbar-right">
                <li class="dropdown" >
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <img src="img/1.jpg" width="20" height="20" class="img-circle" alt="Generic placeholder thumbnail"></a>
                  <ul  class="dropdown-menu" role="menu">
                  <li><a href="#">个人信息</a></li>
                  <li><a id="exitSys" onclick="exitSys()">exit</a></li>
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
            <a onclick="loginSys()"  class="btn btn-success">Sign in</a>
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
	                        <li ><a href="#">7天内</a></li>
	                        <li class="active"><a href="http://wenda.bootcss.com/topic/channel-topic">全部</a></li>
	                        <h2 class="hidden-xs"><i class="icon icon-topic"></i> 热门板块</h2>
	                    </ul>
	                    <!-- end tab切换 -->
	
	                    <!-- 板块 -->
	                    <div class="aw-mod aw-topic-list">
	                       <div class="mod-body clearfix">
							<c:forEach var="flate" items="${flates}">                      
		                        <div class="aw-item">
			                         <!-- 话题图片 -->
			                       	<a class="img aw-border-radius-5" href="#" data-id="5">
			                        <img width="50px" height="50px" src="${flate.imageUrl}" alt="${flate.flateName}" /> </a>
			                        <!-- end 话题图片 -->
			                        <p class="clearfix">
			                        <!-- 话题内容 -->
			                        <span class="topic-tag" data-id="5">
			                        <a class="text" href="bkController.do?param=show&flate.flateId=${flate.flateId}">${flate.flateName}</a></span>
			                        <!-- end 话题内容 -->
			                        </p>
			                                
			                        <p class="text-color-999">
			                        <span>${fn:length(flate.lookUsers)} 个关注</span>
			                        </p>
		                        </div>
		                      </c:forEach>
	                        </div>
	                       	 
	                        <div class="mod-footer clearfix">
	                            <div class="page-control"><ul class="pagination pull-right"><li class="active"><a href="javascript:;">1</a></li><li><a href="http://wenda.bootcss.com/topic/page-2">2</a></li><li><a href="http://wenda.bootcss.com/topic/page-3">3</a></li><li><a href="http://wenda.bootcss.com/topic/page-4">4</a></li><li><a href="http://wenda.bootcss.com/topic/page-2">&gt;</a></li><li><a href="http://wenda.bootcss.com/topic/page-26">&gt;&gt;</a></li></ul></div>                        </div>
	                    </div>
	                    <!-- end 板块 -->、
	                </div>
	                <!-- 侧边栏 -->
	                <div class="col-sm-3 col-md-3 aw-side-bar hidden-sm hidden-xs">
	                    <!-- 新增板块 -->
	                    <div class="aw-mod new-topic">
	                        <div class="mod-head">
	                            <h3>新增板块</h3>
	                        </div>
	                        <div class="mod-body clearfix">
	                            <div class="aw-topic-bar">
	                                <div class="topic-bar clearfix">
	                                        <span class="topic-tag" data-id="1008">
	                                        <a class="text" href="#">美女</a>
	                                    </span>
	                                 </div>
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



		<footer class="footer ">
		  <div class="container">
		    <div class="row footer-top">
		      <div class="col-sm-6 col-lg-6">
		        <h4>
		          <img width="auto" height="50px" src="img/ce1.png">
		        </h4>
		        <p>这是我的毕业设计，思路来自于Boostrap问答社区！</p>
		      </div>
		      <div class="col-sm-6  col-lg-5 col-lg-offset-1">
		        <div class="row about">
		          <div class="col-xs-4">
		            <h4>关于</h4>
		            <ul class="list-unstyled">
		              <li><a href="#" target="_blank">关于我们</a></li>
		              <li><a href="#" target="_blank">广告合作</a></li>
		              <li><a href="#" target="_blank">友情链接</a></li>
		            </ul>
		          </div>
		          <div class="col-xs-4">
		            <h4>联系方式</h4>
		            <ul class="list-unstyled">
		              <li><a href="#" title="CE官方微博" target="_blank">新浪微博</a></li>
		              <li><a href="mailto:83265414@qq.com">电子邮件</a></li>
		            </ul>
		          </div>
		          <div class="col-xs-4">
		            <h4>友情链接</h4>
		            <ul class="list-unstyled">
		              <li><a href="#" target="_blank">Laravel中文网</a></li>
		              <li><a href="#" target="_blank">Ghost中国</a></li>
		            </ul>
		          </div>
		        </div>
		
		      </div>
		    </div>
		
		    <div class="row footer-bottom">
		      <ul class="list-inline text-center">
		        <li><a href="#" target="_blank">京ICP备########号</a></li><li>京公网安备###########</li>
		      </ul>
		    </div>
		  </div>
		</footer>


<a class="aw-back-top hidden-xs" href="javascript:;" onclick="$.scrollTo(1, 600, {queue:true});"><i class="icon icon-up"></i></a>
 	<script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/docs.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
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
<title>${sessionScope.personMessage.userBase.userName}个人主页 - CE-BBS</title>
<meta name="keywords" content="bootstrap,html,css,javascript,前端" />
<link rel="icon" href="img/ce.png">
<meta name="description" content="Bootstrap是Twitter推出的一个用于前端开发的开源工具包。它由Twitter的设计师Mark Otto和Jacob Thornton合作开发，是一个CSS/HTML框架。目前，Bootstrap最新版本为3.0 。Bootstrap中文网致力于为广大国内开发者提供详尽的中文文档、代码实例等，助力开发者掌握并使用这一框架。"  />
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>
<script src="js/layer.js" type="text/javascript"></script>
<script type="text/javascript" src="js/login.js"></script>
<!--[if lte IE 8]>
	<script type="text/javascript" src="http://wenda.bootcss.com/static/js/respond.js"></script>
<![endif]-->
</head>
<noscript unselectable="on" id="noscript">
    <div class="aw-404 aw-404-wrap container">
        <img src="http://wenda.bootcss.com/static/common/no-js.jpg">
        <p>你的浏览器禁用了JavaScript, 请开启后刷新浏览器获得更好的体验!</p>
    </div>
</noscript>
<body>
	<div class="page-header">
</div>
	
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
					                <li><a href="bkController.do?param=onload">板块</a></li>
					                <li><a href="#contact">联系我们</a></li>
			             	 </ul>
				             <ul class="nav navbar-nav navbar-right">
					                <li class="dropdown" >
					                 	  <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <img src="img/1.jpg" width="20" height="20" class="img-circle" alt="Generic placeholder thumbnail"></a>
						                  <ul  class="dropdown-menu" role="menu">
						                  <li><a href="jsp/User.jsp">个人信息</a></li>
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
		        </div>
		  </div>
	</nav>
</div>

	<div class="aw-container-wrap">
	    <div class="container">
	        <div class="row">
            <!-- 左边 -->
            	<div class="aw-content-wrap clearfix">
               		<div class="col-sm-12 col-md-9 aw-main-content">
	                    <!-- 用户数据内容 -->
	                    <div class="aw-mod aw-user-detail-box">
	                        <div class="mod-head">
	                            <img src="#" alt="${sessionScope.personMessage.userBase.userName}" />
	                            <span class="pull-right operate"></span>
	                            <h1>${sessionScope.personMessage.userBase.userName}</h1>
	                            <p class="text-color-999"></p>
	                            <p class="aw-user-flag">
	                        </div>
	                        <div class="mod-footer">
	                            <ul class="nav nav-tabs aw-nav-tabs hidden-xs">
	                                <li class="active"><a href="#topic" id="page_articles" data-toggle="tab">话题</a></li>
	                                <li><a href="#detail" id="page_detail" data-toggle="tab">详细资料</a></li>
	                            </ul>
	                        </div>
	                    </div>
	                    <!-- end 用户数据内容 -->

	                    <div class="aw-user-center-tab">
	                        <div class="tab-content">
	                            <div  class="tab-pane  active" id="topic">
	                                <!-- 话题 -->
	                                <div class="aw-mod">
	                                    <div class="mod-head">
	                                        <h3>话题</h3>
	                                    </div>
	                                    <div class="mod-body">
	                                        <div class="aw-profile-publish-list">
	                                            <c:forEach items="${sessionScope.personMessage.topics}" var="topic">
	                                                <div class="aw-item">
	                                                    <div class="mod-head">
	                                                        <h4><a href="topicController.do?param=getTopic&topic.topicId=${topic.topicId}">${topic.title}</a></h4>
	                                                    </div>
	                                                    <div class="mod-body">
	                                                        <p class="aw-hide-txt"> ${fn:length(topic.replys)} 个回复 &nbsp;• ${fn:length(topic.lookUsers)} 个关注 &nbsp; • ${topic.createTime}</p>
	                                                    </div>
	                                                </div>
	                                            </c:forEach>                                                                                        
	                                         </div>
	                                    </div>
	                                </div>
	                                <!-- end 话题 -->
	                            </div>
	                         
	                            <div class="tab-pane" id="detail">
			                               <span>hhhhhhhhhhhh</span>
	                            </div>
	                         </div>
	                    </div>
                        <!-- 话题和个人信息结束 -->
                        
                    </div>
                </div>
					<!--左边结束 -->
					
	                <!-- 侧边栏 -->
	            <div class="col-sm-12 col-md-3 aw-side-bar">
	              <div class="aw-mod people-following">
                       <div class="mod-body">关注 <em class="aw-text-color-blue">${fn:length(sessionScope.personMessage.lookTopics)}</em>话题
                   	</div>
                  </div>
                  <div class="aw-mod">
                       <div class="mod-body">
                           <span class="aw-text-color-666">
                             	主页访问量 : ${sessionScope.personMessage.userBase.lookNumber}次访问 
                           </span>
                       </div>
                  </div>
	            </div>
	                <!-- end 侧边栏 -->
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


</body>
</html>
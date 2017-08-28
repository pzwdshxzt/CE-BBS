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
	<title>${flate.flateName} - CE-BBS</title>
	<meta name="keywords" content="bootstrap,html,css,javascript,前端" />
	<meta name="description" content="Bootstrap是Twitter推出的一个用于前端开发的开源工具包。它由Twitter的设计师Mark Otto和Jacob Thornton合作开发，是一个CSS/HTML框架。目前，Bootstrap最新版本为3.0 。Bootstrap中文网致力于为广大国内开发者提供详尽的中文文档、代码实例等，助力开发者掌握并使用这一框架。"  />
	<base href="http://wenda.bootcss.com/" /><!--[if IE]></base><![endif]-->
	<link rel="icon" href="img/ce.png">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
	<link href="css/default.css" rel="stylesheet" type="text/css" />
	<link href="css/defaultlink.css" rel="stylesheet" type="text/css" />
	<link href="css/style.css" rel="stylesheet" type="text/css" />
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


<div class="aw-container-wrap">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="aw-global-tips">
									</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="aw-content-wrap clearfix">
				<div class="col-sm-12 col-md-9 aw-main-content">
					<div class="aw-mod aw-topic-detail-title">
						<div class="mod-body">
							<img width="60px" height="60px" src="${flate.imageUrl}" alt="bootstrap" />
							<h2 class="pull-left">${flate.flateName}</h2>
							<div class="aw-topic-operate text-color-999">
															</div>
						</div>
					</div>

					<div class="aw-mod aw-topic-list-mod">
						<div class="mod-head">
							<div class="tabbable">
								<!-- tab 切换 -->
								<ul class="nav nav-tabs aw-nav-tabs hidden-xs">
									<li class="active"><a href="#all" data-toggle="tab">全部内容</a></li>
									<li><a href="#best_answers" data-toggle="tab">精华</a></li>
									<div class="aw-search-bar pull-right hidden-xs">
										<i class="icon icon-search"></i>
										<input type="text" id="question-input" class="search-query form-control" placeholder="搜索...">
										<div class="aw-dropdown">
											<p class="title">没有找到相关结果</p>
											<ul class="aw-dropdown-list"></ul>
										</div>
									</div>
								</ul>
								<!-- end tab 切换 -->
							</div>
						</div>

		<div class="mod-body">
			<!-- tab 切换内容 -->
				<div class="tab-content">
					<div class="tab-pane active" id="all">
						<div class="aw-mod">
							<div class="mod-body">
								<div class="aw-common-list" id="c_all_list">
									<c:forEach var="topic" items="${topics}">
									<div class="aw-item " data-topic-id="5,">
											<a class="aw-user-name hidden-xs" data-id="3398" href="#" rel="nofollow">
											<c:if test="${topic.user.userBase.imageUrl==null}">
											<img src="img/1.jpg" alt="${topic.user.userBase.userName}" /><!-- user Image -->
											</c:if>
											<c:if test="${topic.user.userBase.imageUrl!=null}">
											<img src="#" alt="${topic.user.userBase.userName}" /><!-- user Image -->
											</c:if>
											</a>	
										<div class="aw-question-content">
										<h4>
											<a href="topicController.do?param=getTopic&topic.topicId=${topic.topicId}">${topic.title}</a>
										</h4>
											<a href="#" class="pull-right text-color-999">回复</a>
										<p>
											<span class="text-color-999">${topic.user.userBase.userName}提出了问题 </span>
											<span class="text-color-999"> • ${fn:length(topic.lookUsers)} 人关注 • ${fn:length(topic.replys)} 个回复 </span>
										</p>
										</div>
									</div>
									</c:forEach>
								</div>
							</div>
								<div class="mod-footer">
									<a class="aw-load-more-content" id="c_all_more" auto-load="false">
										<span>更多...</span>
									</a>
								</div>
						</div>
					</div>
                                 <!-- 精华！ -->
								<div class="tab-pane" id="best_answers">
									<div class="aw-feed-list" id="c_best_question_list">
										
									<div class="mod-footer">
											<a class="aw-load-more-content" id="bp_best_question_more" auto-load="false">
												<span>更多...</span>
											</a>
										</div>
									</div>
								</div>
   								<!-- 精华！end -->
					<!-- 等待回答！ -->
				<div class="tab-pane" id="questions">
					<div class="aw-mod">
						<div class="mod-body">
							<div class="aw-common-list" id="c_question_list">
								<div class="aw-item " data-topic-id="5,">
									<a class="aw-user-name hidden-xs" data-id="188" href="http://wenda.bootcss.com/people/a331835757" rel="nofollow"><img src="http://wenda.bootcss.com/static/common/avatar-max-img.png" alt="" /></a>	
									<div class="aw-question-content">
										<h4><a href="http://wenda.bootcss.com/question/46">bootstarp里面的simple icons插件怎么用啊？？？急！！！</a>
											</h4>
											<a href="http://wenda.bootcss.com/question/46#!answer_form" class="pull-right text-color-999">回复</a>
										<p><a href="http://wenda.bootcss.com/people/churi" class="aw-user-name" data-id="1912">churi</a> 
											<span class="text-color-999">回复了问题 • 4 人关注 • 3 个回复 • 984 次浏览 • 2015-11-13 16:09				</span>
											<span class="text-color-999 related-topic hide"> •  来自相关话题</span>
										</p>
									</div>
								</div>
							</div>
						</div>
							<div class="mod-footer">
								<a class="aw-load-more-content" id="c_question_more" auto-load="false">
										<span>更多...</span>
								</a>
							</div>
					</div>
				</div>
					<!-- 等待回答！end -->
								<div class="tab-pane" id="articles">
									<!-- 动态首页&话题精华模块 -->
									<div class="aw-mod">
										<div class="mod-body">
											<div class="aw-common-list" id="c_articles_list">
																							</div>
										</div>
										<div class="mod-footer">
											<a class="aw-load-more-content" id="bp_articles_more" auto-load="false">
												<span>更多...</span>
											</a>
										</div>
									</div>
									<!-- end 动态首页&话题精华模块 -->
								</div>
							</div>
							<!-- end tab 切换内容 -->
						</div>
					</div>
				</div>

				<!-- 侧边栏 -->
				<div class="col-sm-12 col-md-3 aw-side-bar hidden-xs">
					<!-- 板块描述 -->
					<div class="aw-mod aw-text-align-justify">
						<div class="mod-head">
							<h3>板块描述</h3>
						</div>
						<div class="mod-body">
						 <p>${flate.flateContent}</p>						
					    	</div>
					</div>
					<!-- end 板块描述 -->
				</div>
				<!-- end 侧边栏 -->
			</div>
		</div>
	</div>
</div>

<script type="text/javascript" src="http://wenda.bootcss.com/static/js/app/topic.js"></script>

		<footer class="footer">
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
	<script type="text/javascript">
	var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
	document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fd799cb54bdae1c6134cf03ab0a98d443' type='text/javascript'%3E%3C/script%3E"));
	</script>
	<!-- DO NOT REMOVE -->
	<div id="aw-ajax-box" class="aw-ajax-box"></div>
	<div style="display:none;" id="__crond">
		<script type="text/javascript">
			$(document).ready(function () {
				$('#__crond').html(unescape('%3Cimg%20src%3D%22' + G_BASE_URL + '/crond/run/1482909027%22%20width%3D%221%22%20height%3D%221%22%20/%3E'));
			});
		</script>
	</div>
<!-- Escape time: 0.081617116928101 --><!-- / DO NOT REMOVE -->
	<script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/docs.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
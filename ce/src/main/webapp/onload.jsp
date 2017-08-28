<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="CE,论坛"> 
    <meta name="description" content="这是一个新的论坛，希望大家支持下！">
    <meta name="author" content="hjx">
    <link rel="icon" href="img/ce.png">
    <title>CE-论坛</title>
    <script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>
    <script src="js/layer.js" type="text/javascript"></script>
    <link href="css/ddd.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">	
    <link href="css/default.css" rel="stylesheet" type="text/css" />
    <script src="js/ie-emulation-modes-warning.js" type="text/javascript"></script>
    <link href="css/carousel.css" rel="stylesheet">
    <script type="text/javascript" src="js/login.js"></script>
  </head>
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
		            	    <a class="navbar-brand">CE</a>
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
			              <input type="email" class="form-control"  id="email" placeholder="Email">
			            </div>
			            <div class="form-group">
			              <input id="password" type="password" placeholder="Password" class="form-control">
			            </div>
			            <a href="javascript:; " onclick="loginSys()"  class="btn btn-success">Sign in</a>
			            <a href="javascript:; " onclick="window.location.href='login.jsp';"  class="btn btn-success">Register</a>
			          </form>
		        </div><!--/.navbar-collapse -->
		  </div>
	</nav>
</div>

<div class="aw-container-wrap">
	<div class="container">
		<div class="row">
			<div class="aw-content-wrap clearfix">
				<div class="col-sm-12 col-md-9 aw-main-content">
					<!-- tab切换 -->
					<ul class="nav nav-tabs aw-nav-tabs active hidden-xs">
						<h2 class="hidden-xs"><i class="icon icon-list"></i> 发现</h2>
					</ul>
							<!-- end tab切换 -->
					<div class="aw-mod aw-explore-list">
						<div class="mod-body">
							<div class="aw-common-list">
								<c:forEach items="${topicViews}" var="topic">
									<div class="aw-item active" data-topic-id="128,">
										<a class="aw-user-name hidden-xs" data-id="3170" href="look.do?user.userId=${topic.uid}" rel="nofollow"><img src="${topic.userImage}" alt="${topic.userName}" /></a>	
											<div class="aw-question-content">
												<h4><a href="topicController.do?param=getTopic&topic.topicId=${topic.tid}">${topic.title}</a></h4>	
												<p class="text-color-999">${topic.userName} • <fmt:formatDate value="${topic.createTime}" type="both"/>   时发起了话题  </p>
												<p>
													<a href="#" class="aw-user-name"></a> 
													<span class="text-color-999"><c:if test="${topic.lastReplyName !=null}">最后回复的是${topic.lastReplyName} • 回复时间 :<fmt:formatDate value="${topic.lastReplyTime}" type="both"/> •
													 </c:if></span><span class="text-color-999"> ${topic.replyNumber}个回复 • ${topic.fousNumber} 关注  </span>
													<span class="text-color-999 related-topic hide"> •  来自相关话题</span>
												</p>
											</div>
									</div>
								</c:forEach>
							</div>
						</div>
						
			     	 </div>
				</div>
						<!-- 侧边栏 -->
				<div class="col-sm-12 col-md-3 aw-side-bar hidden-xs hidden-sm">
						<div class="aw-mod aw-text-align-justify">
								<div class="mod-head">
									<h3>最新话题(15天内)</h3>
								</div>
							<c:forEach items="${topicLastViews}" var="topic">
								<div class="mod-body">
									 <dl>
										<dt class="pull-left aw-border-radius-5">
											<a href="look.do?user.userId=${topic.uid}"><img alt="${topic.userName}" src="${topic.userImage}" /></a>
										</dt>
										<dd class="pull-left">
											<p class="clearfix"><span class="topic-tag" data-id="4">
												<a href="topicController.do?param=getTopic&topic.topicId=${topic.tid}" class="text">${topic.title}</a>
												</span></p>
										<p><b>${topic.replyNumber}</b> 个回复  • <b>${topic.fousNumber}</b> 人关注</p>
										</dd>
									</dl> 
								</div>
							</c:forEach>
						</div>
						<div class="aw-mod aw-text-align-justify">
							 <div class="mod-head">
									<h3>热门用户</h3>
								</div>
							<c:forEach items="${users}" var="u">
								<div class="mod-body">
									<dl>
										<dt class="pull-left aw-border-radius-5">
										<a href="look.do?user.userId=${u.userId}"><img alt="${u.userName}" src="${u.imageUrl}" /></a>
										</dt>
										<dd class="pull-left">
											<a href="look.do?user.userId=${u.userId}" data-id="3356" class="aw-user-name">${u.userName}</a>
											<p class="signature"></p>
											<p><b>${u.fousedNumber}</b> 个关注, <b>${u.integration}</b> 积分</p>
										</dd>
									</dl>
								</div> 
							</c:forEach>
						</div>	
				</div>
				<!-- end 侧边栏 -->
			</div>
		</div>
	</div>

	

	<script type="text/javascript" src="js/footer.js"></script>
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/docs.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>

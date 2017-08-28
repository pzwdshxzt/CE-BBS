<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="img/ce.png">
    <title>CE-论坛</title>
    <script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>
    <script src="js/layer.js" type="text/javascript"></script>
    <link href="css/ddd.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">	
    <link href="http://wenda.bootcss.com/static/css/default/common.css?v=20140912" rel="stylesheet" type="text/css" />
    <script src="js/ie-emulation-modes-warning.js" type="text/javascript"></script>
    <link href="css/carousel.css" rel="stylesheet">
  </head>
	<script type="text/javascript">
	function loginSys(){
	  	 var value1=$("#email").val();
      	 var value2=$("#password").val();
        
      	 if (value1==''|| value2=='') {  
           alert("账号密码不能为空！");
        	return false;  
        }
	 	  $.ajax({
       	  url:"http://localhost:8080/biyesheji/login.do",
       	  data:{"security.securityEmail":value1,"security.password":value2},
       	  type:"post",
       	  async:true,
          dataType:"json",//返回的数据类型
       	  success:function(data)
                 {
       		        layer.msg('你好 '+data.userName+'，欢迎回来! ');
       			  document.getElementById("logincontroller").style.display="none";
                 } ,
                 error:function(data){
                	 layer.msg('登录失败请重试！! ');
                 }
        });
	}
	function exitSys(){
		$.post("http://localhost:8080/biyesheji/exitCe.do", function(data) {
			 layer.msg('再见 ， '+data);
			  document.getElementById("logincontroller").style.display="";
			});
	}
</script>
<script type="text/javascript">
function hello() 
{
	
	$.post("http://localhost:8080/biyesheji/checkLogin.do", function(data) {
		if(data==0){
				$("#logincontroller").hide();
			}
		if(data==1){
				$("#logincontroller").show();
		}
		});	
} 
window.onload = hello;

</script>
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
              <ul class="nav navbar-nav navbar-right">
                <li class="active"><a href="#">首页</a></li>
                <li><a href="#about">关于</a></li>
                <li><a href="#contact">联系我们</a></li>
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


 
  <%--   <!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img class="first-slide" src="photo/1.jpg" alt="First slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>Example headline.</h1>
              <p>Note: If you're viewing this page via a <code>file://</code> URL, the "next" and "previous" Glyphicon buttons on the left and right might not load/display properly due to web browser security rules.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="second-slide" src="photo/2.jpg" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>Another example headline.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="third-slide" src="photo/3.jpg" alt="Third slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>One more for good measure.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div><!-- /.carousel -->
  
 --%>
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
			<div class="aw-content-wrap clearfix">
				<div class="col-sm-12 col-md-9 aw-main-content">
					<!-- tab切换 -->
					<ul class="nav nav-tabs aw-nav-tabs active hidden-xs">
						<li><a href="http://wenda.bootcss.com/sort_type-hot__day-7" id="sort_control_hot">热门</a></li>
						<li><a href="http://wenda.bootcss.com/is_recommend-1">推荐</a></li>
						<li class="active"><a href="">最新</a></li>
						<h2 class="hidden-xs"><i class="icon icon-list"></i> 发现</h2>
					</ul>
					<!-- end tab切换 -->

					
	<div class="aw-mod aw-explore-list">
		<div class="mod-body">
			<div class="aw-common-list">
				<div class="aw-item active" data-topic-id="128,">
					<c:forEach items="${topics}" var="topic" varStatus="i">
					<a class="aw-user-name hidden-xs" data-id="3170" href="http://wenda.bootcss.com/people/murusheng" rel="nofollow"><img src="" alt="" /></a>	
						<div class="aw-question-content">
						
						
						<h4><a href="http://wenda.bootcss.com/question/2395">${topic.title}</a></h4>
							<a href="http://wenda.bootcss.com/question/2395#!answer_form" class="pull-right text-color-999">回复</a>	
						 <p><a href="http://wenda.bootcss.com/people/murusheng" class="aw-user-name"></a> 
							<span class="text-color-999">发起了问题 • 1 人关注 • ${topic.replyNumber} 个回复 • ${topic.lookNumber}次浏览 • ${topic.createTime}</span>
							<span class="text-color-999 related-topic hide"> •  来自相关话题</span>
						</p>
						</div>
						</c:forEach>
				</div>
			</div>
		</div>
		
				<div class="mod-footer">
						<div class="page-control">
							<ul class="pagination pull-right">
							<li class="active"><a href="javascript:;">1</a></li>
							<li><a href="http://wenda.bootcss.com/sort_type-new__day-0__is_recommend-0__page-2">2</a></li>
							<li><a href="http://wenda.bootcss.com/sort_type-new__day-0__is_recommend-0__page-3">3</a></li>
							<li><a href="http://wenda.bootcss.com/sort_type-new__day-0__is_recommend-0__page-4">4</a></li>
							<li><a href="http://wenda.bootcss.com/sort_type-new__day-0__is_recommend-0__page-2">&gt;</a></li>
							<li><a href="http://wenda.bootcss.com/sort_type-new__day-0__is_recommend-0__page-35">&gt;&gt;</a></li>
							</ul>
						</div>						
				</div>
	</div>
</div>

				<!-- 侧边栏 -->
		<div class="col-sm-12 col-md-3 aw-side-bar hidden-xs hidden-sm">
				<div class="aw-mod aw-text-align-justify">
						
						<div class="mod-head">
							<a href="http://wenda.bootcss.com/topic/channel-hot" class="pull-right">更多 &gt;</a>
							<h3>热门话题</h3>
						</div>
						<div class="mod-body">
							<dl>
								<dt class="pull-left aw-border-radius-5">
									<a href="http://wenda.bootcss.com/topic/问答"><img alt="" src="http://wenda.bootcss.com/static/common/topic-mid-img.png" /></a>
								</dt>
								<dd class="pull-left">
									<p class="clearfix"><span class="topic-tag" data-id="4">
										<a href="http://wenda.bootcss.com/topic/问答" class="text">问答</a>
										</span></p>
								<p><b>6</b> 个问题, <b>3</b> 人关注</p>
								</dd>
							</dl>
						</div>
				</div>
					
			<div class="aw-mod aw-text-align-justify">
					<div class="mod-head">
						<a href="http://wenda.bootcss.com/people/" class="pull-right">更多 &gt;</a>
						<h3>热门用户</h3>
					</div>
				<div class="mod-body">
					<dl>
						<dt class="pull-left aw-border-radius-5">
						<a href="http://wenda.bootcss.com/people/Tiger"><img alt="" src="http://wenda.bootcss.com/uploads/avatar/000/00/33/56_avatar_mid.jpg" /></a>
						</dt>
					<dd class="pull-left">
						<a href="http://wenda.bootcss.com/people/Tiger" data-id="3356" class="aw-user-name">Tiger</a>
						<p class="signature"></p>
					<p><b>0</b> 个问题, <b>0</b> 次赞同</p>
				</dd>
			</dl>
				</div>
			</div>	
		</div>
				<!-- end 侧边栏 -->
			</div>
		</div>
	</div>
</div>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="/js/docs.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>

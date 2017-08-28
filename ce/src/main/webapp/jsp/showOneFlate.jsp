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
	<title>${flate.flateName}板块 - CE-BBS</title>
	<meta name="keywords" content="CE,论坛"> 
    <meta name="description" content="这是一个${flate.flateName}的板块，希望大家支持下！">
    <meta name="author" content="hjx">
	<link rel="icon" href="img/ce.png">
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="css/default.css" rel="stylesheet" type="text/css" />
	<link href="css/defaultlink.css" rel="stylesheet" type="text/css" />
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<script src="js/jquery-3.1.1.min.js"></script>
	<script src="js/layer.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/login.js"></script>
	<script type="text/javascript" src="js/topic.js"></script>
</head>
<noscript unselectable="on" id="noscript">
    <div class="aw-404 aw-404-wrap container">
        <img src="http://wenda.bootcss.com/static/common/no-js.jpg">
        <p>你的浏览器禁用了JavaScript, 请开启后刷新浏览器获得更好的体验!</p>
    </div>
</noscript>
<script type="text/javascript">
function fous(fid){
	 $.ajax({
      	  url:"fousController.do?param=addUF",
      	  data:{"userToFlate.fid":fid},
      	  type:"post",
      	  async:true,
          dataType:"json",//返回的数据类型
      	  success:function(data)
                {
		       		if(data==1){
		       			layer.msg("关注成功");
		       			document.location.reload();//当前
		       		}
		       		if(data==0){
		       			layer.msg("已经关注过了，别在点我了");
		       		}
		       		if(data==2){
		       			layer.msg("请先登录！");
						window.location.href='login.jsp';
		       		}
                } ,
                error:function(data){
               	        layer.msg('失败请重试！! ');
                }
       });
	
}
function cancelfous(fid){
	 $.ajax({
     	  url:"fousController.do?param=cancelUF",
     	  data:{"userToFlate.fid":fid},
     	  type:"post",
     	  async:true,
         dataType:"json",//返回的数据类型
     	  success:function(data)
               {
		       		if(data==1){
		       			layer.msg("取消关注成功");
		       			document.location.reload();//当前
		       		}
		       		if(data==0){
		       			layer.msg("还没关注");
		       		}
		       		if(data==2){
		       			layer.msg("请先登录！");
						window.location.href='login.jsp';
		       		}
               } ,
               error:function(data){
              	 layer.msg('失败请重试！! ');
               }
      });
	
}
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
                  <li><a href="javascript:;"  onclick="exitSys()">exit</a></li>
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
								<c:if test="${fousFlate == false || fousFlate == null}">
								<a href="javascript:void();" onclick="cancelfous(${flate.flateId})" class="aw-add-comment text-color-999 ">取消关注</a>
								</c:if>
								<c:if test="${fousFlate == true}">
								<a href="javascript:void();" onclick="fous(${flate.flateId})" class="aw-add-comment text-color-999 ">关注板块</a>
								</c:if>
							</div>
						</div>
					</div>

					<div class="aw-mod aw-topic-list-mod">
						<div class="mod-head">
							<div class="tabbable">
								<!-- tab 切换 -->
								<ul class="nav nav-tabs aw-nav-tabs hidden-xs">
									<li ><button type="button" class="btn btn-primary" id="topicAdd">发帖</button></li>
									<li class="active"><a href="#all" data-toggle="tab">全部内容</a></li>
									<li><a href="#best_topics" data-toggle="tab">置顶/精华</a></li>
									<!-- /	<input type="text" id="question-input" class="search-query form-control" placeholder="搜索...">
										<div class="aw-dropdown">
											<p class="title">没有找到相关结果</p>
											<ul class="aw-dropdown-list"></ul>
										</div>-->
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
									<c:forEach var="topic" items="${topicViews}">
									<div class="aw-item " data-topic-id="5,">
											<a class="aw-user-name hidden-xs" data-id="3398" href="look.do?user.userId=${topic.uid}" rel="nofollow">
											<img src="${topic.userImage}" alt="${topic.uid}" /><!-- user Image -->
											</a>	
										<div class="aw-question-content">
										<h4>
											<a href="topicController.do?param=getTopic&topic.topicId=${topic.tid}">${topic.title}<c:if test="${topic.state == 1}">[置顶]</c:if></a>
										</h4>
											<a href="topicController.do?param=getTopic&topic.topicId=${topic.tid}" class="pull-right text-color-999">回复</a>
										<p>
											<span class="text-color-999">${topic.userName}提出了问题 </span>
											<span class="text-color-999"> • ${topic.fousNumber} 人关注 • ${topic.replyNumber} 个回复 </span>
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
						<div class="tab-pane" id="best_topics">
							<div class="aw-feed-list" id="c_best_question_list">
							<div class="mod-body">
								 <div class="aw-common-list" id="c_all_list">
									<c:forEach var="topic" items="${topicViews2}">
										<div class="aw-item " data-topic-id="5,">
											<a class="aw-user-name hidden-xs" data-id="3398" href="look.do?user.userId=${topic.uid}" rel="nofollow">
											<img src="${topic.userImage}" alt="${topic.uid}" /><!-- user Image -->
											</a>	
										<div class="aw-question-content">
										<h4>
											<a href="topicController.do?param=getTopic&topic.topicId=${topic.tid}">${topic.title}</a>
										</h4>
											<a href="topicController.do?param=getTopic&topic.topicId=${topic.tid}" class="pull-right text-color-999">回复</a>
										<p>
											<span class="text-color-999">${topic.userName}提出了问题 </span>
											<span class="text-color-999"> • ${topic.fousNumber} 人关注 • ${topic.replyNumber} 个回复 </span>
										</p>
										</div>
									</div>
									</c:forEach>
								</div>
							</div>	
									<div class="mod-footer">
											<a class="aw-load-more-content" id="bp_best_question_more" auto-load="false">
												<span>更多...</span>
											</a>
										</div>
									</div>
								</div>
   								<!-- 精华！end -->
				
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
					
					<!-- 板块状态-->
					<div class="aw-mod aw-text-align-justify">
						<div class="mod-head">
							<h3>板块状态</h3>
						</div>
						<div class="mod-body">
							<ul>
								<li>• <span class="aw-text-color-blue">${flate.topicNumber}</span> 话题</li>
								<li>• <span class="aw-text-color-blue">${flate.fousNumber}</span> 人关注</li>
								<li>• <span class="aw-text-color-blue">${flate.replyNumber}</span> 人回复</li>
							</ul>
						</div>
					</div>
					<!-- end 板块状态 -->
				</div>
				<!-- end 侧边栏 -->
			</div>
		</div>
	</div>
</div>

            	        <!-- 发帖   --> 	
        <div id="addTopic" class="modal fade " tabindex="-1" role="dialog">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title">发布话题</h4>
		      </div>
		      <div class="modal-body">
		          <div class="form-group">
				    <label for="title">Title/话题</label>
				    <input type="text" class="form-control" id="title" placeholder="输入你的标题">
				  </div>
				  <div class="form-group">
				    <label for="content">Content/话题内容</label>
				    <textarea id="content" class="form-control" rows="10" placeholder="输入你的内容"></textarea>
				  </div>
				  <input type="hidden" value="${flate.flateId}" id="flateId">
		      </div>
		      
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		        <button id="model-addTopic" type="button" class="btn btn-primary">发布</button>
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->	
            	     <!-- 发帖 end -->
       	      
	<script type="text/javascript" src="js/footer.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/docs.min.js"></script>
    <script src="js/ie10-viewport-bug-workaround.js"></script>
  

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="<%=basePath%>">
	<meta content="text/html;charset=utf-8" http-equiv="Content-Type" />
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
	<meta name="renderer" content="webkit" />
	<meta name="keywords" content="CE,论坛"> 
    <meta name="description" content="${topicVo.title} - ${topicVo.content}---CE论坛">
    <meta name="author" content="hjx">
	<title>${topicVo.title} - ${topicVo.content}---CE论坛</title>
	<link rel="stylesheet" type="text/css" href="css/emoji/emojione.sprites.css" media="screen">
	<link rel="stylesheet" type="text/css" href="css/emoji/emojionearea.min.css" media="screen">
	<link rel="icon" href="img/ce.png">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/default.css" rel="stylesheet" type="text/css" />
	<link href="css/defaultlink.css" rel="stylesheet" type="text/css" />
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<script src="js/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
    <script src="js/layer.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/login.js"></script>

	<script type="text/javascript">
		function addReply(id){
			    var text =$("#content").val();
			    var output = emojione.toShort(text);
			    $('#addReply').attr("disabled","disabled");
			 if (text==''){
				 layer.msg("请输入回复内容！！");
				 $('#addReply').removeAttr("disabled");
				 return false;
			 }else{
				 $.ajax({
		       	  url:"hfglController.do",
		       	  data:{"param":"add","reply.replyContent":text,"topic.topicId":id},
		       	  type:"post",
		       	  async:true,
		          dataType:"json",//返回的数据类型
		       	  success:function(data)
		                 {
		       					
					       		if(data==0){
									layer.msg("请先登录！");
									window.location.href='login.jsp';
								}
								if(data==1){
									document.location.reload();
									layer.msg("回复成功！正在刷新！");
								}
		                 } ,
		                 error:function(data){
		                	 layer.msg('回复失败请重试！! ');
		                	 $('#addReply').removeAttr("disabled");
		                 }
		        });
		 }
	}
		
		function fous(tid){
			 $.ajax({
		       	  url:"fousController.do?param=addUT",
		       	  data:{"userToTopic.tid":tid},
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
		                 },
		         error:function(data){
		                	 layer.msg('失败请重试！! ');
		                 }
		        });
			
		}
		
		function del(id){
			 $.ajax({
		       	  url:"hfglController.do",
		       	  data:{"param":"delete","reply.replyId":id},
		       	  type:"post",
		       	  async:true,
		          dataType:"json",//返回的数据类型
		       	  success:function(data)
		                 {
				       		if(data==1){
								layer.msg('删除成功', {
					  		   	 time: 2000, //2s后自动关闭
					  		 	 });
								 document.location.reload();
							}
							if(data==0){
								layer.msg('删除失败',{
						  		   	 time: 2000, //2s后自动关闭
					  		 	 });
							}
		                 } ,
		                 error:function(data){
		                	 layer.msg('失败请重试！! ');
		                 }
		        });
			
		}
	
		function share(webid){
			var url = url || window.location.href;
			var title=$('#title').text();
			shareURL = 'http://www.jiathis.com/send/?webid=' + webid + '&url=' + url + '&title=' + title + '';
			window.open(shareURL);
		}

		function cancelfous(tid){
			 $.ajax({
		     	  url:"fousController.do?param=cancelUT",
		     	  data:{"userToTopic.tid":tid},
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
			
			<div class="container">
			</div>
			
<div class="aw-container-wrap">
		<div class="container">
		<div class="row">
			<div class="aw-content-wrap clearfix">
				<div class="col-sm-12 col-md-9 aw-main-content">
					<!-- 话题推荐bar -->
										<!-- 话题推荐bar -->
					<!-- 话题bar -->
					<div class="aw-mod aw-topic-bar" id="question_topic_editor" data-type="question" data-id="2395">
						<div class="tag-bar clearfix"><span class="topic-tag" data-id="128"></span>
						</div>
					</div>
					<!-- end 话题bar -->
					<div class="aw-mod aw-question-detail aw-item">
						<div class="mod-head" id="title"><h1>${topicVo.title}</h1></div>
						<div class="mod-body">
							<div class="content markitup-box ">
								${topicVo.content}
							</div>
						</div>
						<div class="mod-footer">
							<div class="meta">
								<span class="text-color-999">${topicVo.createTime}</span>
								<c:if test="${fousTopic == true || fousTopic == null }">
									<a href="javascript:void();" onclick="fous(${topicVo.tid})" class="aw-add-comment text-color-999 ">关注</a>
								</c:if>
								<c:if test="${fousTopic == false }">
									<a href="javascript:void();" onclick="cancelfous(${topicVo.tid})" class="aw-add-comment text-color-999 ">取消关注</a>
								</c:if>
									<div class="pull-right more-operate">
										<!-- <a class="text-color-999"  onclick="AWS.dialog('shareOut', {item_type:'question', item_id:2395});"> -->
										<a class="text-color-999 dropdown-toggle" data-toggle="dropdown"><i class="icon icon-share"></i>分享</a>
										<div aria-labelledby="dropdownMenu" role="menu" class="aw-dropdown shareout pull-right">
											<ul class="aw-dropdown-list">
												<li><a onclick="share('tsina');"><i class="icon icon-weibo"></i>新浪微博</a></li>
												<li><a onclick="share('qzone');"><i class="icon icon-qzone"></i>QZONE</a></li>
												<li><a onclick="share('weixin');"><i class="icon icon-wechat"></i>微信</a></li>
											</ul>
										</div>
									</div>
							</div>
						</div>
						
						<!-- 相关链接 -->
						<div class="aw-question-related-box hide">
							<form action="http://wenda.bootcss.com/publish/ajax/save_related_link/" method="post" onsubmit="return false" id="related_link_form">
								<div class="mod-head">
									<h2>与内容相关的链接</h2>
								</div>
								<div class="mod-body clearfix">
									<input type="hidden" name="item_id" value="2395" />
									<input type="text" class="form-control pull-left" name="link" value="http://" />

									<a onclick="AWS.ajax_post($('#related_link_form'));" class="pull-left btn btn-success">提交</a>
								</div>
							</form>
						</div>
						<!-- end 相关链接 -->
					</div>

					<div class="aw-mod aw-question-comment">
						<div class="mod-head">
							<ul class="nav nav-tabs aw-nav-tabs active">
								<h2 class="hidden-xs">${topicVo.replyNumber}个回复</h2>
							</ul>
						</div>
					</div>
						<!-- end 问题详细模块 -->

						<!-- 回复编辑器 -->
					<div class="aw-mod aw-replay-box">
						<a name="answer_form"></a>
						<c:if test="${topicVo.replyNumber > 0}">
						<c:forEach  items="${replyViews}" var="reply" varStatus="i">
						<div class="aw-item " uninterested_count="0" force_fold="0" id="answer_list_538">
							<div>
								${i.index+1}楼：
							</div>
							<div class="mod-head">
										<!-- 用户头像 -->
								<a class="aw-user-img aw-border-radius-5 pull-left" href="look.do?user.userId=${reply.uid}" data-id="367"><img width="40px" height="40px" src="${reply.userImage}" alt="${reply.userName}" /></a>										
										<!-- end 用户头像 -->
							</div>
							<div style="margin-left: 60px" class="mod-body clearfix " >
								<div class="title"  >
										<p><a class="aw-user-name" href="look.do?user.userId=${reply.uid}" data-id="367">${reply.userName}</a>
									    </p>
								</div>	
											<!-- 评论内容 -->
								<div class="markitup-box">${reply.replyContent}</div>
								<span class="text-color-999 pull-right">
									<c:if test="${reply.uid == sessionScope.personMessage.userId}">
									<a href="javascript:void();" onclick="del(${reply.rid})" class="aw-add-comment text-color-999 ">删除</a>
									</c:if>
									${reply.replyTime}
								</span>
											<!-- end 评论内容 -->
											
							</div>
							<hr>
						</div>
						</c:forEach>
						</c:if>
						<div>
							<c:if test="${sessionScope.personMessage==null}">
						    		<p align="center">要回复话题请先<a href="login.jsp">登录/注册</a></p>
					    	</c:if>
					    	<c:if test="${sessionScope.personMessage!=null}">
							    	<div><textarea rows="3"id="content"></textarea>	</div>					
							    	<div>
								    	 <input id="addReply" class="btn btn-success ull-right" onclick="addReply(${topicVo.tid})" type="button" value="Reply">
						    		</div>
					    	</c:if>
					    </div>
					</div>
					
					<!-- end 回复编辑器 -->
					</div>
					
					<!-- 侧边栏 -->
				<div class="col-md-3 aw-side-bar hidden-xs hidden-sm">
					<!-- 发起人 -->
										<div class="aw-mod">
						<div class="mod-head">
							<h3>发起人</h3>
						</div>
						<div class="mod-body">
							<dl>
								<dt class="pull-left aw-border-radius-5">
									<a href="look.do?user.userId=${topicVo.uid}"><img width="60px" height="60px" alt="${topicVo.userName}" src="${topicVo.userImage}" /></a><!-- 人物图片 -->
								</dt>
								<dd class="pull-left">
									<a class="aw-user-name" href="look.do?user.userId=${topicVo.uid}" data-id="3170">${topicVo.userName}</a>
									<p></p>
								</dd>
							</dl>
						</div>
					</div>
										<!-- end 发起人 -->
					
										<!-- 相关问题 -->
					<div class="aw-mod">
						<div class="mod-head">
							<h3>相关问题</h3>
						</div>
						<div class="mod-body font-size-12">
							<ul>
								<c:forEach items="${topicViews}" var="t">
									<c:if test="${t.uid!=topicVo.uid}">
										<li><a href="topicController.do?param=getTopic&topic.topicId=${t.tid}&flate.flateId=${t.fid}">${t.title}</a></li>
									</c:if>
								</c:forEach>
							</ul>
						</div>
					</div>
					<!-- end 相关问题 -->
					
					<!-- 问题状态 -->
					<div class="aw-mod question-status">
						<div class="mod-head">
							<h3>话题状态</h3>
						</div>
						<div class="mod-body">
							<ul>
								<li>关注: <span class="aw-text-color-blue">${topicVo.fousNumber}</span> 人</li>
							</ul>
						</div>
					</div>
					<!-- end 问题状态 -->
				</div>
				<!-- end 侧边栏 -->
			</div>
		</div>
	</div>
</div>

<script type="text/javascript" src="js/footer.js"></script>

	
 	 <script type="text/javascript" src="js/emoji/emojione.min.js"></script>
	 <script type="text/javascript" src="js/emoji/emojionearea.js"></script>
	  <script type="text/javascript">
	    $(document).ready(function() {
	        $("#content").emojioneArea({
	        useSprite: false ,
	        autoHideFilters  : true
	       });
	    
	    });
	  </script>

</body>
</html>
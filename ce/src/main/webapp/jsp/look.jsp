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
<title>${user.userName} 的个人主页 - CE-论坛</title>
<link rel="icon" href="img/ce.png">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/default.css" rel="stylesheet" type="text/css" />
<link href="css/defaultlink.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="http://wenda.bootcss.com/static/css/default/user.css?v=20140912" rel="stylesheet" type="text/css" />
<script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/layer.js" type="text/javascript"></script>
<script type="text/javascript" src="js/login.js"></script>
<script src="js/plug-in_module.js" type="text/javascript"></script>
<script src="js/aw_template.js" type="text/javascript"></script>
</head>
<noscript unselectable="on" id="noscript">
    <div class="aw-404 aw-404-wrap container">
        <img src="http://wenda.bootcss.com/static/common/no-js.jpg">
        <p>你的浏览器禁用了JavaScript, 请开启后刷新浏览器获得更好的体验!</p>
    </div>
</noscript>
<script type="text/javascript">
function fous(uid){
	 $.ajax({
       	  url:"fousController.do?param=addUU",
       	  data:{"userToUser.ued":uid},
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
			       		if(data==3){
			       			layer.msg("不能关注自己");
			       		}
                 } ,
                 error:function(data){
                	 layer.msg('关注失败请重试！! ');
                 }
        });
	
}
function cancelfous(uid){
	 $.ajax({
      	  url:"fousController.do?param=cancelUU",
      	  data:{"userToUser.ued":uid},
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
			       			layer.msg("已经关注过了，别在点我了");
			       		}
			       		if(data==2){
			       			layer.msg("请先登录！");
							window.location.href='login.jsp';
			       		}
			       		if(data==3){
			       			layer.msg("不能关注自己");
			       		}
                } ,
                error:function(data){
               	 layer.msg('关注失败请重试！! ');
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
						                  <ul class="dropdown-menu" role="menu">
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
     <div class="col-sm-12 col-md-9 aw-main-content">
     </div>
        <div class="row">
            <div class="aw-content-wrap clearfix">
                <div class="col-sm-12 col-md-9 aw-main-content">
                    <!-- 用户数据内容 -->
                    <div class="aw-mod aw-user-detail-box">
                        <div class="mod-head">
                            <img src="${user.imageUrl}" width="auto" height="100px" alt="${user.userName}" />
                            <span class="pull-right operate">
                            	<c:if test="${fousUser == true || fousUser == null}">
                            		<a href="javascript:void();" onclick="fous(${user.userId})" class="aw-add-comment text-color-999 ">关注用户</a>
                            	</c:if>
                            	<c:if test="${fousUser == false}">
                            		<a href="javascript:void();" onclick="cancelfous(${user.userId})" class="aw-add-comment text-color-999 ">取消关注</a>
                            	</c:if>
                            </span>
                            <h1>${user.userName}</h1>
                            <p class="text-color-999"></p>
                            <p class="aw-user-flag"></p>
                        </div>
                        <div class="mod-body">
                            <div class="meta">
                                <span> 威望 : <em class="aw-text-color-green">${user.prestige}</em></span>
                                <span> 积分 : <em class="aw-text-color-orange">${user.integration}</em></span>                               
                            </div>
                        </div>
                        <div class="mod-footer">
                            <ul class="nav nav-tabs aw-nav-tabs hidden-xs">
                                <li class="active"><a href="#questions" id="page_questions" data-toggle="tab">发问<span class="badge">${fn:length(topicViews)}</span></a></li>
                                <li><a href="#answers" id="page_answers" data-toggle="tab">回复<span class="badge">${fn:length(replyViews)}</span></span></a></li>
                                <li><a href="#detail" id="page_detail" data-toggle="tab">详细资料</a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- end 用户数据内容 -->

                    <div class="aw-user-center-tab">
                        <div class="tab-content">
                            <div class="tab-pane active" id="questions">
                                <div class="aw-mod">
                                    <div class="mod-head">
                                        <h3>话题</h3>
                                    </div>
                                    <div class="mod-body">
                                    <c:forEach items="${topicViews}" var="topic">
									<div class="aw-item active" data-topic-id="128,">
											<div class="aw-question-content">
												<h4><a href="topicController.do?param=getTopic&topic.topicId=${topic.tid}&flate.flateId=${topic.fid}" target="_blank">${topic.title}</a></h4>	
												<p class="text-color-999">${topic.userName} • <fmt:formatDate value="${topic.createTime}" type="both"/>   时发起了话题  </p>
												<p>
													<a href="#" class="aw-user-name"></a> 
													<span class="text-color-999"><c:if test="${topic.lastReplyName !=null}">最后回复的是${topic.lastReplyName} • 回复时间 :<fmt:formatDate value="${topic.lastReplyTime}" type="both"/> • </c:if></span><span class="text-color-999"> ${topic.replyNumber}个回复 • ${topic.fousNumber} 关注  </span>
													<span class="text-color-999 related-topic hide"> •  来自相关话题</span>
												</p>
											</div>
									</div>
							     	</c:forEach>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="answers">
                                <div class="aw-mod">
                                    <div class="mod-head">
                                        <h3>回复</h3>
                                    </div>
                                    <div class="mod-body">
                                    <c:forEach  items="${replyViews}" var="reply" varStatus="i">
                                    		<p><mark>${user.userName}</mark> 在 ${reply.replyTime} 回复话题  <mark><a href="topicController.do?param=getTopic&topic.topicId=${reply.tid}">${reply.topicName}</a></mark>: &nbsp; ${reply.replyContent}</p>
                                    </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="detail">
                                <div class="aw-mod">
                                    <div class="mod-head">
                                      <div id="base">
                                        <c:if test="${user.hide==0}">
                                       		 <h3>基础信息</h3>
                                       		  <div>
	                                       		  <c:if test="${user.sex==0}">
	                                       		  <p><mark>性别</mark>: <span>男</span></p>
	                                       		  </c:if>
	                                       		   <c:if test="${user.sex==1}">
	                                       		  <p><mark>性别</mark>: <span>女</span></p>
	                                       		  </c:if>
	                                       		   <c:if test="${user.sex==2}">
	                                       		  <p><mark>性别</mark>: <span>保密</span></p>
	                                       		  </c:if>
                                       		  </div>
                                       		  <p><mark>生日</mark>: <span>${user.birthDay}</span></p>
                                       		  <p><mark>地址</mark>: <span>${user.address}</span></p>
                                        </c:if>
                                        </div>
                                        <div id="work">
	                                        <c:if test="${lifeWork.hide==0}">
	                                       		 <h3>工作信息</h3>
	                                       		 <div>
	                                       		  
	                                       		  <c:if test="${lifeWork.isWork==0}">
	                                       		 	<p><span>还没有工作！求推荐！</span></p>
	                                       		  </c:if>
	                                       		  </div>
	                                       		  <c:if test="${lifeWork.hide==0}">
	                                       		  	  <p><mark>公司</mark>: <span>${lifeWork.company}</span></p>
	                                       		  	  <p><mark>部门</mark>: <span>${lifeWork.department}</span></p>
	                                       		  	  <p><mark>职位</mark>: <span>${lifeWork.position}</span></p>
	                                       		  </c:if>
	                                        </c:if>
                                        </div>
                                        <div id="exChange">
	                                        <c:if test="${exChange.hide==0}">
	                                       		 <h3>联系信息</h3>
                                       		  	  <p><mark>qq</mark>: <span>${exChange.qq}</span></p>
                                       		  	  <p><mark>weChat</mark>: <span>${exChange.weChat}</span></p>
                                       		  	  <p><mark>email</mark>: <span>${exChange.email}</span></p> 
                                       		  	  <p><mark>tel</mark>: <span>${exChange.tel}</span></p>
	                                        </c:if>
                                        </div>
                                        
                                        <div id="lifeEdu">
	                                        <c:if test="${lifeEdu.hide==0}">
	                                       		 <h3>学历信息</h3>
                                       		  	  <p><mark>school</mark>: <span>${lifeEdu.school}</span></p>
                                       		  	  <p><mark>education</mark>: <span>${lifeEdu.education}</span></p>
	                                        </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 侧边栏 -->
                <div class="col-sm-12 col-md-3 aw-side-bar">
                    <div class="aw-mod people-following">
                        <div class="mod-body">
                            <span>
                           		     关注 <em class="aw-text-color-blue">${user.fousUserNumber}</em> 人                            </span>
                         </div>
                    </div>
                    <div class="aw-mod people-following">
                        <div class="mod-body">
                            <span>
                           		    被关注 <em class="aw-text-color-blue">${user.fousedNumber}</em> 人                            </span>
                         </div>
                    </div>
                    <div class="aw-mod people-following">
                        <div class="mod-body">
                      			     关注 <em class="aw-text-color-blue">${user.fousTopicNumber}</em> 话题                                                    </div>
                    </div>
                    
                    <div class="aw-mod people-following">
                        <div class="mod-body">
                      			     关注 <em class="aw-text-color-blue">${user.fousFlateNumber}</em> 板块                                                    </div>
                    </div>
                    <div class="aw-mod">
                        <div class="mod-body">
                            <span class="aw-text-color-666">
                       		             主页访问量 : ${user.look}次访问                            </span>
                        </div>
                    </div>
                </div>
                <!-- end 侧边栏 -->
            </div>
        </div>
    </div>
</div>


<a class="aw-back-top hidden-xs" href="javascript:;" onclick="$.scrollTo(1, 600, {queue:true});"><i class="icon icon-up"></i></a>
	<script type="text/javascript" src="js/footer.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
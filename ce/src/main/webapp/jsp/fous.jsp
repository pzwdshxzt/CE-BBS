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
<title>login - CE-BBS</title>
<link rel="icon" href="img/ce.png">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/default.css" rel="stylesheet" type="text/css" />
<link href="css/defaultlink.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script src="js/layer.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/docs.min.js"></script>
</head>
<script type="text/javascript">
function cancelflatefous(fid){
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
function canceltopicfous(tid){
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
function canceluserfous(uid){
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
			       			layer.msg("你还没关注");
			       			document.location.reload();//当前
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
<style>
.aw-register-agreement-txt{max-height: 200px;overflow-x:hidden;overflow-y:auto;}
</style>
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


 <div class="container" style="text-align:center;">
      <div class="row"> <!-- 页面分块 -->
      	 <div class=""> 
			 <nav aria-label="..." >
			     <ul class="nav nav-tabs" role="tablist" id="myTab" style="display:inline-block ;">
					  <li role="presentation" class="active"><a data-toggle="tab" href="#user">关注的人</a></li>
					  <li role="presentation"><a data-toggle="tab" href="#topic">关注话题</a></li>
					  <li role="presentation"><a data-toggle="tab" href="#flate">关注的板块</a></li>
				</ul>
			 </nav>
		 </div>
		
		
	<div class="main">
       	<div  id="myTabContent" class="tab-content" >
       		<div role="tabpane" class="tab-pane fade in active" id="user" style=" width: 500px;margin: 0 auto ;" >
				<div style="text-align: center;">
				 	<c:if test="${users != null}">
				 		<h1>这些都是你关注的优秀的人哦</h1>
				 	</c:if>
				 	
				 	<c:if test="${users == null}">
				 		<h1>你还没有关注优秀的人哦</h1>
				 	</c:if>
				 	
				 	<c:forEach  items="${users}" var="user" varStatus="i">
							<div>
									<!-- 用户头像 -->
								<a  href="look.do?user.userId=${user.userId}" data-id="367">
									<img width="30px" height="30px" src="${user.imageUrl}" alt="${user.userName}" />
								</a>										
									<!-- end 用户头像 -->
								<a class="aw-user-name" href="look.do?user.userId=${user.userId}" data-id="367">${user.userName}</a>
								<a href="javascript:void();" onclick="canceluserfous(${user.userId})" class="pull-right text-color-999">取消关注</a>
     						</div>
							<hr>
					</c:forEach>
				</div>
				
			</div>
			
	  		<div role="tabpane" class="tab-pane fade"   id="topic" style="text-align:center;margin: 0 auto; width: 500px;">
				<div style="text-align: center;">
				    <c:if test="${topicViews != null}">
				 		<h1>这些都是你关注的有趣的话题哦</h1>
				 	</c:if>
				 
				 	<c:if test="${topicViews == null}">
				 		<h1>你还没有关注有趣的话题哦</h1>
				 	</c:if>
				 	
				 	<c:forEach  items="${topicViews}" var="topic" varStatus="i">
						<div>
							<p>
								<a href="look.do?user.userId=${topic.uid}"  class="pull-left">
									<img width="30px" height="30px" src="${topic.userImage}" alt="${topic.title}" /><!-- user Image -->
								</a>
								<a class="text-color-999 pull-left" href="look.do?user.userId=${topic.uid}" >${topic.userName}发布 </a>
							</p>
							<p>	
							    <a href="topicController.do?param=getTopic&topic.topicId=${topic.tid}" >${topic.title}</a>
								<span class="text-color-999"> • ${topic.fousNumber} 人关注 • ${topic.replyNumber} 个回复 </span>
								<a href="javascript:void();" onclick="canceltopicfous(${topic.tid})" class="pull-right text-color-999">取消关注</a>
							</p>
						</div>
					</c:forEach>
			    </div>
	  	    </div>
	  	 
	  		 <div role="tabpane" class="tab-pane fade" id="flate" style="text-align:center;margin: 0 auto; width: 500px;">
				<div style="text-align: center;">
				 	<c:if test="${flates != null}">
				 		<h1>这些是你关注的有趣的板块哦</h1>
				 	</c:if>
				 	<c:if test="${flates == null}">
				 		<h1>你还没有关注有趣的板块哦</h1>
				 	</c:if>
				 	<c:forEach  items="${flates}" var="flate" varStatus="i">
						 <div class="aw-item">
			                        <div>  
			                        	<p class="clearfix">
					                        	 <!-- 话题图片 -->
					                        	 <a class="img" href="bkController.do?param=show&flate.flateId=${flate.flateId}">
					                       			 <img width="30px" height="30px" src="${flate.imageUrl}" alt="${flate.flateName}" /> 
					                       		 </a>
					                             <!-- end 话题图片 -->
					                             <!-- 话题内容 -->
					                      	     <span>
					                       			 <a href="bkController.do?param=show&flate.flateId=${flate.flateId}">${flate.flateName}</a>
					                      	     </span>
					                     	     <!-- end 话题内容 -->
				                     	    	 <span  class="text-color-999">${flate.topicNumber}个话题</span>
				                       			 <span  class="text-color-999">${flate.fousNumber}个关注</span>
				                       			 <a href="javascript:void();" onclick="cancelflatefous(${flate.flateId})" class="aw-add-comment text-color-999 ">取消关注</a>
			                             </p>
			                        </div>
			                           
		                        </div>
					</c:forEach>
			    </div>
	  	    </div>
	  	 
	  	 </div>
	  	 </div>
	  	   	   <!-- 左边导航 begin-->
       
     </div>
 </div>
	
	<script type="text/javascript" src="js/footer.js"></script>
	<a class="aw-back-top hidden-xs" href="javascript:;" onclick="$.scrollTo(1, 600, {queue:true});"><i class="icon icon-up"></i></a>
	<script src="js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
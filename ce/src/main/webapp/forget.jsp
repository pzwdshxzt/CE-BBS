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
var countdown=60;
function settime(obj) {
	
	  if (countdown == 0) {
      	  obj.removeAttribute("disabled");
          obj.value="发送邮件";
          countdown = 60 ;
 	      return;
      } else {
    	  
      	if(countdown == 60){
      		var value1=$("#email").val();
      	      	if (value1=='') {  
      		          layer.msg("邮箱不能为空！");
      		        	return false;  
      		        }
      	      	 $.ajax({
      		       	  url:"sendEmail.do?param=forgetPassword",
      		       	  data:{"mailInfo.toEmail":value1},
      		       	  type:"post",
      		       	  async:true,
      		          dataType:"json",//返回的数据类型
      		       	  success:function(data)
      		                 {
      		       		        if(data==3){
		      		       		    $("#email").val('');
		      		   		  		layer.msg('你还没注册是否注册？',{time:10000});
		      		   			    window.location.href="login.jsp";
      		       		        }
      				   			if(data==2){
	       				   		   obj.setAttribute("disabled", true);
			   		  			   layer.msg('已为你发送邮件!请注意查收!发件人:ce-bbs@qq.com!',{time:5000});
  			   		  		   }
      				   			if(data==1){
	       				   		   obj.setAttribute("disabled", true);
			   		  			   layer.msg('邮箱不对！!');
			   		  		   }
      		                 } ,
      		                 error:function(data){
      		                	 layer.msg('发送失败请重试！! ');
      		                 }
      		         });
      	}
      	obj.value="重新发送(" + countdown + ")";
          countdown--;
      }
      setTimeout(function(){
      	settime(obj);
      	},1000);
}

function checkEmail(){
	var	e  = $("#email").val();
	 $.ajax({
      	  url:"userContrl.do",
      	  data:{"param":"checkEmail","security.securityEmail":e},
      	  type:"post",
      	  async:true,
          dataType:"json",//返回的数据类型
      	  success:function(data)
                {
  		  			if(data==1){ //邮箱还没注册
  		  				 $("#email").val('');
		   		  		 layer.msg('你还没注册是否注册？',{time:10000});
		   				 window.location.href="login.jsp";
		   			}
  		  			
  		  			if(data==0){
  		  		     //layer.msg('邮箱可以用 ');
  		  			}
                } ,
                error:function(data){
               	 layer.msg('网络错误 ');
                }
       });
}

function forget(){
	var value1=$("#email").val();
	var value2=$("#code").val();
	if(value1==''){
		layer.msg('邮箱不能为空');
		return false;
	}
	if(value2==''){
		layer.msg('验证码不能为空');
		return false;
	}
	 $.ajax({
	       	  url:"sendEmail.do?param=findPassword",
	       	  data:{"mailInfo.toEmail":value1,"mailInfo.codeMd5":value2},
	       	  type:"post",
	       	  async:true,
	          dataType:"json",//返回的数据类型
	       	  success:function(data)
	                 {
				       		if(data==0){
			  			   	   layer.msg('发送失败');
					  		}
				       		
				   			if(data==2){
	  		  			   	   layer.msg('新密码发送邮件!请及时修改！修改！发件人:ce-bbs@qq.com!',{time:10000});
	  		  			   	   window.location.href="login.jsp";
		   		  		    }
				   			
				   			if(data==1){
	  		  			       layer.msg('验证码不对!',{time:5000});
	  		  		 	    }
				   			
				   			if(data==3){
					   		   $("#email").val('');
				   		  	   layer.msg('你还没注册是否注册？',{time:10000});
				   			   window.location.href="login.jsp";
		  		  		 	}
				   			
				   			if(data==4){
				   		  	   layer.msg('验证码失效，请重新获取或者新密码已经在邮箱中了',{time:10000});
			  		  		}
	                 } ,
	                 error:function(data){
	                	 layer.msg('发送失败请重试！! ');
	                 }
	         });
}

function hello() 
{
	
	$.post("checkLogin.do", function(data) {
		if(data==0){
			layer.msg('你已经登陆！正在跳转首页！！', {
	  		   	 time: 2000, //2s后自动关闭
  		 	 });
			 window.location.href="onload.do";
			}
		});	
} 
window.onload = hello;

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
						  <li role="presentation" class="active"><a data-toggle="tab" href="#login">Forget Password/忘记密码</a></li>
				</ul>
			 </nav>
		 </div>
		
		
	<div class="main">
       	<div id="myTabContent" class="tab-content" >
	  	 <div role="tabpane" class="tab-pane fade in active" id="login" style="text-align:center;margin: 0 auto; width: 500px;">
					<div>
						<form >
						  <div class="form-group">
						    <label for="email">Email address</label>
						    <input type="email" class="form-control" onblur="checkEmail()" id="email" placeholder="Email">
						    <input type="button" id="sendEmail" value="&nbsp;发送邮箱" class="btn btn-default" onclick="settime(this)" />
						  </div>
						  <div class="form-group">
						    <label for="password">Code/验证码</label>
						    <input type="text" class="form-control" id="code" placeholder="Code">
						  </div>
						   <a href="javascript:;" onclick="forget()" class="btn btn-success">找回</a>
						   <a href="login.jsp"  class="btn btn-success">Login</a>
						</form>
					</div>
	  	 </div>
	  	 
	  	 
	  	 </div>
	  	 </div>
	  	   	   <!-- 左边导航 begin-->
       
     </div>
 </div>
	
	<!-- Modal -->
	<div class="modal fade  bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">用户协议</h4>
	      </div>
	     <div class="aw-register-agreement-txt" id="register_agreement">
							当您申请用户时，表示您已经同意遵守本规章。
							<br>
							欢迎您加入本站点参与交流和讨论，本站点为社区，为维护网上公共秩序和社会稳定，请您自觉遵守以下条款：
							<br>
							<br>
							一、不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益，不得利用本站制作、复制和传播下列信息：
　							（一）煽动抗拒、破坏宪法和法律、行政法规实施的；
							<br>
　							（二）煽动颠覆国家政权，推翻社会主义制度的；
							<br>
　							（三）煽动分裂国家、破坏国家统一的；
							<br>
　							（四）煽动民族仇恨、民族歧视，破坏民族团结的；
							<br>
　							（五）捏造或者歪曲事实，散布谣言，扰乱社会秩序的；
							<br>
　							（六）宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；
							<br>
　							（七）公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；
							<br>
　							（八）损害国家机关信誉的；
							<br>
　							（九）其他违反宪法和法律行政法规的；
							<br>
　							（十）进行商业广告行为的。
							<br>
							二、互相尊重，对自己的言论和行为负责。
							<br>
							三、禁止在申请用户时使用相关本站的词汇，或是带有侮辱、毁谤、造谣类的或是有其含义的各种语言进行注册用户，否则我们会将其删除。
							<br>
							四、禁止以任何方式对本站进行各种破坏行为。
							<br>
							五、如果您有违反国家相关法律法规的行为，本站概不负责，您的登录信息均被记录无疑，必要时，我们会向相关的国家管理部门提供此类信息。
							<br>
			</div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">我知道了</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<script type="text/javascript" src="js/footer.js"></script>
	<a class="aw-back-top hidden-xs" href="javascript:;" onclick="$.scrollTo(1, 600, {queue:true});"><i class="icon icon-up"></i></a>
	<script src="js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
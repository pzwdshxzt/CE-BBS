 		var countdown=60;
        function settime(obj) {
                if (countdown == 0) {
                	obj.removeAttribute("disabled");
                    obj.value="发送邮件";
                    countdown = 60 ;
	       	      	 return;
                } else {
                	if(countdown == 60){
                		var value1=$("#email1").val();
     	       	       	var value2=$("#codeMd5").val();
     	       	      	if (value1=='') {  
     	       		          layer.msg("邮箱不能为空！");
     	       		        	return false;  
     	       		        }
     	       	      	if (value2=='') {  
     	       		          layer.msg("验证码不能为空！");
     	       		        	return false;  
     	       		        }
     	       	      	 $.ajax({
     	       		       	  url:"sendEmail.do?param=register",
     	       		       	  data:{"mailInfo.toEmail":value1,"mailInfo.codeMd5":value2},
     	       		       	  type:"post",
     	       		       	  async:true,
     	       		          dataType:"json",//返回的数据类型
     	       		       	  success:function(data)
     	       		                 {
     	       		   		  			if(data==0){
     	       		   		  			　  layer.msg('请输入验证码');
     	       		   		  			   console.log('请输入验证码');
		     	       		   		  	   obj.removeAttribute("disabled");
		     	                           obj.value="发送邮件";
     	       		   		  			}
     	       			   		  		if(data==1){
 	       			   		  			　  layer.msg('验证码过期');
 	       			   		  			   console.log('验证码过期');
 	       			   		  			   obj.removeAttribute("disabled");
	     	                               obj.value="发送邮件";
     	       			   		  		}
     	       				   		  	if(data==2){
 	       			   		  			　  layer.msg('验证码错误');
 	       			   		  			   console.log('验证码错误');
		     	       			   		   obj.removeAttribute("disabled");
			     	                       obj.value="发送邮件";
 	       			   		  			   $("#codePic").attr('src','getPic.do?s='+new Date().getTime());
 	       			   		  	           $("#codeMd5").val('');
     	       			   		  		}
     	       				   			if(data==3){
	     	       				   		   obj.setAttribute("disabled", true);
 		       		                       $("#codePic").attr('src','getPic.do?s='+new Date().getTime());
 		       		                       $("#codeMd5").val('已经发送邮件');
 		       		                       // $("#codeMd5").attr('disabled','disabled');
        			   		  			　  layer.msg('已为你发送邮件!请注意查收!发件人:ce-bbs@qq.com!');
        			   		  		       console.log('已为你发送邮件!请注意查收!发件人:ce-bbs@qq.com!');
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
       
$(document).ready(function(){
			$("#email1").blur(function(){
				var	e  = $("#email1").val();
				 $.ajax({
			       	  url:"userContrl.do",
			       	  data:{"param":"checkEmail","security.securityEmail":e},
			       	  type:"post",
			       	  async:true,
			          dataType:"json",//返回的数据类型
			       	  success:function(data)
			                 {
			   		  			if(data==0){
					   		  			　layer.confirm('你已经注册是否登陆？', {
					   				 	 btn: ['是','否'] //按钮
					   					}, function(){
					   					 window.location.href="login.jsp";
					   					}, function(){
					   				 	 layer.msg('修改邮箱', {
					   				   	 time: 2000, //2s后自动关闭
					   				 	 });
					   				 	$("#email1").val('');
					   				  });
			   		  			}
			   		  			if(data==1){
			   		  			　//layer.msg('邮箱可以用 ');
			   		  			}
			                 } ,
			                 error:function(data){
			                	 layer.msg('网络错误 ');
			                 }
			        });
			})
			
			$("#username").blur(function(){
				var	e  = $("#username").val();
				if(e==''){
					 layer.msg('用户名不能为空 ');
					 return false;
				}
				 $.ajax({
			       	  url:"userContrl.do",
			       	  data:{"param":"checkUsername","user.userName":e},
			       	  type:"post",
			       	  async:true,
			          dataType:"json",//返回的数据类型
			       	  success:function(data)
			                 {
			   		  			if(data==0){
					   				 	 layer.msg('用户名已经被人使用，请修改用户名', {
					   				   	 time: 2000, //2s后自动关闭
					   				 	 });
					   				 	$("#username").val('');
			   		  			}
			   		  			if(data==1){
			   		  			        //	 layer.msg('用户名可以用 ');
			   		  			}
			                 } ,
			                 error:function(data){
			                	 layer.msg('网络错误 ');
			                 }
			        });
			})
			

			
			$("#loginuser").click(function(){
			  	 
				  var value1=$("#email").val();
			      var value2=$("#password").val();
			      if (value1==''|| value2=='') {  
			      layer.msg("账号和密码不能为空！");
			        	return false;  
			      }
			      
			 	  $.ajax({
		       	  url:"login.do",
		       	  data:{"security.securityEmail":value1,"security.password":value2},
		       	  type:"post",
		       	  async:true,
		          dataType:"json",//返回的数据类型
		       	  success:function(data)
		                 {
		   		  			if(data==null){
		   		  			　 layer.msg('账号或者密码错误');
		   		  			}else{
				   		      　　layer.msg('你好 '+data.userName+'，欢迎回来! ');
				   		　　  　window.history.back();location.reload();
		       			    }
		                 } ,
		                 error:function(data){
		                	 layer.msg('登录失败请重试！! ');
		                 }
		        });
			  
		  });
		  
			
		  $('.login').click(function(){
			  $('#c').attr("disabled","disabled");
					  if($("#agree").is(':checked')){
						    var u = $("#username").val();
						  	var	e  = $("#email1").val();
						  	var	p1 = $("#password1").val();
						  	var p2 = $("#password2").val();
						  	var code = $("#emailCode").val();
						  	if(u==''){
						  		 layer.msg("用户名不能为空！");
						  		 $('#c').removeAttr("disabled"); 
				  				return false;
						  	}
						  	if(p1==''||p2==''){
						  		layer.msg("请输入密码！");
						  		 $('#c').removeAttr("disabled"); 
				  				return false;
						  	}
						  	if(p1!=p2){
				  				layer.msg("两次输入的密码不一样,请检查！");
				  				 $('#c').removeAttr("disabled"); 
				  				return false;
				  			}
						  	if(code==''){
				  				layer.msg("请输入验证码!!!！");
				  				 $('#c').removeAttr("disabled"); 
				  				return false;
				  			}
					  			
						  	 $.ajax({
						       	  url:"register.do",
						       	  data:{"security.securityEmail":e,"security.password":p1,"mailInfo.codeMd5":code,"user.userName":u},
						       	  type:"post",
						       	  async:true,
						          dataType:"json",//返回的数据类型
						       	  success:function(data)
						                 {
						   		  			if(data==0){
						   		  			　 layer.msg('请输入验证码！');
						   		  		      $('#c').removeAttr("disabled"); 
						   		  			}
						   		  			if(data==1){
						   		  			　 layer.msg('验证码错误！');
						   		  		      $('#c').removeAttr("disabled"); 
						   		  			}
						   		  			if(data==2){
						   		  			　 layer.msg('注册成功！');
						   		  			  window.location.href="user.do";
						   		  			 }
						                  } ,
						                 error:function(data){
						                	 layer.msg('请检查你的邮箱正确性! ');
						                	 $('#c').removeAttr("disabled"); 
						                 }
						        });

					  }else{
					    layer.msg("请同意协议！");
					    $('#c').removeAttr("disabled"); 
					  }
			  		
				});
});

	
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

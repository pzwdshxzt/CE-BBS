 $(document).ready(function(){
	
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
		   		  			     //    layer.msg('用户名可以用 ');
		   		  			}
		                 } ,
		                 error:function(data){
		                	 layer.msg('网络错误 ');
		                 }
		        });
		})
		
	 
	 
	 $("#userBase").click(function(){	
			 $('#userBase').attr("disabled","disabled");
		       //	$('#userBase').removeAttr("disabled");
				var hide = 0;
				if($("#checkboxu").is(':checked')){
					hide = 1;//隐藏
				}
				var userName = $("#username").val();
				var birthDay = $("#birthday").val();
				var sex = $('input:radio:checked').val();
				var address = $("#address").val();
				
				if(userName==''){
					layer.msg('请填写你的用户名');
					$('#userBase').removeAttr("disabled");
					return false;
				}
				if(birthDay==''){
					layer.msg('请填写你的生日');
					$('#userBase').removeAttr("disabled");
					return false;
				}
				if(address==''){
					layer.msg('请填写你的地址');
					$('#userBase').removeAttr("disabled");
					return false;
				}
				if(sex==null){
					layer.msg('请选择你的性别');
					$('#userBase').removeAttr("disabled");
					return false;
				}
				
				$.ajax({
			       	  url:"userContrl.do?param=updateUser",
			       	  data:{"user.hide":hide,"user.userName":userName,"user.birthDay":birthDay,"user.address":address,"user.sex":sex},
			       	  type:"post",
			       	  async:true,
			          dataType:"json",//返回的数据类型
			       	  success:function(data)
			                 {
			   		  			if(data==1){
			   		  			　 layer.msg('修改成功！');
			   		  			}
			   		  			if(data==0){
			   		  			　 layer.msg('修改失败！');
			   		  			}
			                  } ,
			                 error:function(data){
			                	 layer.msg('修改出错，请重试');
			                	 $('#userBase').removeAttr("disabled"); 
			                 }
			        });	
				
	 		});
	 
	 		
	 	 $("#checkCode1").click(function(){	
	 		var email5 = $("#email5").val();
			var emailCode1 = $("#emailCode1").val();
			if(email5==''){
					layer.msg('请填写你的邮箱');
					return false;
				}
			if(emailCode1==''){
					layer.msg('请填写你的收到得验证码');
					return false;
				}
			 $.ajax({
    		       	  url:"checkEmailCode.do",
    		       	  data:{"mailInfo.codeMd5":emailCode1},
    		       	  type:"post",
    		       	  async:true,
    		          dataType:"json",//返回的数据类型
    		       	  success:function(data){
    		   		  			if(data==0){
    		   		  			   layer.msg('请输入邮箱！');
    		   		  			}
    		   		  			if(data==1){
     		   		  			　  layer.msg('验证码错误');
     		   		  			}
	    		   		  		
    		   		  			if(data==2){
	  		   		  			　  layer.msg('正确！');
	  		   		  			  //弹出model
	  		   		  			  $('#emailCheck').modal('hide');
	  		   		  			  $('#emailModel').modal('show');
	  		   		  			}
    		   		  			
    		       	  		} ,
	                 error:function(data){
	                	 layer.msg('验证失败请重试！! ');
	                 }
	         });
			
	 	 });
	 	 
	 	 $("#checkCode2").click(function(){	
		 		var email5 = $("#email6").val();
				var emailCode2 = $("#emailCode2").val();
				if(email5==''){
						layer.msg('请填写你的邮箱');
						return false;
					}
				if(emailCode1==''){
						layer.msg('请填写你的收到得验证码');
						return false;
					}
				 $.ajax({
	    		       	  url:"checkEmailCode.do",
	    		       	  data:{"mailInfo.codeMd5":emailCode2},
	    		       	  type:"post",
	    		       	  async:true,
	    		          dataType:"json",//返回的数据类型
	    		       	  success:function(data){
	    		   		  			if(data==0){
	    		   		  			   layer.msg('请输入邮箱！');
	    		   		  			}
	    		   		  			if(data==1){
	     		   		  			　  layer.msg('验证码错误');
	     		   		  			}
		    		   		  		if(data==2){
		  		   		  			　  layer.msg('正确！');
		  		   		  			  //弹出model
		  		   		  			  $('#telEmailCheck').modal('hide');
		  		   		  			  $('#telUpdate').modal('show');
		  		   		  			}
	    		   		  			
	    		       	  		} ,
		                 error:function(data){
		                	 layer.msg('验证失败请重试！! ');
		                 }
		         });
				
		 	 });
	 	 
	 	$("#email7").blur(function(){
			var	e  = $("#email7").val();
			 $.ajax({
		       	  url:"userContrl.do",
		       	  data:{"param":"checkEmail","security.securityEmail":e},
		       	  type:"post",
		       	  async:true,
		          dataType:"json",//返回的数据类型
		       	  success:function(data)
		                 {
		   		  			if(data==0){
			   		  			layer.msg("邮箱已经被人绑定")
			   				 	$("#email7").val('');
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
		
	 
		 $("#newTelUpdate").click(function(){	
			 var tel = $("#newTel").val();
			 if(tel==''){
				 layer.msg('手机不能为空！');
			 }
			 if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(tel))){ 
			        layer.msg("不是完整的11位手机号或者正确的手机号前七位"); 
			        return false; 
			    } 
			 
			 $.ajax({
		       	  url:"userContrl.do?param=updateTel",
		       	  data:{"security.securityTEL":tel},
		       	  type:"post",
		       	  async:true,
		          dataType:"json",//返回的数据类型
		       	  success:function(data)
		                 {
		   		  			if(data==2){
		   		  			　 layer.msg('修改成功！');
		   		  			 $('#telUpdate').modal('hide');
		   		  			}
		   		  			if(data==0){
		   		  			　 layer.msg('请输入电话号码');
		   		  			}
		   		  			if(data==1){
		   		  			　 layer.msg('修改失败请重试');
		   		  			}
		                  } ,
		                 error:function(data){
		                	 layer.msg('网络出错');
		                	 $('#lifeEdu').removeAttr("disabled"); 
		                 }
		        });	
		 })
	 	 
	 	 $("#newEmailCheckCode").click(function(){	
		 		var email7 = $("#email7").val();
				var emailCode3 = $("#emailCode3").val();
				if(email7==''){
						layer.msg('请填写你的邮箱');
						return false;
					}
				if(emailCode3==''){
						layer.msg('请填写你的收到得验证码');
						return false;
					}
				 $.ajax({
	    		       	  url:"checkEmailCode.do?param=newEmail",
	    		       	  data:{"mailInfo.codeMd5":emailCode3,"mailInfo.toEmail":email7},
	    		       	  type:"post",
	    		       	  async:true,
	    		          dataType:"json",//返回的数据类型
	    		       	  success:function(data){
	    		   		  			if(data==0){
	    		   		  			   layer.msg('数据更新失败');
	    		   		  			}
	    		   		  			if(data==1){
	     		   		  			　  layer.msg('验证码错误');
	     		   		  			}
	    		   		  			if(data==2){
	     		   		  			　  layer.msg('修改未成功');
	     		   		  			}
		    		   		  		if(data==3){
		  		   		  			　  layer.msg('修改成功');
		  		   		  			  //弹出model
		  		   		  			  $('#emailModel').modal('hide');
		  		   		  			}
	    		   		  			
	    		       	  		} ,
		                 error:function(data){
		                	 layer.msg('验证失败请重试！! ');
		                 }
		         });
				
		 	 });
	 
		 $("#lifeEdu").click(function(){	
			 $('#lifeEdu').attr("disabled","disabled");
			 
			 var hide = 0;
			 if($("#checkboxx").is(':checked')){
				 hide = 1;//隐藏
			 }
			 var school = $("#school").val();
			 var education = $("#education").val();
			 if(school==''){
					layer.msg('请填写你的学校');
					$('#lifeEdu').removeAttr("disabled");
					return false;
				}
			 if(education==''){
					layer.msg('请填写你的学历');
					$('#lifeEdu').removeAttr("disabled");
					return false;
				}
				$.ajax({
			       	  url:"userContrl.do?param=updateLifeEdu",
			       	  data:{"lifeEdu.hide":hide,"lifeEdu.education":education,"lifeEdu.school":school},
			       	  type:"post",
			       	  async:true,
			          dataType:"json",//返回的数据类型
			       	  success:function(data)
			                 {
			   		  			if(data==1){
			   		  			　 layer.msg('修改成功！');
			   		  			}
			                  } ,
			                 error:function(data){
			                	 layer.msg('数值太长或者修改错误请重试！ ');
			                	 $('#lifeEdu').removeAttr("disabled"); 
			                 }
			        });	
		 });
		 $("#exChange").click(function(){	
			 $('#exChange').attr("disabled","disabled");
			 
			 var hide = 0;
			 if($("#checkboxx").is(':checked')){
				 hide = 1;//隐藏
			 }
			 var qq = $("#qq").val();
			 var weChat = $("#weChat").val();
			 var tel = $("#tel").val();
			 var email = $("#email1").val();
			 if(qq==''){
					layer.msg('请填写你的qq号码');
					$('#exChange').removeAttr("disabled"); 
					return false;
			 }
			 if(weChat==''){
					layer.msg('请填写你的weChat');
					$('#exChange').removeAttr("disabled"); 
					return false;
			 }
			 if(tel==''){
					layer.msg('请填写你的电话号码');
					$('#exChange').removeAttr("disabled"); 
					return false;
			 }
			 if(email==''){
					layer.msg('请填写你的邮件');
					$('#exChange').removeAttr("disabled"); 
					return false;
			 }
			 
			 $.ajax({
		       	  url:"userContrl.do?param=updateExChange",
		       	  data:{"exChange.hide":hide,"exChange.qq":qq,"exChange.weChat":weChat,"exChange.tel":tel,"exChange.email":email},
		       	  type:"post",
		       	  async:true,
		          dataType:"json",//返回的数据类型
		       	  success:function(data)
		                 {
		   		  			if(data==1){
		   		  			　 layer.msg('修改成功！');
		   		  			}
		                  } ,
		                 error:function(data){
		                	  layer.msg(' ');
		                	  $('#exChange').removeAttr("disabled"); 
		                 }
		        });	
		 });
		 $("#checkboxm").click(function(){	
			 if($("#checkboxm").is(':checked')){
				 $("#lifeWorkContent").css("visibility","visible");
					 $.post("userContrl.do?param=updateLifeWorkIsWorkFlag", function(data) {
						 if(data==1){
		   		  			　 layer.msg('有工作');
		   		  			}
						 if(data==0){
							 layer.msg('打开失败');
						 }
						});
			 }else{
				 $("#lifeWorkContent").css("visibility","hidden");
				 $.post("userContrl.do?param=updateLifeWorkIsWorkFlag", function(data) {
					 if(data==1){
	   		  			　 layer.msg('没有工作');
	   		  			}
					 if(data==0){
						 layer.msg('关闭失败');
					 }
					});
			 }
		 })
		 
		  $("#updatePassWord").click(function(){	
			  var oidPassWord = $("#oidPassWord").val();
			  var newPassWord = $("#newPassWord").val();
			  var againPassWord = $("#againPassWord").val();
			  if(oidPassWord==''){
				  layer.msg('请输入旧密码');
				  return false;
			  }
			  if(newPassWord==''){
				  layer.msg('请输入新密码');
				  return false;
			  }
			  if( againPassWord==''){
				  layer.msg('请再次输入密码');
				  return false;
			  }
			  if(newPassWord!==againPassWord){
				  layer.msg('两次输入密码不一致');
				  return false;
			  }
			  $.ajax({
		       	  url:"userContrl.do?param=checkPassWord",
		       	  data:{"security.password":oidPassWord},
		       	  type:"post",
		       	  async:false,
		          dataType:"json",//返回的数据类型
		       	  success:function(data)
		                 {
		   		  			if(data==1){
		   		  				//updatePassWord
		   		  			　	 layer.msg('密码修改中',{time: 2000});
		   		  			　	  $.ajax({
				   			       	  url:"userContrl.do?param=updatePassword",
				   			       	  data:{"security.password":newPassWord}, 
				   			       	  type:"post",
				   			       	  async:false,
				   			          dataType:"json",//返回的数据类型
				   			       	  success:function(data)
				   			                 {
				   			   		  			if(data==1){
				   			   		  			　 layer.msg('修改成功');
				   			   		  			}
						   			   		  	if(data==0){
					   			   		  		   layer.msg('修改出错');
					   			   		  		}
				   			                  },
				   			          error:function(data){
				   			                	  layer.msg('修改出错2');
				   			                 }
				   			        });	
		   		  			}
		   		  			if(data==0){
		   		  			　 layer.msg('原密码错误',{time: 2000});
		   		  			}
		                  } ,
		                 error:function(data){
		                	  layer.msg('修改出错请重试');
		                 }
		        });	
			  
		  });
		 
		 
		 
		 $("#lifeWork").click(function(){	
			 $('#lifeWork').attr("disabled","disabled");
			 var isWork = 1;
			 var hide = 0;
			 if($("#checkboxg").is(':checked')){
				 hide = 1;//隐藏
			 }
			 var company = $("#company").val();
			 var department = $("#department").val();
			 var position = $("#position").val();
			 if(company==''){
					layer.msg('请填写你的工作公司');
					$('#lifeWork').removeAttr("disabled"); 
					return false;
			 }
			 if(department==''){
					layer.msg('请填写你的所在部门');
					$('#lifeWork').removeAttr("disabled"); 
					return false;
			 }
			 if(position==''){
					layer.msg('请填写你的职位');
					$('#lifeWork').removeAttr("disabled"); 
					return false;
			 }
			 $.ajax({
		       	  url:"userContrl.do?param=updateLifeWork",
		       	  data:{"lifeWork.hide":hide,"lifeWork.isWork":isWork,"lifeWork.company":company,"lifeWork.department":department,"lifeWork.position":position},
		       	  type:"post",
		       	  async:true,
		          dataType:"json",//返回的数据类型
		       	  success:function(data)
		                 {
		   		  			if(data==1){
		   		  			　 layer.msg('修改成功！');
		   		  			}
		                  } ,
		                 error:function(data){
		                	  layer.msg('修改出错请重试');
		                	  $('#lifeWork').removeAttr("disabled"); 
		                 }
		        });	
 
		 })
});
		function showLayer(){
				layer.open({
					 title: '修改头像',
					 type: 2,
					 area: ['800px', '800px'],
					 shadeClose: true, //点击遮罩关闭
					 content: 'jsp/uploadImage.jsp',
					 end: function () {
						 document.location.reload();//当前
		    		 }		 
					});
			}
		
		var countdown=60;
		
		function settime1(obj) {
			 if (countdown == 0) {
             	 obj.removeAttribute("disabled");
                 obj.value="发送邮件";
                 countdown = 60 ;
                 return false;
             } else {
            	 if(countdown == 60){
             		var value1=$("#email5").val();
  	       	      	if (value1=='') {  
  	       		          layer.msg("邮箱不能为空！");
  	       		        	return false;  
  	       		        }
  	       	      	 $.ajax({
  	       		       	  url:"sendEmail.do?param=checkEmail",
  	       		       	  data:{"mailInfo.toEmail":value1},
  	       		       	  type:"post",
  	       		       	  async:true,
  	       		          dataType:"json",//返回的数据类型
  	       		       	  success:function(data){
  	       		   		  			if(data==0){
	  	       		   		  			　  layer.msg('请输入邮箱');
		     	       		   		  	   obj.removeAttribute("disabled");
		     	                           obj.value="发送邮件";
		     	                           countdown = 0;
  	       		   		  			}
		  	       		   		  	if(data==1){
		      		   		  			　  layer.msg('邮箱错误');
		     	       		   		  	   obj.removeAttribute("disabled");
		     	                           obj.value="发送邮件";
		     	                           countdown = 0;
		      		   		  			}
  	       				   			if(data==2){
	     	       				   		   obj.setAttribute("disabled", true);
	     			   		  			　  layer.msg('已为你发送邮件!请注意查收!发件人:ce-bbs@qq.com!');
	     			   		  	           countdown = 0; 
         			   		  		   }
  	       		                 } ,
  	       		                 error:function(data){
  	       		                	 layer.msg('发送失败请重试！! ');
	  	       		                 obj.removeAttribute("disabled");
	  	                             obj.value="发送邮件";
	  	                             countdown = 0;
  	       		                 }
  	       		         });
             	}
            	 
            	 obj.value="重新发送(" + countdown + ")";
                 countdown--;
             }
		    setTimeout(function(){
             	settime1(obj);
             	},1000);
		}
		
		function settime2(obj) {
			 if (countdown == 0) {
            	 obj.removeAttribute("disabled");
                obj.value="发送邮件";
                countdown = 60 ;
                return false;
            } else {
           	 if(countdown == 60){
            		var value1=$("#email6").val();
 	       	      	if (value1=='') {  
 	       		          layer.msg("邮箱不能为空！");
 	       		        	return false;  
 	       		        }
 	       	      	 $.ajax({
 	       		       	  url:"sendEmail.do?param=telCheckEmail",
 	       		       	  data:{"mailInfo.toEmail":value1},
 	       		       	  type:"post",
 	       		       	  async:true,
 	       		          dataType:"json",//返回的数据类型
 	       		       	  success:function(data){
 	       		   		  			if(data==0){
	  	       		   		  			　  layer.msg('请输入邮箱');
		     	       		   		  	   obj.removeAttribute("disabled");
		     	                           obj.value="发送邮件";
		     	                           countdown = 0; 
 	       		   		  			}
		  	       		   		  	if(data==1){
		      		   		  			　  layer.msg('邮箱错误');
		     	       		   		  	   obj.removeAttribute("disabled");
		     	                           obj.value="发送邮件";
		     	                           countdown = 0; 
		      		   		  			}
 	       				   			if(data==2){
	     	       				   		   obj.setAttribute("disabled", true);
	     			   		  			　  layer.msg('已为你发送邮件!请注意查收!发件人:ce-bbs@qq.com!');
	     			   		  		       countdown = 0; 
        			   		  		   }
 	       		                 } ,
 	       		                 error:function(data){
 	       		                	 layer.msg('发送失败请重试！! ');
	 	       		                 obj.removeAttribute("disabled");
	   	                             obj.value="发送邮件";
	   	                             countdown = 0; 
 	       		                 }
 	       		         });
            	}
           	 obj.value="重新发送(" + countdown + ")";
                countdown--;
            }
		    setTimeout(function(){
            	settime2(obj);
            	},1000);
		}
		
		function settime3(obj) {
			 if (countdown == 0) {
           	   obj.removeAttribute("disabled");
               obj.value="发送邮件";
               countdown = 60 ;
               return false;
           } else {
          	 if(countdown == 60){
           		var value1=$("#email7").val();
	       	      	if (value1=='') {  
	       		          layer.msg("邮箱不能为空！");
	       		        	return false;  
	       		        }
	       	      	 $.ajax({
	       		       	  url:"sendEmail.do?param=newEmail",
	       		       	  data:{"mailInfo.toEmail":value1},
	       		       	  type:"post",
	       		       	  async:true,
	       		          dataType:"json",//返回的数据类型
	       		       	  success:function(data){
		  	       		   		  	if(data==1){
		      		   		  			　  layer.msg('邮箱错误');
		     	       		   		  	   obj.removeAttribute("disabled");
		     	                           obj.value="发送邮件";
		     	                           countdown = 0; 
		      		   		  			}
	       				   			if(data==2){
	     	       				   		   obj.setAttribute("disabled", true);
	     			   		  			　  layer.msg('已为你发送邮件!请注意查收!发件人:ce-bbs@qq.com!');
	     			   		  			   countdown = 0; 
       			   		  		   }
	       		                 } ,
	       		                 error:function(data){
	       		                	 layer.msg('发送失败请重试！! ');
	 	       		                 obj.removeAttribute("disabled");
	   	                             obj.value="发送邮件";
	   	                             countdown = 0; 
	       		                 }
	       		         });
           	}
          	 obj.value="重新发送(" + countdown + ")";
               countdown--;
           }
		    setTimeout(function(){
           	settime2(obj);
           	},1000);
		}
		
		

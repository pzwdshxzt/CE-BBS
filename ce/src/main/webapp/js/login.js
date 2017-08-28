function loginSys(){
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
		   		　　　 document.getElementById("logincontroller").style.display="none";
		   			　document.location.reload();
       			    }
                 } ,
                 error:function(data){
                	 layer.msg('登录失败请重试！! ');
                 }
        });
	}
	function exitSys(){
		$.post("exitCe.do", function(data) {
			 layer.msg('再见 ， '+data);
			  document.getElementById("logincontroller").style.display="";
			  document.location.reload();
			});
	}
	
	function hello() 
	{
		
		$.post("checkLogin.do", function(data) {
			if(data==0){
					$("#logincontroller").hide();
				}
			if(data==1){
					$("#logincontroller").show();
			}
			});	
	} 
	window.onload = hello;
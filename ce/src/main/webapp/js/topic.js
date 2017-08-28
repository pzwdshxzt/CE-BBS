$(document).ready(function(){
			 $("#topicAdd").click(function(){	
				 $.post("checkLogin.do", function(data) {
						if(data==0){
								$("#addTopic").modal('show');
							}
						if(data==1){
							layer.msg("请先登陆");
							window.location.href='login.jsp';
						}
						});	
			 });
				$("#title").blur(function(){
					var t=$("#title").val();
					$('#model-addTopic').removeAttr("disabled"); 
					if(t.length>30){
						layer.msg("标题太长了，控制在30字以内");
						$('#model-addTopic').attr("disabled","disabled");
					}
				});
				
				$("#content").blur(function(){
					var c=$("#content").val();
					$('#model-addTopic').removeAttr("disabled"); 
					if(c.length>300){
						layer.msg("内容太长了，控制在300字以内");
						 $('#model-addTopic').attr("disabled","disabled");
					}
				});
				
				$("#model-addTopic").click(function(){	
					var c=$("#content").val();
					var t=$("#title").val();
					var f=$("#flateId").val();
					if(c.length>300){
						layer.msg("内容太长了，控制在300字以内");
						 $('#model-addTopic').attr("disabled","disabled");
						 return false;
					}
					if(t.length>30){
						layer.msg("标题太长了，控制在30字以内");
						$('#model-addTopic').attr("disabled","disabled");
						 return false;
					}
					layer.msg(f);
					
					 $.ajax({
				       	  url:"topicController.do?param=addTopic",
				       	  data:{"topic.title":t,"topic.content":c,"flate.flateId":f},
				       	  type:"post",
				       	  async:false,
				          dataType:"json",//返回的数据类型
				       	  success:function(data)
				                 {
				   		  			if(data==1){
					   		  		    layer.msg('发布成功！');
					   		  		    document.location.reload();//当前
				   		  			}
				   		  			if(data==2){
					   		  			layer.msg("请先登陆");
										window.location.href='login.jsp';
				   		  			}
				                  } ,
				          error:function(data){
				                	  layer.msg('发布话题失败请重试');
				                	  $('#model-addTopic').removeAttr("disabled"); 
				                 }
				        });	
					
				});
		})
	
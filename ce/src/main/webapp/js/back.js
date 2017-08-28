		function wacthFlate(id){
  			$.ajax({
   				url:"zbkController.do?param=watch",
   				data:{"flate.flateId":id},
   				type:"post",
   				async:true,
   				dataType:"json",
   				success:function(data){		
 					layer.tips(data.flateName+"主要介绍:"+data.flateContent, $("#"+id+"bk"), {
 					  tips: [1, '#3595CC'],
 					  time: 4000
 					});   					
   			   }
   		     })
  		}
		
		function wacthTopic(id){
  			$.ajax({
   				url:"htglController.do?param=watch",
   				data:{"topic.topicId":id},
   				type:"post",
   				async:true,
   				dataType:"json",
   				success:function(data){		
 					layer.tips("标题:"+data.title, $("#"+id+"topic"), {
 					  tips: [2, '#3595CC'],
 					  time: 4000
 					});   					
   			   }
   		     })
  		}
  		function wacthUser(id){
  			$.ajax({
   				url:"userContrl.do?param=watch",
   				data:{"user.userId":id},
   				type:"post",
   				async:true,
   				dataType:"json",
   				success:function(data){		
 					layer.tips("用户名:"+data.userName, $("#"+id+"user"), {
 					  tips: [2, '#3595CC'],
 					  time: 4000
 					});   					
   			   }
   		     })
  		}
  		 function show(id1){			
				$.ajax({
				url:"htglController.do?param=show",
				data:{"topic.topicId":id1},
				type:"post",
				async:true,
				dataType:"json",
				success:function(data){	
					$("#myModalLabel").empty(); 
					$("#mybody").empty();
					$("#myModalAuthor").empty();
					if (data.length == 0) {  
						$("#myModalLabel").append("没有数据！");
						$("#mybody").append("没有数据！");  
	                return false;  
	         }
					$("#myModalLabel").append(data.title);
					$("#mybody").append(data.content);  
					$('#myModal').modal('show');
			   },
			 	error: function(e) { 
			 	   layer.msg("发生了一点错误！");
				} 
		    });
	}
 		
   		function changeStick(id,state){
   			 $.ajax({
  				url:"htglController.do?param=stick",
  				data:{"topic.topicId":id,"topic.state":state},
  				type:"post",
  				async:true,
  				dataType:"json",
  				success:function(data){	
  					if (data.length == 0) {  
  						layer.msg("修改失败！"); 
  					}else{
  						if(data.state==1){
  							layer.msg("标题为 →"+data.title+"置顶成功↑！");
  						}
  						if(data.state==0){
  							layer.msg("标题为 →"+data.title+"取消置顶成功！");
  						}
  					}
  					document.location.reload();//当前
  			   }
  		     })
   		}
  
   		function deleteEntity(id2){
   			layer.confirm('是否删除？', {
   		 	 btn: ['是','否'] //按钮
   			}, function(){
   		 	 $.ajax({
    				url:"htglController.do?param=delete",
    				data:{"topic.topicId":id2},
    				type:"post",
    				async:true,
    				dataType:"json",
    				success:function(data){							
    				 layer.msg('删除成功', {
    		  		   	 time: 2000, //2s后自动关闭
    		  		 	 });
    				 document.location.reload();
    			   }
    		     })
   			}, function(){
   		 	 layer.msg('删除取消', {
   		   	 time: 2000, //2s后自动关闭
   		 	 });
   		  });
   		}
   		
   		function changeFlag(id2,findFlag){
   			layer.confirm('是否继续？', {
   		 	 btn: ['是','否'] //按钮
   			}, function(){
   		 	
   			$.ajax({
    				url:"htglController.do?param=changeFindFlag",
    				data:{"topic.topicId":id2,"topic.findFlag":findFlag},
    				type:"post",
    				async:true,
    				dataType:"json",
    				success:function(data){							
    					if (data.length == 0) {  
  						layer.msg("修改失败！"); 
  					}else{
  						if(data.findFlag==1){
  							layer.msg("成功加到首页发现！");
  						}
  						if(data.findFlag==0){
  							layer.msg("从首页移除成功！");
  						}
  					}
    				 document.location.reload();
    			   }
    		     })
   			}, function(){
   		 	 layer.msg('取消添加', {
   		   	 time: 2000, //2s后自动关闭
   		 	 });
   		  });
   		}
   		
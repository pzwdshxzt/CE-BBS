$(document).ready(function(){

		$("#againx").blur(function(){
			var a=$("#againx").val();
			var p=$("#adminpass").val();
			if(a != p){
				 $('#add').attr("disabled","disabled");
				 layer.msg("输入得密码不一样");
			}
			
			if(a == p){
				 $('#add').removeAttr("disabled"); 
			 }
		});
		
		$("#adminname").blur(function(){
			var u=$("#adminname").val();
			if(u==''){
				$('#add').attr("disabled","disabled");
				layer.msg("用户名不能为空");
			}
			if(u!=''){
				$('#add').removeAttr("disabled"); 
			}
		});
		
		
		$("#add").click(function(){
			var a=$("#againx").val();
			var p=$("#adminpass").val();
			var u=$("#adminname").val();
			if(u==''){
				$('#add').attr("disabled","disabled");
				layer.msg("用户名不能为空");
				return false;
			}
			if(p==''||a==''){
				$('#add').attr("disabled","disabled");
				layer.msg("密码不能为空");
				return false;
			}
			if(a != p){
				$('#add').attr("disabled","disabled");
				layer.msg("输入得密码不一样");
				return false;
			}
			
			  $.ajax({
		       	  url:"adminContrl.do?param=add",
		       	  data:{"admin.username":u,"admin.password":p},
		       	  type:"post",
		       	  async:true,
		          dataType:"json",//返回的数据类型
		       	  success:function(data)
		                 {
		   		  			if(data==null){
		   		  			　 layer.msg('添加失败');
		   		  			}else{
				   		      　　layer.msg('添加成功 ');
				   		       document.location.reload();//当前
		       			    }
		                 } ,
		                 error:function(data){
		                	 layer.msg('登录失败请重试！! ');
		                 }
		        });
			  
			
		});
})	

function deleteEntity(id2){
		layer.confirm('是否删除？', {
	 	 btn: ['是','否'] //按钮
		}, function(){
	 	 $.ajax({
			url:"adminContrl.do?param=delete",
			data:{"admin.adminId":id2},
			type:"post",
			async:true,
			dataType:"json",
			success:function(data){							
			 layer.msg('删除成功', {
	  		   	 time: 2000, //2s后自动关闭
	  		 	 });
			document.location.reload();//当前
		   }
	     })
		}, function(){
	 	 layer.msg('删除取消', {
	   	 time: 2000, //2s后自动关闭
	 	 });
	  });
	}

function upgradeEntity(id2){
	layer.confirm('是否将管理员升级？', {
 	 btn: ['是','否'] //按钮
	}, function(){
 	 $.ajax({
		url:"adminContrl.do?param=upgrade",
		data:{"admin.adminId":id2},
		type:"post",
		async:true,
		dataType:"json",
		success:function(data){							
		 layer.msg('升级成功', {
  		   	 time: 2000, //2s后自动关闭
  		 	 });
		document.location.reload();//当前
	   }
     })
	}, function(){
 	 layer.msg('升级取消', {
   	 time: 2000, //2s后自动关闭
 	 });
  });
}

function degradeEntity(id2){
	layer.confirm('是否将这个管理员降级？', {
 	 btn: ['是','否'] //按钮
	}, function(){
 	 $.ajax({
		url:"adminContrl.do?param=degrade",
		data:{"admin.adminId":id2},
		type:"post",
		async:true,
		dataType:"json",
		success:function(data){							
		 layer.msg('降级成功', {
  		   	 time: 2000, //2s后自动关闭
  		 	 });
		document.location.reload();//当前
	   }
     })
	}, function(){
 	 layer.msg('降级取消', {
   	 time: 2000, //2s后自动关闭
 	 });
  });
}
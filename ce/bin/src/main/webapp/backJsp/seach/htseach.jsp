<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>子板块</title>
	<base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script> 
    <!-- Custom styles for this template -->
    <link href="css/dashboard.css" rel="stylesheet">
 	<script type="text/javascript" src="js/layer.js"></script> 

  </head>
  
   <script type="text/javascript">
  	
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
  					if (data.length == 0) {  
  						$("#myModalLabel").append("发生错误！");
  						 $("#mybody").append("发生错误！");  
                      return false;  
                  }
  					$("#myModalLabel").append(data.title);
  					$("#mybody").append(data.content);  
  					$('#myModal').modal('show');
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
 							layer.msg("置顶成功！");
 						}
 						if(data.state==0){
 							layer.msg("取消置顶成功！");
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
   				 parent.location.reload();
   			   }
   		     })
  			}, function(){
  		 	 layer.msg('删除取消', {
  		   	 time: 2000, //2s后自动关闭
  		 	 });
  		  });
  		}

  </script>	
  <body>
  	 <h3>&nbsp;&nbsp;Topic Manage &nbsp;&nbsp;</h3>	
  	<form class="form-inline" action="htglController.do?param=seach" method="post">
    	<input type="text" name="seach" class="form-control"  placeholder="标题/内容">
  		<button type="submit" class="btn btn-success">seach</button>
	</form>
  	 <table class="table table-hover table-striped">
  	 	<tr align="center">
  	 		<td>所属板块</td>
  	 		<td>话题名称</td>
  	 		<td>创建人</td>
  	 		<td>话题查看数量</td>
  	 		<td>话题回复数量</td>
  	 		<td>状态</td>
  	 		<td>操作</td>
  	 	</tr>
  	 	<c:forEach var="ht" items="${topics}">
    	<tr align="center">
    	<td>${ht.flate.flateName}</td>
    	<td>
    	<button type="button" onclick="show(${ht.topicId})" class="btn btn-primary btn-lg"  >
  			${ht.title}
	    </button>
    	</td> 
    	<td>${ht.user.userName}</td>   	
    	<td>${ht.lookNumber}</td>
    	<td>${ht.replyNumber}</td>
    	<td>
    		<c:if test="${ht.state == 0}">正常</c:if>
    		<c:if test="${ht.state == 1}">置顶</c:if>
    	</td>
        <td>
       		<c:if test="${ht.state == 0}">  <a id="${ht.topicId}" class="btn btn-warning" onclick="changeStick(${ht.topicId},${ht.state})" >置顶</a>&nbsp;</c:if>
      		<c:if test="${ht.state == 1}">  <a id="${ht.topicId}" class="btn btn-warning" onclick="changeStick(${ht.topicId},${ht.state})" >取消置顶</a>&nbsp;</c:if>
			  <a id="${ht.topicId}" class="btn btn-danger" onclick="deleteEntity(this.id)">删除</a>
		</td>
    	<tr>
        </c:forEach>
		
  	 	<tr align="center">
				<td colspan="8">
			
				</td>		
		</tr>
  	 </table>
  		
  	 	<nav aria-label="Page navigation " align="center">
  			<div class="message" >搜索到<i class="blue">${num}</i>条记录</div>
		</nav> 
		
		<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">
        	暂无标题！
        </h4>
      	</div>
      	<div  id="mybody" class="modal-body">
      		暂无信息！
      	</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
  </body>
  
  		
</html>

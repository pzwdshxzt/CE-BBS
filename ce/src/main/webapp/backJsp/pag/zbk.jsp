<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>板块</title>
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
  	
  		function test(){
				layer.open({
				 title: '添加板块',
					 type: 2,
					 area: ['800px', '800px'],
						 shadeClose: true, //点击遮罩关闭
						 content: 'backJsp/add/zbkadd.jsp',
						 end: function () {
							 document.location.reload();//当前
			   	    		 }		 
				});
  		}	
  		
  			function show(id1){			
  				$.ajax({
  				url:"zbkController.do?param=show",
  				data:{"flate.flateId":id1},
  				type:"post",
  				async:true,
  				dataType:"json",
  				success:function(data){							
  					layer.open({
	 				 title: '板块详情',
 	 				 type: 2,
 	 				 area: ['800px', '800px'],
    				 shadeClose: true, //点击遮罩关闭
    				 content: 'backJsp/show/zbkshow.jsp',
   				    });
  			   }
  		    });
    }
  		 
  		 function update1(id1){
  			$.ajax({
  				url:"zbkController.do?param=show",
  				data:{"flate.flateId":id1},
  				type:"post",
  				async:true,
  				dataType:"json",
  				success:function(data){
  				layer.open({
	 			 title: '修改版块',
 	 			 type: 2,
 	 			 area: ['800px', '800px'],
    			 shadeClose: true, //点击遮罩关闭
    			 content: 'backJsp/update/zbkupdate.jsp',
    			 end: function () {
    				 document.location.reload();//当前
          	      }	
   				 });
  				}
  			});
  		}  
  		 
  		function deleteEntity(id2){
  			layer.confirm('是否删除？', {
  		 	 btn: ['是','否'] //按钮
  			}, function(){
  		 	 $.ajax({
   				url:"zbkController.do?param=delete",
   				data:{"flate.flateId":id2},
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
  </script>	
  <body>
  	 <h3>&nbsp;&nbsp;Flate Manage &nbsp;&nbsp;  
	  	 <a id="id" class="btn btn-success" align="right" onclick="test()">Add Flate</a>	
	  	 <a onclick="document.location.reload();"  class="btn btn-success">refresh</a>
  	 </h3>	
  	 <table class="table table-hover table-striped">
  	 	<tr align="center">
  	 	    <td>版块Id</td>
  	 		<td>板块名称</td>
  	 		<td>板块关注数量</td>
  	 		<td>板块回复数量</td>
  	 		<td>板块话题数量</td>
  	 		<td>操作</td>
  	 	</tr>
  	 	<c:forEach var="bk" items="${flates}">
    	<tr align="center">
    	<td>${bk.flateId}</td>
    	<td>
		   	<a class="btn btn-primary" onclick="show(${bk.flateId})">${bk.flateName}</a> 
    	</td>   	
    	<td>${bk.fousNumber}</td>
    	<td>${bk.replyNumber}</td>
     	<td>${bk.topicNumber}</td>
        <td>
        	<a id="${bk.flateId}" class="btn btn-warning" onclick="update1(this.id)" >修改</a>&nbsp;
		    <a id="${bk.flateId}" class="btn btn-danger" onclick="deleteEntity(this.id)">删除</a>
		</td>
    	<tr>
        </c:forEach>
		
  	 	<tr align="center">
				<td colspan="8">
			
				</td>		
		</tr>
  	 </table>
  		
  	 	<nav aria-label="Page navigation " align="center">
  			<div class="message" >共<i class="blue">${pr.totalCount}</i>条记录，当前显示第&nbsp;<i class="blue">${pr.currentPage}&nbsp;</i>页,每页显示&nbsp;<i class="blue">${pr.pageSize}&nbsp;</i>条记录</div>
  			<ul class="pagination pagination-lg">
    			<c:if test="${pr.currentPage==1}">
    			<li class="disabled"><span aria-hidden="true">&laquo;</span></li>
    			</c:if>
    			<c:if test="${pr.currentPage >1 && pr.currentPage!=1 }">
    			<li class="active">
     				 <a href="zbkController.do?param=trunPag&pr.currentPage=${pr.currentPage-1}" aria-label="Previous">
       				 <span aria-hidden="true">&laquo;</span>
     				 </a>
    			</li>
    			</c:if>
   				 <li class="disabled"><a>${pr.currentPage}</a></li>
   				 <c:if test="${pr.currentPage+1 < pr.totalPage}">
   				 <li><a href="zbkController.do?param=trunPag&pr.currentPage=${pr.currentPage+1}">${pr.currentPage+1}</a></li>
   				   <li><a href="javascript:;">...</a></li>
   				  </c:if>
   				  <c:if test="${pr.currentPage != pr.totalPage}">
    			   <li><a href="zbkController.do?param=trunPag&pr.currentPage=${pr.totalPage}">${pr.totalPage}</a></li>
   				 
    			  </c:if>
    			  <c:if test="${pr.currentPage<pr.totalPage}">
   				 <li>
     			 <a href="zbkController.do?param=trunPag&pr.currentPage=${pr.currentPage+1}" aria-label="Next">
       			 <span aria-hidden="true">&raquo;</span>
     			 </a>
   				 </li>
   				 </c:if>
   				  <c:if test="${pr.currentPage>=pr.totalPage}">
   				   <li class="disabled"> <span aria-hidden="true">&raquo;</span></li>
   				  </c:if>
 			</ul>
		</nav> 
  </body>
  
  		
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 
  <head>
    <title>fkbadd</title>
  <base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/layer.js"></script> 
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<link href="css/jcrop/jquery.Jcrop.min.css" rel="stylesheet" type="text/css" />
	<script src="js/jcrop/jquery.Jcrop.min.js"></script>
	<script src="js/jcrop/script.js"></script>
  </head>
  <body>

<div class="pd-20">
    <form action="zbkController.do?param=update" method="post" enctype="multipart/form-data">
           <div style="text-align: center;margin:0 auto ">
    				<h2>板块添加</h2>
	          		<div class="form-group">
					    <label for="flateName">flateName/板块名称</label>
					    <input type="text" name="flate.flateName" class="form-control" id="flateName" value="${show.flateName}" placeholder="${show.flateName}">
					</div>
					
					<div class="form-group">
					    <label for="image_file">flateImage/板块图片</label>
					    <div class="mod-head" >
	                            <img  style=" width:100%;"  src="${show.imageUrl}" />
	                            <span class="pull-right operate"></span>
			            </div>
			            <div class="mod-head" >
	                            <img id="preview"  style=" width:100%;" />
	                            <span class="pull-right operate"></span>
			            </div>
					    <input style="text-align: center;margin:0 auto " type="file" id="image_file" name="image.filePhoto" onchange="fileSelectHandler()">
					    <p class="help-block">请鼠标圈选需要截图的部位,然后按上传！</p>
		    			<div class="error"  style="text-align:  center;margin:0 auto"></div>
		    			<div class="info">
						    <input type="hidden" id="x1"  name="image.x" />
		       				<input type="hidden" id="y1"  name="image.y"/>
		       				<input type="hidden" id="w"   name="image.width"/>
		                    <input type="hidden" id="h"   name="image.height" />
		                   	<input type="hidden" id="filename"  name="image.filePhotoFileName"/>
		                    <input type="hidden" name="flate.flateId" value="${show.flateId}" />
					     </div>
					</div>
    				
    				<div class="form-group">
					    <label for="flateContent">flateContent/板块说明</label>
					    <textarea rows="10px"  name="flate.flateContent" class="form-control" id="flateContent" >${show.flateContent}</textarea>
					</div>
    				
    			    <button class="btn btn-success">Submit</button>
    			</div>
        </form>
     </div>   
  </body>
</html>

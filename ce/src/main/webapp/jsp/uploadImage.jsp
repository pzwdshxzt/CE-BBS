<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传头像</title>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/default.css" rel="stylesheet" type="text/css" />
<link href="css/defaultlink.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<link href="css/jcrop/jquery.Jcrop.min.css" rel="stylesheet" type="text/css" />
<script src="js/jcrop/jquery.Jcrop.min.js"></script>
<script src="js/jcrop/script.js"></script>
<script src="js/layer.js" type="text/javascript"></script>

</head>
	<body>
		    <form action="userContrl.do?param=uploadImage" enctype="multipart/form-data" method="post">
	    			<div  class="step2"  style="text-align:  center;margin:0 auto">
		     					 <div class="mod-head" >
			                            <img id="preview"  style=" width:100%;" />
			                            <span class="pull-right operate"></span>
			                     </div>
			                    <div class="error"  style="text-align:  center;margin:0 auto"></div>
							    <label for="image_file">头像上传</label>
							    <input style="text-align: center;margin:0 auto " type="file" id="image_file" name="image.filePhoto" onchange="fileSelectHandler()" >
							    <div class="info">
								    <input type="hidden" id="x1"  name="image.x" />
			         				<input type="hidden" id="y1"  name="image.y"/>
			         				<input type="hidden" id="w"   name="image.width"/>
			                        <input type="hidden" id="h"   name="image.height" />
			                        <input type="hidden" id="filesize" />
				                   	<input type="hidden" id="filename"  name="image.filePhotoFileName"/>
				                    <input type="hidden" id="filedim" />
			                   	</div>
							    <p class="help-block">请鼠标圈选需要截图的部位,然后按上传！</p>
							    <input id="update" type="submit" class="btn btn-success"   value="修改"/>
					</div>
					   </form>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html>
<head>
<base href="<%=basePath%>">
<meta content="text/html;charset=utf-8" http-equiv="Content-Type" />
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta name="renderer" content="webkit" />
<meta name="keywords" content="CE,论坛"> 
<meta name="description" content="这是一个新的论坛，希望大家支持下！">
<meta name="author" content="hjx">
<link rel="icon" href="img/ce.png">
<title>${sessionScope.personMessage.userName}个人主页 - CE-BBS</title>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/default.css" rel="stylesheet" type="text/css" />
<link href="css/defaultlink.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/checkbox.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/user.js" type="text/javascript"></script>
<script src="js/login.js" type="text/javascript"></script>
<script src="js/layer.js" type="text/javascript"></script>
</head>
<noscript unselectable="on" id="noscript">
    <div class="aw-404 aw-404-wrap container">
        <img src="http://wenda.bootcss.com/static/common/no-js.jpg">
        <p>你的浏览器禁用了JavaScript, 请开启后刷新浏览器获得更好的体验!</p>
    </div>
</noscript>
<body>
	
<div class="page-header">
	</div>

	<div class="navbar-wrapper">
      <div class="container">
	        <nav class="navbar navbar-default  navbar-fixed-top" role="navigation">
	          <div class="container">
		            <div class="navbar-header">
			              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
			                <span class="sr-only">Toggle navigation</span>
			                <span class="icon-bar"></span>
			                <span class="icon-bar"></span>
			                <span class="icon-bar"></span>
			              </button>
		            	    <a class="navbar-brand">CE</a>
		            </div>
		             
		            <div id="navbar" class="navbar-collapse collapse">
			           		 <ul class="nav navbar-nav navbar-left">
					            	<li><a href="onload.do">首页</a></li>
					                <li><a href="bkController.do?param=onload">板块</a></li>
					                <li><a href="http://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&email=h_TiquXl9Mf29qnk6Oo" >联系我们</a></li>
			             	</ul>
				             <ul class="nav navbar-nav navbar-right">
					                <li class="dropdown" >
					                 	  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
					                 	    <img src="${sessionScope.personMessage.imageUrl}" width="20" height="20" class="img-circle" alt="Generic placeholder thumbnail"></a>
							                  <ul  class="dropdown-menu" role="menu">
							                  	  <li><a href="fous.do">关注信息</a></li>
								                  <li><a href="javascript:;" onclick="exitSys()">exit</a></li>
						                  	  </ul>
					                </li>
				             </ul>
		          	  </div>
	         	 </div>
	        </nav>
      </div>
</div>


	<!--页面下  -->
    <div class="container">
      <div class="row"> <!-- 页面分块 -->
        <!-- 左边导航 begin-->
        <div class="col-sm-3 col-md-2 sidebar">    <!-- 左边导航栅栏分 -->    
        <ul class="nav nav-pills nav-stacked "  role="tablist" id="myTab">
      		<li><a href="#txgl"  data-toggle="tab" >头像管理</a></li>
            <li class="active"><a href="#jcxx"  data-toggle="tab" >基础信息</a></li>
            <li><a href="#xlxx"  data-toggle="tab" >学历信息</a></li>
            <li><a href="#lxxx"  data-toggle="tab" >联系信息</a></li>
            <li><a href="#gzxx"  data-toggle="tab" >工作信息</a></li>
            <li><a href="#aqgl"  data-toggle="tab" >安全管理</a></li>
		</ul> 
        </div>  <!-- 左边导航 end-->
     
     	<!-- 右边内容显示 -->
        <div class="col-sm-offset-3 col-md-offset-2 main">
       	 <div  id="myTabContent" class="tab-content" >
			<!-- 基础板块 -->
		     <div role="tabpanel" class="tab-pane fade  in active" id="jcxx">
		    			<form>
		    			     <label for="checkboxu">是否隐藏</label>
		    			  
   							 <section class="model">
		    					 <div class="checkbox">
		    					 	<c:if test="${user.hide == 1}">  
							       		 <input id="checkboxu" type="checkbox" checked="checked" value="1" />
							        </c:if> 
							        <c:if test="${user.hide == 0}">    
									     <input id="checkboxu" type="checkbox" value="1" />
									</c:if> 
							        <label></label>
							     </div>
						     </section>
						    
						
							  <div class="form-group center-block">
							    <label for="username">UserName/用户名</label>
							    <input id="username" type="text" class="form-control" name="user.userName" value="${user.userName}" placeholder="${user.userName}">
							  </div>
							  <div class="form-group center-block">
							    <label for="birthday">BirthDay/生日</label>
							    <input id="birthday" type="date" class="form-control" name="user.birthDay" value='<fmt:formatDate value="${user.birthDay}" pattern="yyyy-MM-dd"/>'  >
							  </div>
							  <div id="wrap" class="center-block">
								  <label for="sex1">男</label>
									  <c:if test="${user.sex==0}">
									  <input id="sex1" type="radio" checked="checked" value='0' name="sex">
									  </c:if>
									   <c:if test="${user.sex!=0}">
									  <input id="sex1" type="radio"  value='0' name="sex">
									  </c:if>
								  <label for="sex">女</label>
								 	  <c:if test="${user.sex==1}">
								 	  <input id="sex"  type="radio" checked="checked" value='1' name="sex">
								 	  </c:if>
								 	   <c:if test="${user.sex!=1}">
								 	  <input id="sex"  type="radio" value='1' name="sex">
								 	  </c:if>
								  <label for="sex2">保密</label>
								  	  <c:if test="${user.sex==2}">
								  <input id="sex2" type="radio"  checked="checked" value='2'name="sex">
								  	  </c:if>
								  	  <c:if test="${user.sex!=2}">
								  <input id="sex2" type="radio"  value='2'name="sex">
								  	  </c:if>
							  </div>
							  <div  class="btn-group center-block" >
							   	<label for="address">Adderss/地址</label>
							    <input id="address" type="text" class="form-control" name="user.address" value="${user.address}" placeholder="${user.address}">
							  </div>
							   <div class="center-block">
							     <button  id="userBase" class="btn btn-success">修改</button>
							   </div>
						</form>
             </div>
     		<!-- 基础信息  end -->
     		 <!--  学历信息-->
     		 <div role="tabpanel" class="tab-pane fade" id="xlxx">
				 <form>
		    			  <label for="checkboxx">是否隐藏</label>		 
   							 <section class="model">
		    					 <div class="checkbox">
		    						 <c:if test="${lifeEdu.hide == 1}">
							       		 <input id="checkboxx"  checked="checked" type="checkbox"/>
							         </c:if>
							         <c:if test="${lifeEdu.hide == 0}">
							       		 <input id="checkboxx"  type="checkbox"/>
							         </c:if>
							        <label></label>
							     </div>
						     </section>
		    			 <div class="form-group center-block">
							    <label for="school">School/学校</label>
							    <input id="school" type="text" class="form-control"  value="${lifeEdu.school}" placeholder="${lifeEdu.school}">
					     </div>
					    
					     <div class="form-group center-block">
							    <label for="education">Education/学历</label>
							    <input id="education" type="text" class="form-control"  value="${lifeEdu.education}" placeholder="${lifeEdu.school}">
					     </div>
					     <div class="center-block">
							    <button  id="lifeEdu" class="btn btn-success">修改</button>
					     </div>
	    		 </form>
  	         </div>
  	         
  	          <!--  头像管理-->
     		 <div role="tabpanel" class="tab-pane fade" id="txgl">
     				<div class="mod-head" style="text-align:  center;margin:0 auto" >
                            <img width="400px"  src="${user.imageUrl}" alt="${user.userName}" />
                            <span class="pull-right operate"></span>
                           
                    </div>
                    <div style="text-align:  center;margin:0 auto">
                     <button type="button" class="btn btn-success" onclick="showLayer()">修改</button>
                    </div>
              </div>
                  
  	    	 <!-- 联系管理 标签页 -->
  	   		 <div role="tabpanel" class="tab-pane fade" id="lxxx">
				   	
				   	<form>
				   			 <label for="checkboxe">是否隐藏</label>
   							 <section class="model">
		    					 <div class="checkbox">
		    					    <c:if test="${exChange.hide == 1}"> 
							       	   <input id="checkboxe" checked="checked" type="checkbox"/>
							        </c:if>
							        <c:if test="${exChange.hide == 0}">
							           <input id="checkboxe" type="checkbox"/>
							        </c:if>
							        <label></label>
							     </div>
						     </section>
				
			    			 <div class="form-group center-block">
								    <label for="qq">腾讯/qq</label>
								    <input id="qq" type="text" class="form-control" name="exChange.qq" value="${exChange.qq}" placeholder="${exChange.qq}">
						     </div>
						    
						     <div class="form-group center-block">
								    <label for="weChat">WeChat/微信</label>
								    <input id="weChat" type="text" class="form-control" name="exChange.weChat" value="${exChange.weChat}" placeholder="${exChange.weChat}">
						     </div>
						     <div class="form-group center-block">
								    <label for="email1">Email/邮箱</label>
								    <input id="email1" type="text" class="form-control" name="exChange.email" value="${exChange.email}" placeholder="${exChange.email}">
						     </div>

						     <div class="form-group center-block">
								    <label for="tel">Tel/电话</label>
								    <input id="tel" type="text" class="form-control" name="exChange.tel" value="${exChange.tel}" placeholder="${exChange.tel}">
						     </div>
						     
						     <div class="center-block">
								    <button id="exChange" class="btn btn-success">修改</button>
						     </div>
			   		 </form>
  			 </div>  <!-- 员工管理结束 -->  
  	
  	    	 <!-- 工作管理 标签页 -->
  	    	 <div role="tabpanel" class="tab-pane fade" id="gzxx">
	    	  	 	
				   	<form>
				   			 <label for="checkboxm">是否工作</label>
	   							 <section class="model">
			    					 <div class="checkbox">
			    					  	<c:if test="${lifeWork.isWork == 1}">  
								       		 <input id="checkboxm" checked="checked" type="checkbox"/>
								        </c:if>
								        <c:if test="${lifeWork.isWork == 0}">  
								      		 <input id="checkboxm"  type="checkbox"/>
						  				</c:if>
								        <label></label>
								     </div>
							     </section>
							     
						   		<c:if test="${lifeWork.isWork == 1}">  	
						   		<div id="lifeWorkContent" >	
							   			  <label for="checkboxg">是否隐藏</label>
							   			  
			   							 	<section class="model">
					    					 <div class="checkbox">
					    					 	<c:if test="${lifeWork.hide == 1}">  
										       		 <input id="checkboxg" checked="checked" type="checkbox"/>
										        </c:if>
										        <c:if test="${lifeWork.hide == 0}"> 
										        	 <input id="checkboxg" type="checkbox"/>
										        </c:if>
										        <label></label>
										     </div>
										    </section>
						    			 <div class="form-group center-block">
											    <label for="company">Company/公司</label>
											    <input id="company" type="text" class="form-control"  value="${lifeWork.company}" placeholder="${lifeWork.company}">
									     </div>
									    
									     <div class="form-group center-block">
											    <label for="department">Department/部门</label>
											    <input id="department" type="text" class="form-control" value="${lifeWork.department}" placeholder="${lifeWork.department}">
									     </div>
									     
									     <div class="form-group center-block">
											    <label for="position">Position/职位</label>
											    <input id="position" type="text" class="form-control"  value="${lifeWork.position}" placeholder="${lifeWork.position}">
									     </div>
									     
									     <div class="center-block">
											    <button id="lifeWork" class="btn btn-success">修改</button>
									     </div>
							 	  </div>	
							  	 </c:if>
							  	 <c:if test="${userVo.isWork == 0}">  	
						   		<div id="lifeWorkContent" style="visibility: hidden">	
							   			  <label for="checkboxg">是否隐藏</label>
			   							 	<section class="model">
					    					 <div class="checkbox">
										        <c:if test="${lifeWork.hide == 1}">  
										       		 <input id="checkboxg" checked="checked" type="checkbox"/>
										        </c:if>
										        <c:if test="${lifeWork.hide == 0}"> 
										        	 <input id="checkboxg" type="checkbox"/>
										        </c:if>
										        <label></label>
										     </div>
										    </section>
						    			 <div class="form-group center-block">
											    <label for="company">Company/公司</label>
											    <input id="company" type="text" class="form-control"  value="${lifeWork.company}" placeholder="${lifeWork.company}">
									     </div>
									    
									     <div class="form-group center-block">
											    <label for="department">Department/部门</label>
											    <input id="department" type="text" class="form-control" value="${lifeWork.department}" placeholder="${lifeWork.department}">
									     </div>
									     
									     <div class="form-group center-block">
											    <label for="position">Position/职位</label>
											    <input id="position" type="text" class="form-control"  value="${lifeWork.position}" placeholder="${lifeWork.position}">
									     </div>
									     
									     <div class="center-block">
											    <button id="lifeWork" class="btn btn-success">修改</button>
									     </div>
							 	  </div>	
							  	 </c:if>
			   		 </form>
			   		 
             </div> <!-- 员工请假单结束 -->
             
              <!-- 安全管理 标签页 -->
  	    	 <div role="tabpanel" class="tab-pane fade" id="aqgl">
  	    	  			<form action="">
			    			 <div class="form-group center-block">
								<h3 class="text-center"><mark>密码安全</mark> -------------------------<span>✔</span>-----
									<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".modal-password">修改密码</button>
								</h3>
								<h3 class="text-center"><mark>邮箱安全</mark> -------------------------<span>✔</span>-----
									<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".modal-emailCheck">修改邮箱</button>
								</h3>
								<c:if test="${security.securityTEL==null}">
								<h3 class="text-center"><mark>安全电话</mark> -------------------------<span>×</span>-----
									<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".modal-telEmailCheck">修改电话</button>
								</h3>
								</c:if>
								<c:if test="${security.securityTEL!=null}">
								<h3 class="text-center"><mark>安全电话</mark> -------------------------<span>✔</span>-----
									<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".modal-telEmailCheck">修改电话</button>
								</h3>
								</c:if>
						     </div>
			   			 </form>
             </div> <!-- 安全管理结束 -->
             
             
		<!-- passwordUpdate -->
		<div class="modal fade modal-password" tabindex="-1" role="dialog" >
		  <div class="modal-dialog " role="document">
		    <div class="modal-content">
		     <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		         <h4 class="modal-title" id="myModalLabel">修改密码</h4>
		      </div>
			 <form>
				  <div class="form-group">
				    <label for="exampleInputPassword1">Password/原密码</label>
				    <input type="password" class="form-control" id="oidPassWord"  placeholder="原密码">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputPassword1">Password/新密码</label>
				    <input type="password" class="form-control" id="newPassWord"   placeholder="新密码">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputPassword1">Password/再次输入</label>
				    <input type="password" class="form-control" id="againPassWord" placeholder="再次输入">
				  </div>
				  <button id="updatePassWord" class="btn btn-default">修改</button>
				</form>
		    </div>
		  </div>
		</div>
            	<!-- passwordUpdate end --> 
            	
           <!-- emailCheck --> 	
         <div id="emailCheck" class="modal fade modal-emailCheck" tabindex="-1" role="dialog" >
		  <div class="modal-dialog " role="document">
		    <div class="modal-content">
		     <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">验证邮箱</h4>
		      </div>
			 <form>
				 <div class="form-group">
				 	 <input type="email" class="form-control" id="email5" placeholder="输入旧邮箱">
				   	 <label  class="col-sm-6 control-label" for="emailCode">邮箱验证码
				     <input type="button"  value="&nbsp;发送邮箱" class="btn btn-default" onclick="settime1(this)" /></label> 	
				     <div class="col-sm-6">
				     <input type="text" class="form-control" id="emailCode1" placeholder="输入邮箱中6位的验证码">
				     </div>
				  </div>
				  <a  id="checkCode1" class="btn btn-success">验证</a>
				</form>
		    </div>
		  </div>
		</div>   	
            	     <!-- email end -->        	     
            	       <!-- emailUpdate --> 	
         <div id="emailModel" class="modal fade modal-email" tabindex="-1" role="dialog" >
		  <div class="modal-dialog " role="document">
		    <div class="modal-content">
		     <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">修改邮箱</h4>
		      </div>
				 <form>
					 <input type="email" class="form-control" id="email7" placeholder="输入新邮箱">
				     <label class="col-sm-6 control-label" for="emailCode">邮箱验证码
				     <input type="button" value="&nbsp;发送邮箱" class="btn btn-default" onclick="settime3(this)" /></label> 	
				     <div class="col-sm-6">
				     <input type="text" class="form-control" id="emailCode3" placeholder="输入邮箱中6位的验证码">
				     </div>
					 <a id="newEmailCheckCode" class="btn btn-default">修改</a>
				</form>
		    </div>
		  </div>
		</div>   	
          <!-- emailUpdate end -->   
            	     
          <!-- telemailCheck --> 	
         <div id="telEmailCheck" class="modal fade modal-telEmailCheck" tabindex="-1" role="dialog" >
		  <div class="modal-dialog " role="document">
		    <div class="modal-content">
		     <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">验证邮箱</h4>
		      </div>
			 <form>
				 <div class="form-group">
				 	 <input type="email" class="form-control" id="email6" placeholder="输入你的邮箱">
				   	 <label  class="col-sm-6 control-label" for="emailCode">邮箱验证码
				     <input type="button"  value="&nbsp;发送邮箱" class="btn btn-default" onclick="settime2(this)" /></label> 	
				     <div class="col-sm-6">
				     <input type="text" class="form-control" id="emailCode2" placeholder="输入邮箱中6位的验证码">
				     </div>
				  </div>
				  <a id="checkCode2" class="btn btn-success">验证</a>
				</form>
		    </div>
		  </div>
		</div>   	
            	     <!-- email end -->    	     
            	     
    
            	        <!-- telUpdate --> 	
         <div id="telUpdate" class="modal fade modal-tel" tabindex="-1" role="dialog" >
		  <div class="modal-dialog " role="document">
		    <div class="modal-content">
		     <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">修改电话</h4>
		      </div>
				 <form>
					  <div class="form-group">
					    <label for="exampleInputPassword1">tel/安全电话</label>
					    <input type="text" class="form-control" id="newTel" placeholder="输入安全电话">
					  </div>
					  <a id="newTelUpdate"  class="btn btn-default">修改</a>
				</form>
		    </div>
		  </div>
		</div>   	
            	     <!-- tel end --> 
            	     
              	      	     
             
          </div> <!-- 一级导航内容结束 tab content end -->
        </div>  <!-- 右边内容 end -->
      </div>
    </div>
		
		<script type="text/javascript" src="js/footer.js"></script>
	    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	    <script src="js/ie10-viewport-bug-workaround.js"></script>
      
		

</body>
</html>
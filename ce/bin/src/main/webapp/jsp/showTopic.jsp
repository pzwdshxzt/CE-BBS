<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="text/html;charset=utf-8" http-equiv="Content-Type" />
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta name="renderer" content="webkit" />
<title>这种模式是不是模态框做出来的? - Bootstrap中文网</title>
<meta name="keywords" content="这种,模式,是不是,模态,框做,出来" />
<meta name="description" content="这种模式是不是模态框做出来的? - http://huaban.com/pins/965839162/这种模式是不是模态框做出来的?但没有看到类似的课程，不知如何做出来，那里有这方面的教程，希望给个链接，谢谢
 花瓣网（http://huaban.com/）（https://www.pint..."  />
<base href="http://wenda.bootcss.com/" /><!--[if IE]></base><![endif]-->
<link href="http://wenda.bootcss.com/static/css/default/ico/favicon.ico?v=20140912" rel="shortcut icon" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="http://wenda.bootcss.com/static/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="http://wenda.bootcss.com/static/css/icon.css" />
<link href="http://wenda.bootcss.com/static/css/default/common.css?v=20140912" rel="stylesheet" type="text/css" />
<link href="http://wenda.bootcss.com/static/css/default/link.css?v=20140912" rel="stylesheet" type="text/css" />
<link href="http://wenda.bootcss.com/static/js/plug_module/style.css?v=20140912" rel="stylesheet" type="text/css" />


<script type="text/javascript">
	var _EC48CC0BD9B5DE807A91E1E70898E9E4='';
	var G_POST_HASH=_EC48CC0BD9B5DE807A91E1E70898E9E4;
	var G_INDEX_SCRIPT = '';
	var G_SITE_NAME = 'Bootstrap中文网';
	var G_BASE_URL = 'http://wenda.bootcss.com';
	var G_STATIC_URL = 'http://wenda.bootcss.com/static';
	var G_UPLOAD_URL = 'http://wenda.bootcss.com/uploads';
	var G_USER_ID = '';
	var G_USER_NAME = '';
	var G_UPLOAD_ENABLE = 'N';
	var G_UNREAD_NOTIFICATION = 0;
	var G_NOTIFICATION_INTERVAL = 100000;
	var G_CAN_CREATE_TOPIC = '';
	
	</script>
<script src="http://wenda.bootcss.com/static/js/jquery.2.js?v=20140912" type="text/javascript"></script>
<script src="http://wenda.bootcss.com/static/js/jquery.form.js?v=20140912" type="text/javascript"></script>
<script src="http://wenda.bootcss.com/static/js/plug_module/plug-in_module.js?v=20140912" type="text/javascript"></script>
<script src="http://wenda.bootcss.com/static/js/aws.js?v=20140912" type="text/javascript"></script>
<script src="http://wenda.bootcss.com/static/js/aw_template.js?v=20140912" type="text/javascript"></script>
<script src="http://wenda.bootcss.com/static/js/app.js?v=20140912" type="text/javascript"></script>
<script src="http://wenda.bootcss.com/static/js/editor/Markdown.Converter.js?v=20140912" type="text/javascript"></script>
<script src="http://wenda.bootcss.com/static/js/editor/Markdown.Sanitizer.js?v=20140912" type="text/javascript"></script>
<script src="http://wenda.bootcss.com/static/js/editor/Markdown.Editor.js?v=20140912" type="text/javascript"></script>
<script src="http://wenda.bootcss.com/static/js/editor/prettify.js?v=20140912" type="text/javascript"></script>
<script type="text/javascript" src="http://wenda.bootcss.com/static/js/compatibility.js"></script>
<!--[if lte IE 8]>
	<script type="text/javascript" src="http://wenda.bootcss.com/static/js/respond.js"></script>
<![endif]-->
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
        <nav class="navbar navbar-default " role="navigation">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="#">CE<small>&nbsp;Connect Everything</small></a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                <li class="active"><a href="#">首页</a></li>
                <li><a href="#about">关于</a></li>
                <li><a href="#contact">联系我们</a></li>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">板块 <span class="caret"></span></a>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li class="dropdown-header">Nav header</li>
                    <li><a href="#">Separated link</a></li>
                    <li><a href="#">One more separated link</a></li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </nav>
      </div>
    </div>

			
<div class="aw-container-wrap">
		<div class="container">
		<div class="row">
			<div class="aw-content-wrap clearfix">
				<div class="col-sm-12 col-md-9 aw-main-content">
					<!-- 话题推荐bar -->
										<!-- 话题推荐bar -->
					<!-- 话题bar -->
					<div class="aw-mod aw-topic-bar" id="question_topic_editor" data-type="question" data-id="2395">
						<div class="tag-bar clearfix">
														<span class="topic-tag" data-id="128">
								<a href="http://wenda.bootcss.com/topic/%E6%A8%A1%E6%80%81%E6%A1%86" class="text">模态框</a>
							</span>
							
													</div>
					</div>
					<!-- end 话题bar -->
					<div class="aw-mod aw-question-detail aw-item">
						<div class="mod-head">
							<h1>
								这种模式是不是模态框做出来的?							</h1>

													</div>
						<div class="mod-body">
							<div class="content markitup-box">
								<a href="http://huaban.com/pins/965839162/" rel="nofollow" target="_blank">http://huaban.com/pins/965839162/</a>这种模式是不是模态框做出来的?但没有看到类似的课程，不知如何做出来，那里有这方面的教程，希望给个链接，谢谢<br />
 花瓣网（<a href="http://huaban.com/" rel="nofollow" target="_blank">http://huaban.com/</a>）（<a href="https://www.pinterest.com/" rel="nofollow" target="_blank">https://www.pinterest.com/</a>），好象要注册后才可以看到打开悬浮在本页面上的效果，与脸书模式差不多，<br />
<div class="aw-comment-upload-img-list active">
	<a href="http://wenda.bootcss.com/uploads/questions/20161222/58510b9e388deaa112acefaa2737bb73.png" target="_blank" data-fancybox-group="thumb" rel="lightbox"><img src="http://wenda.bootcss.com/uploads/questions/20161222/58510b9e388deaa112acefaa2737bb73.png" class="img-polaroid" title="QQ图片20161222101933.png" alt="QQ图片20161222101933.png" /></a>
</div>

																<div class="aw-comment-upload-img-list">
																																</div>
								
																<ul class="aw-comment-upload-file-list">
																																			</ul>
															</div>
													</div>
						<div class="mod-footer">
							<div class="meta">
								<span class="text-color-999">6 天前</span>

								<a data-id="2395" data-type="question" class="aw-add-comment text-color-999 " data-comment-count="0" data-first-click="hide"><i class="icon icon-comment"></i>添加评论</a>

								
																
																<div class="pull-right more-operate">
									
									<!-- <a class="text-color-999"  onclick="AWS.dialog('shareOut', {item_type:'question', item_id:2395});"> -->
									<a class="text-color-999 dropdown-toggle" data-toggle="dropdown">
										<i class="icon icon-share"></i>分享									</a>
									<div aria-labelledby="dropdownMenu" role="menu" class="aw-dropdown shareout pull-right">
										<ul class="aw-dropdown-list">
											<li><a onclick="AWS.User.share_out('tsina');"><i class="icon icon-weibo"></i> 新浪微博</a></li>
											<li><a onclick="AWS.User.share_out('qzone');"><i class="icon icon-qzone"></i> QZONE</a></li>
											<li><a onclick="AWS.User.share_out('weixin');"><i class="icon icon-wechat"></i> 微信</a></li>
										</ul>
									</div>

																	</div>
							</div>
						</div>
						<!-- 站内邀请 -->
						<div class="aw-invite-box hide">
							<div class="mod-head clearfix">
								<div class="search-box pull-left">
									<input id="invite-input" class="form-control" type="text"  placeholder="搜索你想邀请的人..."/>
									<div class="aw-dropdown">
										<p class="title">没有找到相关结果</p>
										<ul class="aw-dropdown-list"></ul>
									</div>
									<i class="icon icon-search"></i>
								</div>
								<div class="invite-list pull-left hide">
									已邀请:
																	</div>
							</div>
													</div>
						<!-- end 站内邀请 -->
						<!-- 相关链接 -->
						<div class="aw-question-related-box hide">
							<form action="http://wenda.bootcss.com/publish/ajax/save_related_link/" method="post" onsubmit="return false" id="related_link_form">
								<div class="mod-head">
									<h2>与内容相关的链接</h2>
								</div>
								<div class="mod-body clearfix">
									<input type="hidden" name="item_id" value="2395" />
									<input type="text" class="form-control pull-left" name="link" value="http://" />

									<a onclick="AWS.ajax_post($('#related_link_form'));" class="pull-left btn btn-success">提交</a>
								</div>
							</form>
						</div>
						<!-- end 相关链接 -->
					</div>

										<div class="aw-mod aw-question-comment">
						<div class="mod-head">
							<ul class="nav nav-tabs aw-nav-tabs active">
								
								<h2 class="hidden-xs">0 个回复</h2>
							</ul>
						</div>
						<div class="mod-body aw-feed-list">
													</div>
						<div class="mod-footer">
															<div class="aw-load-more-content hide" id="load_uninterested_answers">
									<span class="text-color-999 aw-alert-box text-color-999" href="javascript:;" tabindex="-1" onclick="AWS.alert('被折叠的回复是被你或者被大多数用户认为没有帮助的回复');">为什么被折叠?</span>
									<a href="javascript:;" class="aw-load-more-content"><span class="hide_answers_count">0</span> 个回复被折叠</a>
								</div>

								<div class="hide aw-feed-list" id="uninterested_answers_list"></div>
													</div>

											</div>
										<!-- end 问题详细模块 -->

										<!-- 回复编辑器 -->
					<div class="aw-mod aw-replay-box">
						<a name="answer_form"></a>
												<p align="center">要回复问题请先<a href="http://wenda.bootcss.com/login/">登录</a>或<a href="http://wenda.bootcss.com/account/register/">注册</a></p>
											</div>
					<!-- end 回复编辑器 -->
									</div>
				<!-- 侧边栏 -->
				<div class="col-md-3 aw-side-bar hidden-xs hidden-sm">
					<!-- 发起人 -->
										<div class="aw-mod">
						<div class="mod-head">
							<h3>发起人</h3>
						</div>
						<div class="mod-body">
							<dl>
								<dt class="pull-left aw-border-radius-5">
									<a href="http://wenda.bootcss.com/people/murusheng"><img alt="murusheng" src="http://wenda.bootcss.com/uploads/avatar/000/00/31/70_avatar_mid.jpg" /></a>
								</dt>
								<dd class="pull-left">
									<a class="aw-user-name" href="http://wenda.bootcss.com/people/murusheng" data-id="3170">murusheng</a>
																											<p></p>
								</dd>
							</dl>
						</div>
					</div>
										<!-- end 发起人 -->

					
					
										<!-- 相关问题 -->
					<div class="aw-mod">
						<div class="mod-head">
							<h3>相关问题</h3>
						</div>
						<div class="mod-body font-size-12">
							<ul>
																<li><a href="http://wenda.bootcss.com/question/418">bootstrap模态框里加上表单会出现问题</a></li>
																<li><a href="http://wenda.bootcss.com/question/397">bootstrap,模态窗口如何remote一个新的页面到现在的窗口？</a></li>
																<li><a href="http://wenda.bootcss.com/question/330">bootstrap 下拉框带箭头 不是点击的位置那个箭头 是下拉出来的框体上面那个箭头 怎么做？</a></li>
																<li><a href="http://wenda.bootcss.com/question/54">Line曲线图鼠标悬浮时显示Y轴数据，每条线的都显示出来在一个tooltip里</a></li>
																<li><a href="http://wenda.bootcss.com/question/106">模态窗口与滚动条的问题</a></li>
																<li><a href="http://wenda.bootcss.com/question/27">新人报到，求大侠解答modal模态框怎样垂直居中啊？</a></li>
																<li><a href="http://wenda.bootcss.com/question/234">高手赐教：.Net GridView中的&lt;a&gt;标签,如何与模态框结合使用？id传值失效。</a></li>
																<li><a href="http://wenda.bootcss.com/question/22">bootcss原先是不是有个blog？</a></li>
																<li><a href="http://wenda.bootcss.com/question/211">modal.js的ESC键关闭模态框的小bug</a></li>
																<li><a href="http://wenda.bootcss.com/question/189">Bootstrap怎么自定义弹出模态窗体？</a></li>
																<li><a href="http://wenda.bootcss.com/question/228">jquery的load方法与模态框的$(&quot;#identified&quot;).modal('hide')不能一块使用</a></li>
															</ul>
						</div>
					</div>
					<!-- end 相关问题 -->
					
					<!-- 问题状态 -->
					<div class="aw-mod question-status">
						<div class="mod-head">
							<h3>问题状态</h3>
						</div>
						<div class="mod-body">
							<ul>
								<li>最新活动: <span class="aw-text-color-blue">6 天前</span></li>
								<li>浏览: <span class="aw-text-color-blue">136</span></li>
								<li>关注: <span class="aw-text-color-blue">1</span> 人</li>

								<li class="aw-border-radius-5" id="focus_users"></li>
							</ul>
						</div>
					</div>
					<!-- end 问题状态 -->
				</div>
				<!-- end 侧边栏 -->
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	ATTACH_ACCESS_KEY = 'ec48cc0bd9b5de807a91e1e70898e9e4';
	ITEM_IDS = '';
	COMMENT_UNFOLD = 'all';

	QUESTION_ID = 2395;
	UNINTERESTED_COUNT = 5;
</script>

<script type="text/javascript" src="http://wenda.bootcss.com/static/js/app/question_detail.js"></script>

<footer class="footer ">
  <div class="container">
    <div class="row footer-top">
      <div class="col-sm-6 col-lg-6">
        <h4>
          <img src="http://wenda.bootcss.com/static/css/default/logo/logo.png">
        </h4>
        <p>本网站所列开源项目的中文版文档全部由<a href="http://www.bootcss.com/" target="_blank">Bootstrap中文网</a>成员翻译整理，并全部遵循 <a href="http://creativecommons.org/licenses/by/3.0/" target="_blank">CC BY 3.0</a>协议发布。</p>
      </div>
      <div class="col-sm-6  col-lg-5 col-lg-offset-1">
        <div class="row about">
          <div class="col-xs-4">
            <h4>关于</h4>
            <ul class="list-unstyled">
              <li><a href="http://www.bootcss.com/about/" target="_blank">关于我们</a></li>
              <li><a href="http://www.bootcss.com/ad/" target="_blank">广告合作</a></li>
              <li><a href="http://www.bootcss.com/links/" target="_blank">友情链接</a></li>
            </ul>
          </div>
          <div class="col-xs-4">
            <h4>联系方式</h4>
            <ul class="list-unstyled">
              <li><a href="http://weibo.com/bootcss" title="Bootstrap中文网官方微博" target="_blank">新浪微博</a></li>
              <li><a href="mailto:admin@bootcss.com">电子邮件</a></li>
            </ul>
          </div>
          <div class="col-xs-4">
            <h4>旗下网站</h4>
            <ul class="list-unstyled">
              <li><a href="http://www.golaravel.com/" target="_blank">Laravel中文网</a></li>
              <li><a href="http://www.ghostchina.com/" target="_blank">Ghost中国</a></li>
            </ul>
          </div>
        </div>

      </div>
    </div>

    <div class="row footer-bottom">
      <ul class="list-inline text-center">
        <li><a href="http://www.miibeian.gov.cn/" target="_blank">京ICP备11008151号</a></li><li>京公网安备11010802014853</li>
      </ul>
    </div>
  </div>
</footer>


<a class="aw-back-top hidden-xs" href="javascript:;" onclick="$.scrollTo(1, 600, {queue:true});"><i class="icon icon-up"></i></a>

<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fd799cb54bdae1c6134cf03ab0a98d443' type='text/javascript'%3E%3C/script%3E"));
</script>
<!-- DO NOT REMOVE -->
<div id="aw-ajax-box" class="aw-ajax-box"></div>
<div style="display:none;" id="__crond">
	<script type="text/javascript">
		$(document).ready(function () {
			$('#__crond').html(unescape('%3Cimg%20src%3D%22' + G_BASE_URL + '/crond/run/1482908055%22%20width%3D%221%22%20height%3D%221%22%20/%3E'));
		});
	</script>
</div>

<!-- Escape time: 0.025132179260254 --><!-- / DO NOT REMOVE -->

</body>
</html>
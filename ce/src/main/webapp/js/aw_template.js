var AW_TEMPLATE = {
	'loadingBox':
		'<div id="aw-loading" class="hide">'+
			'<div id="aw-loading-box"></div>'+
		'</div>',

	'loadingMiniBox':
		'<div id="aw-loading-mini-box"></div>',
	
	'userCard':
			'<div id="aw-card-tips" class="aw-card-tips aw-card-tips-user">'+
				'<div class="aw-mod">'+
					'<div class="mod-head">'+
						'<a href="{{url}}" class="img">'+
							'<img src="{{avatar_file}}" alt="" />'+
						'</a>'+
						'<p class="title clearfix">'+
							'<a href="{{url}}" class="name pull-left" data-id="{{uid}}">{{user_name}}</a>'+
							'<i class="{{verified_enterprise}} pull-left" title="{{verified_title}}"></i>'+
						'</p>'+
						'<p class="aw-user-center-follow-meta">'+
							'<span>' + _t('濞佹湜') + ': <em class="aw-text-color-green">{{reputation}}</em></span>'+
							'<span>' + _t('璧炲悓') + ': <em class="aw-text-color-orange">{{agree_count}}</em></span>'+
						'</p>'+
					'</div>'+
					'<div class="mod-body">'+
						'<p>{{signature}}</p>'+
					'</div>'+
					'<div class="mod-footer clearfix">'+
						'<span>'+
							'<a class="text-color-999" onclick="AWS.dialog(\'inbox\', \'{{user_name}}\');"><i class="icon icon-inbox"></i> ' + _t('绉佷俊') + '</a>&nbsp;&nbsp;&nbsp;&nbsp;<a  class="text-color-999" onclick="AWS.dialog(\'publish\', {category_enable:{{category_enable}}, ask_user_id:{{uid}}, ask_user_name:{{ask_name}} });"><i class="icon icon-at"></i> ' + _t('闂甌a') + '</a>'+
						'</span>'+
						'<a class="btn btn-normal btn-success follow {{focus}} pull-right" onclick="AWS.User.follow($(this), \'user\', {{uid}});"><span>{{focusTxt}}</span> <em>|</em> <b>{{fansCount}}</b></a>'+
					'</div>'+
				'</div>'+
			'</div>',
	
	'topicCard' : 
			'<div id="aw-card-tips" class="aw-card-tips aw-card-tips-topic">'+
				'<div class="aw-mod">'+
					'<div class="mod-head">'+
						'<a href="{{url}}" class="img">'+
							'<img src="{{topic_pic}}" alt="" title=""/>'+
						'</a>'+
						'<p class="title">'+
							'<a href="{{url}}" class="name" data-id="{{topic_id}}">{{topic_title}}</a>'+
						'</p>'+
						'<p class="desc">'+
							'{{topic_description}}'+
						'</p>'+
					'</div>'+
					'<div class="mod-footer">'+
						'<span>'+ _t('璁ㄨ鏁�') + ': {{discuss_count}}</span>'+
						'<a class="btn btn-normal btn-success follow {{focus}} pull-right" onclick="AWS.User.follow($(this), \'topic\', {{topic_id}});"><span>{{focusTxt}}</span> <em>|</em> <b>{{focus_count}}</b></a>'+
					'</div>'+
				'</div>'+
			'</div>',

	'alertBox' : 
			'<div class="modal fade alert-box aw-tips-box">'+
				'<div class="modal-dialog">'+
					'<div class="modal-content">'+
						'<div class="modal-header">'+
							'<a type="button" class="close icon icon-delete" data-dismiss="modal" aria-hidden="true"></a>'+
							'<h3 class="modal-title" id="myModalLabel">' + _t('鎻愮ず淇℃伅') + '</h3>'+
						'</div>'+
						'<div class="modal-body">'+
							'<p>{{message}}</p>'+
						'</div>'+
					'</div>'+
				'</div>'+
			'</div>',

	'imagevideoBox' : 
			'<div id="aw-image-box" class="modal fade alert-box aw-image-box">'+
				'<div class="modal-dialog">'+
					'<div class="modal-content">'+
						'<div class="modal-header">'+
							'<a type="button" class="close icon icon-delete" data-dismiss="modal" aria-hidden="true"></a>'+
							'<h3 class="modal-title" id="myModalLabel">{{title}}</h3>'+
						'</div>'+
						'<div class="modal-body">'+
							'<form id="addTxtForms">'+
								'<p>' + _t('鏂囧瓧璇存槑') + ':</p>'+
								'<input class="form-control" type="text" name="{{tips}}"/>'+
								'<p>' + _t('閾炬帴鍦板潃') + '</p>'+
								'<input class="form-control" type="text" value="http://" name="{{url}}" />'+
							'</form>'+
							'<p class="text-color-999">{{type_tips}}</p>'+
						'</div>'+
						'<div class="modal-footer">'+
							'<a data-dismiss="modal" aria-hidden="true" class="btn text-color-999">' + _t('鍙栨秷') + '</a>'+
							'<button class="btn btn-large btn-success" data-dismiss="modal" aria-hidden="true" onclick="AWS.Editor.add_multimedia({{type}});">' + _t('纭畾') + '</button>'+
						'</div>'+
					'</div>'+
				'</div>'+
			'</div>',

	'editCommentBox' : 
				'<div class="modal fade alert-box aw-edit-comment-box">'+
				'<div class="modal-dialog">'+
					'<div class="modal-content">'+
						'<div class="modal-header">'+
							'<a type="button" class="close icon icon-delete" data-dismiss="modal" aria-hidden="true"></a>'+
							'<h3 class="modal-title" id="myModalLabel">' + _t('缂栬緫鍥炲') + '</h3>'+
						'</div>'+
						'<form action="' + G_BASE_URL + '/question/ajax/update_answer/answer_id-{{answer_id}}" method="post" onsubmit="return false" id="answer_edit">'+
						'<div class="modal-body">'+
							'<div class="alert alert-danger hide error_message"><i class="icon icon-delete"></i> <em></em></div>'+
							'<input type="hidden" name="attach_access_key" value="{{attach_access_key}}" />'+
							'<textarea name="answer_content" id="editor_reply" class="form-control" rows="10"></textarea>'+
							'<div class="aw-file-upload-box">'+
								'<div class="aw-upload-box">'+
									'<a class="btn btn-default">涓婁紶闄勪欢</a>'+
									'<div class="upload-container"></div>'+
								'</div>'+
							'</div>'+
						'</div>'+
						'<div class="modal-footer">'+
							'<span><input id="aw-do-delete" type="checkbox" value="1" name="do_delete" /><label for="aw-do-delete">' + _t('鍒犻櫎鍥炲') + '</label></span>'+
							'<button class="btn btn-large btn-success" onclick="AWS.ajax_post($(\'#answer_edit\'), AWS.ajax_processer, \'ajax_post_alert\');return false;">' + _t('纭畾') + '</button>'+
						'</div>'+
						'</form>'+
					'</div>'+
				'</div>'+
			'</div>',

	'articleCommentBox' :
		'<div class="aw-article-replay-box clearfix">'+
			'<form action="'+ G_BASE_URL +'/article/ajax/save_comment/" onsubmit="return false;" method="post">'+
				'<div class="mod-body">'+
					'<input type="hidden" name="at_uid" value="{{at_uid}}">'+
					'<input type="hidden" name="post_hash" value="' + G_POST_HASH + '" />'+
					'<input type="hidden" name="article_id" value="{{article_id}}" />'+
					'<textarea placeholder="' + _t('鍐欎笅浣犵殑璇勮...') + '" class="form-control" id="comment_editor" name="message" rows="2"></textarea>'+
				'</div>'+
				'<div class="mod-footer">'+
					'<a href="javascript:;" onclick="AWS.ajax_post($(this).parents(\'form\'));" class="btn btn-normal btn-success pull-right btn-submit">' + _t('鍥炲') + '</a>'+
				'</div>'+
			'</form>'+
		'</div>',

	'favoriteBox' : 
		'<div class="modal hide fade alert-box aw-favorite-box">'+
			'<div class="modal-dialog">'+
				'<div class="modal-content">'+
					'<div class="modal-header">'+
						'<a type="button" class="close icon icon-delete" data-dismiss="modal" aria-hidden="true"></a>'+
						'<h3 class="modal-title" id="myModalLabel">' + _t('鏀惰棌') + '</h3>'+
					'</div>'+
					'<form action="' + G_BASE_URL + '/favorite/ajax/update_favorite_tag/" method="post" onsubmit="return false;">'+
						'<div class="modal-body">'+
							'<input type="hidden" name="item_id" value="{{item_id}}" />'+
							'<input type="hidden" name="item_type" value="{{item_type}}" />'+
							'<div class="alert alert-danger hide error_message"><i class="icon icon-delete"></i> <em></em></div>'+
							'<p>' + _t('娣诲姞璇濋鏍囩') + ': <input type="text" name="tags" id="add_favorite_tags" class="form-control" /></p>'+
							'<p id="add_favorite_my_tags" class="hide">' + _t('甯哥敤鏍囩') + ': </p>'+
						'</div>'+
						'<div class="modal-footer">'+
							'<a href="javascript:;" data-dismiss="modal" aria-hidden="true" class="text-color-999">' + _t('鍙栨秷') + '</a>'+
							'<button href="javascript:;" class="btn btn-large btn-success" onclick="AWS.ajax_post($(this).parents(\'form\'), AWS.ajax_processer, \'ajax_post_modal\');">' + _t('纭') + '</button>'+
						'</div>'+
					'</form>'+
				'</div>'+
			'</div>'+
		'</div>',

	'questionRedirect' : 
		'<div class="modal fade alert-box aw-question-redirect-box">'+
			'<div class="modal-dialog">'+
				'<div class="modal-content">'+
					'<div class="modal-header">'+
						'<a type="button" class="close icon icon-delete" data-dismiss="modal" aria-hidden="true"></a>'+
						'<h3 class="modal-title" id="myModalLabel">' + _t('闂閲嶅畾鍚戣嚦') + '</h3>'+
					'</div>'+
					'<div class="modal-body">'+
						'<p>' + _t('灏嗛棶棰橀噸瀹氬悜鑷�') + '</p>'+
						'<div class="aw-question-drodpwon">'+
							'<input id="question-input" class="form-control" type="text" data-id="{{data_id}}" placeholder="' + _t('鎼滅储闂') + '" />'+
							'<div class="aw-dropdown"><p class="title">' + _t('娌℃湁鎵惧埌鐩稿叧缁撴灉') + '</p><ul class="aw-dropdown-list"></ul></div>'+
						'</div>'+
						'<p class="clearfix"><a href="javascript:;" class="btn btn-large btn-success pull-right" onclick="$(\'.alert-box\').modal(\'hide\');">' + _t('鏀惧純鎿嶄綔') + '</a></p>'+
					'</div>'+
				'</div>'+
			'</div>'+
		'</div>',

	'publishBox' : 
			'<div class="modal fade alert-box aw-publish-box">'+
				'<div class="modal-dialog">'+
					'<div class="modal-content">'+
						'<div class="modal-header">'+
							'<a type="button" class="close icon icon-delete" data-dismiss="modal" aria-hidden="true"></a>'+
							'<h3 class="modal-title" id="myModalLabel">' + _t('鍙戣捣闂') + '</h3>'+
						'</div>'+
						'<div class="modal-body">'+
							'<div class="alert alert-danger hide error_message"><i class="icon icon-delete"></i> <em></em></div>'+
							'<form action="' + G_BASE_URL + '/publish/ajax/publish_question/" method="post" id="quick_publish" onsubmit="return false">'+
								'<input type="hidden" id="quick_publish_category_id" name="category_id" value="{{category_id}}" />'+
								'<input type="hidden" name="post_hash" value="' + G_POST_HASH + '" />'+
								'<input type="hidden" name="ask_user_id" value="{{ask_user_id}}" />'+
								'<div>'+
									'<textarea class="form-control" placeholder="' + _t('鍐欎笅浣犵殑闂') + '..." rows="1" name="question_content" id="quick_publish_question_content" onkeydown="if (event.keyCode == 13) { return false; }"></textarea>'+
									'<div class="aw-publish-suggest-question hide">'+
										'<p class="text-color-999">浣犵殑闂鍙兘宸茬粡鏈夌瓟妗�</p>'+
										'<ul class="aw-dropdown-list">'+
										'</ul>'+
									'</div>'+
								'</div>'+
								'<textarea name="question_detail" class="form-control" rows="4" placeholder="' + _t('闂鑳屾櫙銆佹潯浠剁瓑璇︾粏淇℃伅') + '..."></textarea>'+
								'<div class="aw-publish-title">'+
									'<div class="dropdown" id="quick_publish_category_chooser">'+
										'<div class="dropdown-toggle" data-toggle="dropdown">'+
											'<span id="aw-topic-tags-select" class="aw-hide-txt">' + _t('閫夋嫨鍒嗙被') + '</span>'+
											'<a><i class="icon icon-down"></i></a>'+
										'</div>'+
									'</div>'+
								'</div>'+
								'<div class="aw-topic-bar" data-type="publish">'+
									'<div class="tag-bar clearfix">'+
										'<span class="aw-edit-topic"><i class="icon icon-edit"></i>' + _t('缂栬緫璇濋') + '</span>'+
									'</div>'+
								'</div>'+
								'<div class="clearfix hide" id="quick_publish_captcha">'+
									'<input type="text" class="pull-left form-control" name="seccode_verify" placeholder="' + _t('楠岃瘉鐮�') + '" />'+
									'<img id="qp_captcha" class="pull-left" onclick="this.src = \'' +G_BASE_URL + '/account/captcha/\' + Math.floor(Math.random() * 10000);" src="" />'+
								'</div>'+
							'</form>'+
						'</div>'+
						'<div class="modal-footer">'+
							'<span class="pull-right">'+
								'<a data-dismiss="modal" aria-hidden="true" class="text-color-999">' + _t('鍙栨秷') + '</a>'+
								'<button class="btn btn-large btn-success" onclick="AWS.ajax_post($(\'#quick_publish\'), AWS.ajax_processer, \'error_message\');">' + _t('鍙戣捣') + '</button>'+
							'</span>'+
							'<a href="javascript:;" tabindex="-1" onclick="$(\'form#quick_publish\').attr(\'action\', \'' + G_BASE_URL + '/publish/\');document.getElementById(\'quick_publish\').submit();" class="pull-left">' + _t('楂樼骇妯″紡') + '</a>'+
						'</div>'+
					'</div>'+
				'</div>'+
			'</div>',

	'inbox' :
			'<div class="modal fade alert-box aw-inbox">'+
				'<div class="modal-dialog">'+
					'<div class="modal-content">'+
						'<div class="modal-header">'+
							'<a type="button" class="close icon icon-delete" data-dismiss="modal" aria-hidden="true"></a>'+
							'<h3 class="modal-title" id="myModalLabel">' + _t('鏂扮淇�') + '</h3>'+
						'</div>'+
						'<div class="modal-body">'+
							'<div class="alert alert-danger hide error_message"> <i class="icon icon-delete"></i> <em></em></div>'+
							'<form action="' + G_BASE_URL + '/inbox/ajax/send/" method="post" id="quick_publish" onsubmit="return false">'+
								'<input type="hidden" name="post_hash" value="' + G_POST_HASH + '" />'+
								'<input id="invite-input" class="form-control" type="text" placeholder="' + _t('鎼滅储鐢ㄦ埛') + '" name="recipient" value="{{recipient}}" />'+
								'<div class="aw-dropdown">'+
									'<p class="title">' + _t('娌℃湁鎵惧埌鐩稿叧缁撴灉') + '</p>'+
									'<ul class="aw-dropdown-list">'+
									'</ul>'+
								'</div>'+
								'<textarea class="form-control" name="message" rows="3" placeholder="' + _t('绉佷俊鍐呭...') + '"></textarea>'+
							'</form>'+
						'</div>'+
						'<div class="modal-footer">'+
							'<a data-dismiss="modal" aria-hidden="true" class="text-color-999">' + _t('鍙栨秷') + '</a>'+
							'<button class="btn btn-large btn-success" onclick="AWS.ajax_post($(\'#quick_publish\'), AWS.ajax_processer, \'error_message\');">' + _t('鍙戦€�') + '</button>'+
						'</div>'+
					'</div>'+
				'</div>'+
			'</div>',
	
	'editTopicBox' : 
		'<div class="aw-edit-topic-box form-inline">'+
			'<input type="text" class="form-control" id="aw_edit_topic_title" autocomplete="off"  placeholder="' + _t('鍒涘缓鎴栨悳绱㈡坊鍔犳柊璇濋') + '...">'+
			'<a class="btn btn-normal btn-success add">' + _t('娣诲姞') + '</a>'+
			'<a class="btn btn-normal btn-gray close-edit">' + _t('鍙栨秷') + '</a>'+
			'<div class="aw-dropdown">'+
				'<p class="title">' + _t('娌℃湁鎵惧埌鐩稿叧缁撴灉') + '</p>'+
				'<ul class="aw-dropdown-list">'+
				'</ul>'+
			'</div>'+
		'</div>',
			
	'ajaxData' :
		'<div class="modal fade alert-box aw-topic-edit-note-box aw-question-edit" aria-labelledby="myModalLabel" role="dialog">'+
			'<div class="modal-dialog">'+
				'<div class="modal-content">'+
					'<div class="modal-header">'+
						'<a type="button" class="close icon icon-delete" data-dismiss="modal" aria-hidden="true"></a>'+
						'<h3 class="modal-title" id="myModalLabel">{{title}}</h3>'+
					'</div>'+
					'<div class="modal-body">'+
						'{{data}}'+
					'</div>'+
				'</div>'+
			'</div>'+
		'</div>',

	'commentBox' : 
			'<div class="aw-comment-box" id="{{comment_form_id}}">'+
				'<div class="aw-comment-list"><p align="center" class="aw-padding10"><i class="aw-loading"></i></p></div>'+
				'<form action="{{comment_form_action}}" method="post" onsubmit="return false">'+
					'<div class="aw-comment-box-main">'+
						'<textarea class="aw-comment-txt form-control" rows="2" name="message" placeholder="' + _t('璇勮涓€涓�') + '..."></textarea>'+
						'<div class="aw-comment-box-btn">'+
							'<span class="pull-right">'+
								'<a href="javascript:;" class="btn btn-mini btn-success" onclick="AWS.User.save_comment($(this));">' + _t('璇勮') + '</a>'+
								'<a href="javascript:;" class="btn btn-mini btn-gray close-comment-box">' + _t('鍙栨秷') + '</a>'+
							'</span>'+
						'</div>'+
					'</div>'+
				'</form>'+
			'</div>',
			
	'commentBoxClose' : 
			'<div class="aw-comment-box" id="{{comment_form_id}}">'+
				'<div class="aw-comment-list"><p align="center" class="aw-padding10"><i class="aw-loading"></i></p></div>'+
			'</div>',

	'dropdownList' : 
		'<div aria-labelledby="dropdownMenu" role="menu" class="aw-dropdown">'+
			'<ul class="aw-dropdown-list">'+
			'{{#items}}'+
				'<li><a data-value="{{id}}">{{title}}</a></li>'+
			'{{/items}}'+
			'</ul>'+
		'</div>',

	'reportBox' :
			'<div class="modal fade alert-box aw-share-box aw-share-box-message aw-report-box" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">'+
				'<div class="modal-dialog">'+
					'<div class="modal-content">'+
						'<div class="modal-header">'+
							'<a type="button" class="close icon icon-delete" data-dismiss="modal" aria-hidden="true"></a>'+
							'<h3 class="modal-title" id="myModalLabel">' + _t('涓炬姤闂') + '</h3>'+
						'</div>'+
						'<form id="quick_publish" method="post" action="' + G_BASE_URL + '/question/ajax/save_report/">'+
							'<input type="hidden" name="type" value="{{item_type}}" />'+
							'<input type="hidden" name="target_id" value="{{item_id}}" />'+
							'<div class="modal-body">'+
								'<div class="alert alert-danger hide error_message"><i class="icon icon-delete"></i> <em></em></div>'+
								'<textarea class="form-control" name="reason" rows="5" placeholder="' + _t('璇峰～鍐欎妇鎶ョ悊鐢�') + '..."></textarea>'+
							'</div>'+
							'<div class="modal-footer">'+
								'<a data-dismiss="modal" aria-hidden="true" class="text-color-999">' + _t('鍙栨秷') + '</a>'+
								'<button class="btn btn-large btn-success" onclick="AWS.ajax_post($(\'#quick_publish\'), AWS.ajax_processer, \'error_message\');return false;">' + _t('鎻愪氦') + '</button>'+
							'</div>'+
						'</form>'+
					'</div>'+
				'</div>'+
			'</div>',

	'searchDropdownListQuestions' : 
		'<li class="{{active}} question clearfix"><i class="icon icon-bestbg pull-left"></i><a class="aw-hide-txt pull-left" href="{{url}}">{{content}} </a><span class="pull-right text-color-999">{{discuss_count}} ' + _t('涓洖澶�') + '</span></li>',
	'searchDropdownListTopics' : 
		'<li class="topic clearfix"><span class="topic-tag" data-id="{{topic_id}}"><a href="{{url}}" class="text">{{name}}</a></span> <span class="pull-right text-color-999">{{discuss_count}} ' + _t('涓璁�') + '</span></li>',
	'searchDropdownListUsers' : 
		'<li class="user clearfix"><a href="{{url}}"><img src="{{img}}" />{{name}}<span class="aw-hide-txt">{{intro}}</span></a></li>',
	'searchDropdownListArticles' : 
		'<li class="question clearfix"><a class="aw-hide-txt pull-left" href="{{url}}">{{content}} </a><span class="pull-right text-color-999">{{comments}} ' + _t('鏉¤瘎璁�') + '</span></li>',
	'inviteDropdownList' :
		'<li class="user"><a data-url="{{url}}" data-id="{{uid}}" data-actions="{{action}}" data-value="{{name}}"><img class="img" src="{{img}}" />{{name}}</a></li>',
	'editTopicDorpdownList' : 
		'<li class="question"><a>{{name}}</a></li>',
	'questionRedirectList' : 
		'<li class="question"><a class="aw-hide-txt" onclick="AWS.ajax_request({{url}})">{{name}}</a></li>',
	'questionDropdownList' : 
		'<li class="question" data-id="{{id}}"><a class="aw-hide-txt" href="{{url}}">{{name}}</a></li>',

	'inviteUserList' : 
		'<li>'+
			'<a class="pull-right btn btn-mini btn-default" onclick="disinvite_user($(this),{{uid}});$(this).parent().detach();">' + _t('鍙栨秷閭€璇�') + '</a>'+
			'<a class="aw-user-name" data-id="{{uid}}">'+
				'<img src="{{img}}" alt="" />'+
			'</a>'+
			'<span class="aw-text-color-666">{{name}}</span>'+
		'</li>',

	'educateInsert' :
			'<td class="e1" data-txt="{{school}}">{{school}}</td>'+
			'<td class="e2" data-txt="{{departments}}">{{departments}}</td>'+
			'<td class="e3" data-txt="{{year}}">{{year}} ' + _t('骞�') + '</td>'+
			'<td><a class="delete-educate">' + _t('鍒犻櫎') + '</a>&nbsp;&nbsp;<a class="edit-educate">' + _t('缂栬緫') + '</a></td>',

	'educateEdit' : 
			'<td><input type="text" value="{{school}}" class="school form-control"></td>'+
			'<td><input type="text" value="{{departments}}" class="departments form-control"></td>'+
			'<td><select class="year edityear">'+
				'</select> ' + _t('骞�') + '</td>'+
			'<td><a class="delete-educate">' + _t('鍒犻櫎') + '</a>&nbsp;&nbsp;<a class="add-educate">' + _t('淇濆瓨') + '</a></td>',

	'workInsert' : 
			'<td class="w1" data-txt="{{company}}">{{company}}</td>'+
			'<td class="w2" data-txt="{{jobid}}">{{work}}</td>'+
			'<td class="w3" data-s-val="{{syear}}" data-e-val="{{eyear}}">{{syear}} ' + _t('骞�') + ' ' + _t('鑷�') + ' {{eyear}}</td>'+
			'<td><a class="delete-work">' + _t('鍒犻櫎') + '</a>&nbsp;&nbsp;<a class="edit-work">' + _t('缂栬緫') + '</a></td>',

	'workEidt' : 
			'<td><input type="text" value="{{company}}" class="company form-control"></td>'+
			'<td>'+
				'<select class="work editwork">'+
				'</select>'+
			'</td>'+
			'<td><select class="syear editsyear">'+
				'</select>&nbsp;&nbsp;' + _t('骞�') + ' &nbsp;&nbsp; ' + _t('鑷�') + '&nbsp;&nbsp;&nbsp;&nbsp;'+
				'<select class="eyear editeyear">'+
				'</select> ' + _t('骞�') +
			'</td>'+
			'<td><a class="delete-work">' + _t('鍒犻櫎') + '</a>&nbsp;&nbsp;<a class="add-work">' + _t('淇濆瓨') + '</a></td>',

	'linkBox' : 
			'<div id="aw-link-box" class="modal alert-box aw-link-box fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">'+
				'<div class="modal-dialog">'+
					'<div class="modal-content">'+
						'<div class="modal-header">'+
							'<a type="button" class="close icon icon-delete" data-dismiss="modal" aria-hidden="true"></a>'+
							'<h3 id="myModalLabel">{{title}}</h3>'+
						'</div>'+
						'<div class="modal-body">'+
							'<form id="addTxtForms">'+
								'<p>' + _t('閾炬帴鏂囧瓧') + '</p>'+
								'<input type="text" value="" name="{{text}}" class="link-title form-control" placeholder="'+ _t('閾炬帴鏂囧瓧') +'" />'+
								'<p>' + _t('閾炬帴鍦板潃') + ':</p>'+
								'<input type="text" name="{{url}}" class="link-url form-control" value="http://" />'+
							'</form>'+
						'</div>'+
						'<div class="modal-footer">'+
							'<a data-dismiss="modal" aria-hidden="true" class="text-color-999">' + _t('鍙栨秷') + '</a>'+
							'<button class="btn btn-large btn-success" data-dismiss="modal" aria-hidden="true" onclick="AWS.Editor.add_multimedia({{type}});">' + _t('纭畾') + '</button>'+
						'</div>'+
					'</div>'+
				'</div>'+
			'</div>',
	'alertImg' :
		'<div class="modal fade alert-box aw-tips-box aw-alert-img-box">'+
			'<div class="modal-dialog">'+
				'<div class="modal-content">'+
					'<div class="modal-header">'+
						'<a type="button" class="close icon icon-delete" data-dismiss="modal" aria-hidden="true"></a>'+
						'<h3 class="modal-title" id="myModalLabel">' + _t('鎻愮ず淇℃伅') + '</h3>'+
					'</div>'+
					'<div class="modal-body">'+
						'<p class="hide {{hide}}">{{message}}</p>'+
						'<img src="{{url}}" />'+
					'</div>'+
				'</div>'+
			'</div>'+
		'</div>',

	'confirmBox' :
		'<div class="modal fade alert-box aw-confirm-box">'+
			'<div class="modal-dialog">'+
				'<div class="modal-content">'+
					'<div class="modal-header">'+
						'<a type="button" class="close icon icon-delete" data-dismiss="modal" aria-hidden="true"></a>'+
						'<h3 class="modal-title" id="myModalLabel">' + _t('鎻愮ず淇℃伅') + '</h3>'+
					'</div>'+
					'<div class="modal-body">'+
						'{{message}}'+
					'</div>'+
					'<div class="modal-footer">'+
						'<a class="btn btn-gray" data-dismiss="modal" aria-hidden="true">鍙栨秷</a>'+
						'<a class="btn btn-success yes">纭畾</a>'+
					'</div>'+
				'</div>'+
			'</div>'+
		'</div>',
}
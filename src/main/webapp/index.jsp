<%@page import="com.display.maven.display.domain.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<title>主页</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${basePath }static/web/css/base.css">
<link rel="stylesheet" href="${basePath }static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${basePath }static/bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${basePath }static/web/css/index.css">
</head>
<body>
     <div class="head w">
           <div class="logo">
                <img src="${basePath }static/web/img/other/logo.png">
           </div>
           <div class="msg">
                <div class="show">
                     <span>当前登录用户，${User.realname}</span>
                </div>
                <div class="ctr">
                     <button id="updatepass" class="btn1">
                	<button class="btn3" id="showUrl" data-toggle="modal"
									data-target="#urlShow_Modal" style="top: 10px;left: -101px;">
                           <span class="glyphicon glyphicon-flash"></span>前端地址
                     </button> 
                     <button class="btn1" id="user_information" data-toggle="modal"
									data-target="#user_information_Modal">
                           <span class="glyphicon glyphicon-lock"></span>修改密码
                     </button>
                     <button class="btn2" id="btn2">
                           <span class="glyphicon glyphicon-log-out"></span>安全退出
                     </button>
                </div>
           </div>
     </div>
     <div class="w clearfix">
     
           <div class="menu fl ">
                <div class="title" >
                     <span>主菜单</span>
                </div>
                <div class="list">
                     <ul class="yiji" id="menu_ul">
                           <%-- <li><a href="javascript:;" class="inactive"> <span
                                     class="glyphicon glyphicon-glass"></span>学生信息管理
                           </a>
                                <ul style="display: none">
                                     <li><a href="${basePath }rest/student/showAllStudent"><span>O</span>学生信息管理</a></li>
                                </ul>
                           </li>
                          <li><a href="javascript:;" class="inactive"> <span
                                     class="glyphicon glyphicon-fire"></span>教师信息管理
                           </a>
                                <ul style="display: none">
                                     <li><a href="${basePath }rest/teacher/getTeacherInfo"><span>O</span>教师信息管理</a></li>
                                </ul></li>
                           <li><a href="javascript:;" class="inactive"> <span
                                     class="glyphicon glyphicon glyphicon-file"></span>活动管理
                           </a>
                                <ul style="display: none">

                                <li><a href="${basePath }rest/activity/getActivity"><span>O</span>活动管理</a></li>
                                     <li><a href="${basePath }rest/activity/activity_manage"><span>O</span>新建验收任务</a></li>
                                <li><a href="${basePath }rest/page/check_list"><span>O</span>查看验收任务</a></li>
                                    

                                </ul></li>
                           <li><a href="javascript:;" class="inactive"> <span
                                     class="glyphicon glyphicon-eye-open"></span>课程管理
                           </a>
                                <ul style="display: none">
                                     <li><a href="${basePath }rest/page/card_list"><span>O</span>查看验收卡</a></li>
                                </ul></li>
                           <li><a href="javascript:;" class="inactive"> <span
                                     class="glyphicon glyphicon-warning-sign"></span>设备台账管理
                           </a>
                                <ul style="display: none">
                                     <li><a href="javascript:;"><span>O</span>待完善</a></li>
                                </ul></li> --%>
                                
                                <%
                                User user=(User)session.getAttribute("User");
                                if(user!=null){
                                int loginid=user.getType();
                                System.out.println(loginid);
                                if(loginid==0){
                                %>
                           <li>
                                <a href="javascript:;" class="inactive"> <span
                                           class="glyphicon glyphicon-warning-sign"></span>用户信息管理
                                </a>
                                <ul style="display: none">
                                     <li><a href="${basePath }rest/page/userList"><span>O</span>用户信息管理</a></li>
                                </ul>
                           </li>
                            <li>
                                <a href="javascript:;" class="inactive"> <span
                                           class="glyphicon glyphicon-warning-sign"></span>培训空间管理
                                </a>
                                <ul style="display: none">
                                     <li><a href="${basePath }rest/page/ruleManange"><span>O</span>规程制度</a></li>
                                </ul>
                           </li>
                           <li>
                                <a href="javascript:;" class="inactive"> <span
                                           class="glyphicon glyphicon-warning-sign"></span>班组信息管理
                                </a>
                                <ul style="display: none">
                                     <li><a href="${basePath }rest/page/groupManange"><span>O</span>班组信息管理</a></li>
                                     <li><a href="${basePath }rest/page/showUeditor"><span>O</span>Ueditor实例</a></li>
                                </ul>
                           </li>
                           <%}else if(loginid==1){ %>
                           <li><a href="javascript:;" class="inactive"> <span
                                     class="glyphicon glyphicon-wrench"></span>通用配置
                           </a>
                                <ul style="display: none">
                                     <li><a href="${basePath }rest/page/indexConfig"><span>O</span>首页配置</a></li>
                                     <li><a  href="${basePath }rest/page/ModuleManger"><span>O</span>模块管理</a></li>
                                </ul></li>
                                <%}
                                }else{ %>
                                <script type="text/javascript">
                                	window.location.href="${basePath }rest/login/loginout"
                                </script>
                                <%} %>
                     </ul>
                </div>
           </div>
           <div class="content fl" >
                <div class="guide clearfix">
                     <ul id="menuofclick">
                           <%-- <li data-url="${basePath }static/test/1.html">我的首页<span class="glyphicon glyphicon-remove"></span></li>
                    <li data-url="${basePath }static/test/2.html" class="gactive">工程项目管理<span class="glyphicon glyphicon-remove"></span></li> --%>
                     </ul>
                     <div></div>
                </div>
                <div class="frame">
                     <%-- <iframe src="${basePath }static/test/1.html" frameborder="0" scrolling=true class="hide"></iframe>
                <iframe src="${basePath }static/test/2.html" frameborder="0" scrolling=true></iframe> --%>
                </div>
           </div>
     </div>
	
	<!-- 用户密码修改显示模态框（Modal） -->
	<div class="modal fade" id="user_information_Modal" tabindex="-1"
		role="dialog" aria-labelledby="#user_information_ModalLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">
						用户信息<span class="glyphicon glyphicon-chevron-right"></span>修改密码
					</h4>
				</div>
				<div class="modal-body">
					<form role="form" action="" id="user_info_update_form"
						enctype="multipart/form-data">
						<input type="text" id="infoid" name="id" hidden="true">
						<div class="form-group">
							<label for="realname">原密码：</label> <input type="text"
								class="form-control" id="oldPass" name="oldPass" readonly="readonly" value="${User.password }">
						</div>
						<div class="form-group">
							<label for="mail">新密码：</label> <input type="text"
								class="form-control" id="newPass" name="newPass"
								placeholder="请输入新密码">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-success"
						id="updatePassBtn">提交</button>
					<!-- <button type="button" class="btn btn-primary" id="submitModal">
						提交</button> -->
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<!-- 前端url显示模态框（Modal） -->
	<div class="modal fade" id="urlShow_Modal" tabindex="-1"
		role="dialog" aria-labelledby="#urlShow_ModalLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">
						前端访问地址：
					</h4>
				</div>
				<div class="modal-body">
					<%-- http://localhost:8080/front?id=${groupid } --%>
					http://${ipAddress }:8080/front?id=${groupid }
					<!-- http://www.baidu.com -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
     <script type="text/javascript" src="${basePath }static/bootstrap/js/jquery.min.js"></script>
     <script type="text/javascript" src="${basePath }static/bootstrap/js/bootstrap.min.js"></script>
     <script type="text/javascript" src="${basePath }static/layer/layer.js"></script>
     <%-- <script type="text/javascript" src="${basePath }static/web/js/index.js"></script> --%>
     <script type="text/javascript">
     $(function(){
           /*var _flag= false;
           
           $("#menuofclick").mouseover(function(){
                _flag=true;
           });
           $("#menuofclick").mouseout(function(){
                _flag=false;
           });
           
           $(".guide").click(function(){
                console.log('click'+_flag);
                if($("#menuofclick").find("li").length==0){
                     $(".guide").mouseover(function(){
                           _flag=false;
                     });
                }
                
                if(_flag==false){
                if($('.menu').css('display')=='block'){
                     $('.menu').hide();
                     $('.content').css('width', '100%');
                } else {
                     $('.menu').show();
                     $('.content').css('width', '82%');
                } //end if esle
                } //end if
                
           });*/
           
           $("#btn2").click(function(){
                location.href = "${basePath }rest/login/loginout";
           });
           
           // 修改密码
           $("#updatePassBtn").click(function(){
                var url = "${basePath }rest/user/updatePass";
                $.ajax({
    				dataType : "json",
    				type : "post",
    				aysnc:false,
    				data : {
    					password : $("#newPass").val(),
    				},
    				url : url,
    				success : function(data) {
    					// 隐藏模态框
    					//关闭模态框
						$("#user_information_Modal").modal('hide');
    					if (data.status) {
    						parent.layer.msg("修改成功!");
    					} else {
    						parent.layer.msg("修改失败!");
    					}
    				}
                });
           });
           
           // 加载一级菜单
           getMenuByPid();
           init();
           
     })
     function getMenuByPid(pid){
    	 $.ajax({
				dataType : "json",
				type : "post",
				aysnc:false,
				data : {
					pid : pid,
				},
				url : "${basePath}rest/menu/getMenuByPid",
				success : function(data) {
					var menuConfigList = data.menuConfigList;
					var html = "";
					for (i = 0; i < menuConfigList.length; i++) {
						html += "<li> <a href='javascript:;' class='inactive' data-id='"+menuConfigList[i].id+"'> <span class='glyphicon glyphicon-warning-sign'></span>"+menuConfigList[i].title+"</a></li>";
					}
					// 清空并追加
					$("#menu_ul").empty().append(html);
					// 添加事件 点击一级菜单获取二级菜单
					$('.inactive').click(function(){
						var object = $(this);
						// 先获取二级菜单
						$.ajax({
							dataType : "json",
							type : "post",
							data : {
								pid : $(this).attr("data-id"),
							},
							async: false, // 设置为同步
							url : "${basePath}rest/menu/getMenuByPid",
							success : function(data) {
								 //alert("获取二级菜单");
								 var menuConfigList = data.menuConfigList;
								 var html = "<ul style='display: none'>";
								 for (i = 0; i < menuConfigList.length; i++) {
									html += "<li><a href='${basePath }rest"+menuConfigList[i].url+"?menuid="+menuConfigList[i].id+"&groupid="+menuConfigList[i].groupid+"' data-id='"+menuConfigList[i].id+"' data-type='"+menuConfigList[i].type+"'><span>O</span>"+menuConfigList[i].title+"</a></li>";
								 }
								 html += "</ul>";
								 //alert(object.attr("data-id"));
								// 清空并追加
								object.next().html("");
								object.after(html);
							}
						});
						if($(this).siblings('ul').css('display')=='none'){
							$(this).siblings('ul').slideDown(100);
							$(this).addClass('inactives');
							$(this).parents('li').siblings('li').children('ul').slideUp(100);
							$(this).parents('li').siblings('li').children('a').removeClass('inactives');
						}else{
							$(this).removeClass('inactives')
							$(this).siblings('ul').slideUp(100);
						}  
						
						
						/*点击菜单栏*/
						$(".list").find("a").click(function(){
							return false;
						});
						$(".yiji>li>ul>li").find("a").click(function(){
							var title = $(this).text();
							title = title.substring(1, title.length);
							var openUrl = $(this).attr("href");
//							console.log("title = " + title + " ; " + "url = " + openUrl);
							var exist = false;

							/*清除其他高亮*/
							$(".guide").find("li").removeClass("gactive");

							//判断导航栏中是否存在该url，若存在则高亮，改变iframe的url，若不存在则添加
							$(".guide>ul>li").each(function() {
//								console.log($(this).attr("data-url") + " : " + openUrl);
								if ($(this).attr("data-url") == openUrl) {
									$(this).addClass("gactive");
									exist = true;
//									console.log("this url is already exist ~~1");
								}
							});
							
							if (exist == true) {
//								console.log("this url is already exist ~~2");	
								/*切换iframe*/
								/*hide之前展示的iframe，show展示的iframe*/
								$(".frame>iframe").addClass("hide").each(function(){
									if ($(this).attr("src") == openUrl) {
										$(this).removeClass("hide");
										$(this).attr("src", openUrl);//点击更改url
									}
								});
							}else {
								var html = '<li data-url="' + openUrl + '" class="gactive">' + title + '<span class="glyphicon glyphicon-remove"></span></li>';
								$(".guide>ul").append(html);
								/*导航栏绑定事件*/
								init();
								/*拼接iframe*/
								html = '<iframe src="' + openUrl +'" frameborder="0" scrolling=true></iframe>';
								/*隐藏之前的iframe*/
								$(".frame>iframe").addClass("hide");
								$(".frame").append(html);
							}
							return false;
						});
						
					});
				}
			});
    	 
     }
     function init() {
			/*关闭导航标签栏*/
			$(".guide>ul>li").find("span").off().click(function(){
				var $parent = $(this).parent();
				var closeUrl = $parent.attr("data-url");
				
				/*删除导航栏和iframe*/
				$parent.remove();
				$(".frame>iframe").each(function(){
					if ($(this).attr("src") == closeUrl) {
						$(this).remove();
					}
				});

				/*选择末尾item高亮，展示末尾iframe*/
				var $item = $(".guide>ul>li:last");
				$item.addClass("gactive");
				var openUrl = $item.attr("data-url"); 
				$(".frame>iframe:last").removeClass("hide");

			});

			/*点击导航标签栏高亮*/
			$(".guide>ul>li").off().click(function(){
				$(this).siblings().removeClass("gactive");
				$(this).addClass("gactive");
				/*切换iframe*/
				var openUrl = $(this).attr("data-url");
				/*hide之前展示的iframe，show展示的iframe*/
				$(".frame>iframe").addClass("hide").each(function(){
					if ($(this).attr("src") == openUrl) {
						$(this).removeClass("hide");
					}
				});
			});
		}

     </script>
</body>
</html>

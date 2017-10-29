<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<title>添加主页面的菜单</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${basePath }static/web/css/base.css">
<link rel="stylesheet"
	href="${basePath }static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${basePath }static/bootstrap/css/bootstrap-theme.min.css">
<link href="${basePath }static/web/css/display/custom.css"
	rel="stylesheet" />
<style type="text/css">
.panel {
	margin-top: 40px;
}

.box {
	
}

.panel-heading {
	background: #F1F9F8 !important;
	color: #1ABC9C;
	font-weight: bold;
	font-size: 14px;
}

.icon {
	background-color: #1ABC9C !important;
	border-radius: 50%;
	width: 30px;
	height: 30px;
	border: none;
}

.panel-body label {
	color: #57CEB6;
	font-weight: 400;
}

.list-unstyled {
	width: 80%;
	float: left;
	margin-left: 300px;
	left: 7%;
}

.list-inline {
	width: 100%;
}

.list-inline li {
	width: 150px;
	height: 60px;
}

.info input {
	margin-bottom: 6px;
}

label {
	color: black !important;
}

.name, .checktype, .devicetype {
	height: 50px;
}

.info-label {
	margin-left: 6px;
}

#c_dtid, .c_type {
	height: 30px;
	width: 200px;
}

.devicetype label, .checktype label, .name label {
	text-align: center;
	width: 80px;
}
.center-vertical {
    position:relative;
    top:50%;
    transform:translateY(-50%);
}
.showMenu{
	position:relative;
}
.showBackground{
	left:15%;
}
.showIcon{
	position:absolute;
	top:22%;
	left:26%;
}
.showTitle{
	position: absolute;
    text-align: center;
    color: #fff;
    margin-top: 15%;
    width: 132px;
    font-size: xx-large;
}
#clipAreaBg{
	height: 330px;
}
#clipAreaIcon{
	height: 150px;
}


/* .showimg {
	width:300px;
	height:300px;
} */
</style>
</head>
<body>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading">
				<button class="icon" disabled="disabled">
					<span class="glyphicon glyphicon-th-large"></span>
				</button>
				新建主页菜单
			</div>
			<div class="panel-body">
				<form action="" method="post" role="form" id="addform">
					<div class="panel-body card">
						<%-- <div class="checktype">
							<label>菜单预览:</label>
							<div class="col-md-12">
								<div class="col-md-6 col-md-offset-1">
									<img alt="" src="${basePath}static/web/img/peixunkongjian-bg.png" class="showimg" id="showBgimg">
									<div class="showIcon">
										<img alt="" src="${basePath}/static/web/img/banzhujianjie-icon.png" class="" id="showIconimg">
										<div class="showTitle" style="width: 300px;left: -84px; border-left-width: 22px; ">未填写</div>
									</div>
								</div>
							</div>
						</div>   --%>
						<div class="checktype">
							<label>菜单预览:</label>
							<div class="showIcon" style="position:relative;width:200px;height:200px">
							 <img  style="position:absolute;top:0;left:0"alt="" src="${basePath}static/web/img/menubg/dianlizhishiku_bg.png" class="showimg" id="showBgimg" width="200">
							
								<img style="position:absolute;top:30px;width:80px;left:60px" alt="" src="${basePath}/static/web/img/menuicon/banzujianjie_icon.png" class="" id="showIconimg" >
								<span class="showTitle" style="position: absolute; color: #fff;width: 132px;
    font-size: 2rem; display:inline-block;left:30px;top:120px;">未填写</span>
							</div>
						</div>  
						<div class="checktype" style="margin-top: 250px;">
							<label style="">父级菜单:</label> 【级别】 <span
								style="text-align: center;"><select class="c_type"
								style="width: 100px;" name="level" id="typeSt">
									<option value="1">--未选择--</option>
									<option value="2">一级菜单</option>
									<option value="3">二级菜单</option>
									<option value="4">三级菜单</option>
							</select></span> &nbsp;&nbsp;【列表】:<select class="c_type" name="pid"
								id="titleSt">
								<option value="#">--请先选择级别--</option>
							</select> <span style="color: red;">&nbsp;&nbsp;&nbsp;&nbsp;*不选择则添加的菜单默认为一级菜单</span>
						</div>
						<div class="name">
							<label>菜单名称:</label> <input type="text" name="title" id="menuname"
								style="width: 350px; border: solid 1px #ccc; color: #555; height: 30px;" placeholder="请输入菜单名称">
						</div>
						<div class="devicetype">
							<label>使用模板:</label>
							<select class="c_type" style="width: 100px;" name="type" id="moduleSt">
									<!-- <option value="0">--未选择--</option> -->
									<option value="1">富文本</option>
									<option value="2">ppt</option>
									<option value="3">表格</option>
									<option value="4">表单</option>
									<option value="5">链接</option>
									<option value="6">相册</option>
							</select><span style="color: red;">&nbsp;&nbsp;&nbsp;&nbsp;*默认为富文本</span><!-- <span style="color: red;">&nbsp;&nbsp;&nbsp;&nbsp;*若该菜单下面还有子菜单,则不选择模板</span> -->&nbsp;&nbsp;<!-- <label>菜单url:</label><input type="text" name="title" id="menuname"
								style="width: 350px; border: solid 1px #ccc; color: #555; height: 30px;"
								onblur="if(this.value == '')this.value='请输入菜单url';"
								onclick="if(this.value == '请输入菜单url')this.value='';"
								placeholder="请输入菜单url"> -->
						</div>
						<div class="devicetype">
							<label>菜单状态:</label>
							<select class="c_type" style="width: 100px;" name="status" id="statusSt">
									<option value="1" selected="selected">隐藏</option>
									<option value="0">显示</option>
							</select><!-- <span style="color: red;">&nbsp;&nbsp;&nbsp;&nbsp;*默认为隐藏状态</span> -->
						</div>
						<div class="checktype">
							<label style="">菜单背景:</label>
							<!-- 菜单背景按钮触发模态框 -->
							<button type="button" class="btn btn-info" data-toggle="modal" data-target="#bgModal" id="bgBtn">选择背景</button>
							<button type="button" class="btn btn-primary" id="uploadBg">上传背景</button>
						</div>

						<div class="devicetype">
							<label>菜单图标:</label>
							<!-- 菜单图标按钮触发模态框 -->
							<button type="button" class="btn btn-info" data-toggle="modal" data-target="#iconModal" id="iconBtn">选择图标</button>
							<button type="button" class="btn btn-primary" id="uploadIcon">上传图标</button>
						</div>
						
						<div class="form-group">
							<div class="col-sm-offset-8 col-sm-4" style="text-align: right">
								<button type="button" class="btn btn-theme" id="submitBtn">提交</button>
								<button type="reset" class="btn btn-theme-cancel" onclick="history.back();">返回</button>
							</div>
						</div>
						<div id="hiddenBg"><input type="hidden" name="backgroundid" value="1"></div>
						<div id="hiddenIcon"><input type="hidden" name="iconid" value="1"></div>
						<input type="hidden" name="icontype" id="icontype"/>
						<input type="hidden" name="bgtype" id="bgtype"/>
				</form>
			</div>
		</div>
	</div>
	<!-- 菜单背景模态框 -->
	<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="bgModal">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<!-- <h4 class="modal-title" id="bgModalLabel">菜单背景：</h4> -->
					<div class="alert alert-info">
						<strong>菜单背景 </strong> /你可以去点击选择
					</div>
				</div>
				<div class="modal-body" id="bgBody">
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<!-- <button type="button" class="btn btn-primary">提交更改</button> -->
				</div>
			</div>
		</div>
	</div>
	<!-- 菜单图标模态框 -->
	<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="iconModal">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<!-- <h4 class="modal-title" id="bgModalLabel">菜单背景：</h4> -->
					<div class="alert alert-info">
						<strong>菜单图标 </strong> /你可以去点击选择
					</div>
				</div>
				<div class="modal-body" id="iconBody" style='background-color:#ddd;'>
					 
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<!-- <button type="button" class="btn btn-primary">提交更改</button> -->
				</div>
			</div>
		</div>
	</div>
	
	<!--在模态框中上传新的背景 -->
	<div class="modal fade" id="updateBgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-flag="0">
	   <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	        <h4 class="modal-title" id="myModalLabel"><span class="modalHeadTitle">上传新的菜单背景</span><span class="modalTitleRemark">注：请上传330*330的矢量图</span></h4>
	      </div>
		  <div class="modal-body">
				<div id="clipAreaBg"></div>
				<input type="file" id="Bgfile">
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-primary" id="modifyNewBgBtn"  data-dismiss="modal">保存</button>
	        <!-- <button type="button" class="btn btn-primary" id="saveUpdateIcon"  data-dismiss="modal">保存</button> -->
	      </div>
	    </div>
	  </div>
	</div>
	
	<!--在模态框中上传新的图标 -->
	<div class="modal fade" id="updateIconModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-flag="0">
	   <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	        <h4 class="modal-title" id="myModalLabel"><span class="modalHeadTitle">上传新的菜单图标</span><span class="modalTitleRemark">注：请上传150*150的矢量图</span></h4>
	      </div>
		  <div class="modal-body">
				<div id="clipAreaIcon"></div>
				<input type="file" id="Iconfile">
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-primary" id="modifyNewIconBtn"  data-dismiss="modal">保存</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<script type="text/javascript" src="${basePath }static/bootstrap/js/jquery.min.js"></script>
	<script type="text/javascript" src="${basePath }static/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${basePath }static/layer/layer.js"></script>
	<script type="text/javascript" src="${basePath }static/photoClip/js/iscroll-zoom.js"></script> <!--实现图片的移动-->
	<script type="text/javascript" src="${basePath }static/photoClip/js/hammer.js"></script>
	<script type="text/javascript" src="${basePath }static/photoClip/js/lrz.all.bundle.js"></script>
	<script type="text/javascript" src="${basePath }static/photoClip/js/jquery.photoClip.js"></script> <!--实现图片的剪裁-->
	<script type="text/javascript">
		$(function() {
			// 加载系统提供的背景和图标
			$.ajax({
				dataType : "json",
				type : "post",
				data : {
					level : $(this).val()
				},
				url : "${basePath}rest/menu/getAllModule",
				success : function(data) {
					// 解析数据
					var iconList = data.iconList;
					var backgroundList = data.backgroundList;
					var html = "<div class='row text-center pad-top'>";
					for (var i = 0; i < backgroundList.length; i++) {
						html += "<div class='col-lg-2 col-md-2 col-sm-2 col-xs-6'>"
							+"<div class='div-square center-block'>"
								+"<a href='#' data-id='"+backgroundList[i].id+"' data-name='"+backgroundList[i].bgname+"' class='imgclick'> <img src='${basePath }static/web/img/menubg/"+backgroundList[i].bgname+"' alt='点我' width='80px;' height='80px;'></a>"
							+"</div></div>";
						
						/* html += "<div class='box' data-id='"+backgroundList[i].id+"'><img src='${basePath }static/web/img/"+backgroundList[i].bgname+"' alt='点我'></div>" */
					}
					html += "</div>";
					$("#bgBody").html(html);
					var html = "<div class='row text-center pad-top'>";
					for (var i = 0; i < iconList.length; i++) {
						html += "<div class='col-lg-2 col-md-2 col-sm-2 col-xs-6'>"
							+"<div class='div-square center-block'>"
								+"<a href='#' data-id='"+iconList[i].id+"' data-name='"+iconList[i].iconname+"' class='iconimgclick'> <img src='${basePath }static/web/img/menuicon/"+iconList[i].iconname+"' alt='点我' width='80px;' height='80px;'></a>"
							+"</div></div>";
						/* html += "<div class='box' data-id='"+iconList[i].id+"'><img src='${basePath }static/web/img/"+iconList[i].iconname+"' alt='点我'></div>" */
					}
					html += "</div>";
					$("#iconBody").html(html);
					
					// 填充完数据后 添加图片点击事件
					$(".imgclick").click(function () {
						// 得到背景图片的id
						var bgid = $(this).attr("data-id");
						var bgname = $(this).attr("data-name");
						
						$("#hiddenBg").empty().append('<input type="hidden" name="backgroundid" value="'+bgid+'">');
						// 替换预览的图片
						$("#showBgimg").attr("src","${basePath}static/web/img/menubg/"+bgname);
						// 设置新建类型 1就是选
						$("#bgtype").val(1);
						//隐藏模态框
						$("#bgModal").modal("hide");
						// alert(bgid);
					});
					$(".iconimgclick").click(function () {
						// 得到图标的id
						var iconid = $(this).attr("data-id");
						var iconname = $(this).attr("data-name");
						
						$("#hiddenIcon").empty().append('<input type="hidden" name="iconid" value="'+iconid+'">');
						// 替换预览的图片
						$("#showIconimg").attr("src","${basePath}static/web/img/menuicon/"+iconname);
						// 设置新建类型 1就是选
						$("#icontype").val(1);
						//隐藏模态框
						$("#iconModal").modal("hide");
						// alert(bgid);
					});
				}
			}); 
			
			// 点击按钮弹出选择图片的的模态框
			$("#uploadBg").click(function(){
				// 设置data-flag = 1
				$("#updateBgModal").modal("show");
			});
			$("#uploadIcon").click(function(){
				// 设置data-flag = 2
				$("#updateIconModal").modal("show");
			});
			
			// 背景
			var clipAreaBg = new bjj.PhotoClip("#clipAreaBg", {
				size: [330, 330],
				outputSize: [330, 330],
				file: "#Bgfile",
				ok: "#modifyNewBgBtn",
				loadStart: function() {
					console.log("照片读取中");
				},
				loadComplete: function() {
					console.log("照片读取完成");
				},
				clipFinish: function(dataURL) {
					var url = '${basePath}rest/menu/addSmallBg';
					$.ajax({
						data:{base64:dataURL,Bgfile:$("#Bgfile").val()},
						type:'post',
						dataType:'json',
						url:url,
						success:function(data){
							if(data.msg=='success'){
								var imgName=data.imgName;
								parent.layer.msg("上传成功");
								// 设置新建类型 2就是自己上传
								$("#bgtype").val(2);
								$("#showBgimg").attr("src","${basePath}static/web/img/menubg/"+imgName);
								$("#hiddenBg").empty().append('<input type="hidden" name="bgname" value="'+imgName+'">');
							}else{
								parent.layer.msg("上传失败！");
							}
						}
					})
				}
			});
			// 图标
			var clipAreaIcon = new bjj.PhotoClip("#clipAreaIcon", {
				size: [150, 150],
				outputSize: [150, 150],
				file: "#Iconfile",
				ok: "#modifyNewIconBtn",
				loadStart: function() {
					console.log("照片读取中");
				},
				loadComplete: function() {
					console.log("照片读取完成");
				},
				clipFinish: function(dataURL) {
					var url = '${basePath}rest/menu/addIcon';
					$.ajax({
						data:{base64:dataURL,Iconfile:$("#Iconfile").val()},
						type:'post',
						dataType:'json',
						url:url,
						success:function(data){
							if(data.msg=='success'){
								var imgName=data.imgName;
								parent.layer.msg("上传成功");
								// 设置新建类型 2就是自己上传
								$("#icontype").val(2);
								$("#showIconimg").attr("src","${basePath}static/web/img/menuicon/"+imgName);
								$("#hiddenIcon").empty().append('<input type="hidden" name="iconname" value="'+imgName+'">');
							}else{
								parent.layer.msg("上传失败！");
							}
						}
					})
				}
			});


		});
		
		/* // 菜单名称输入框值改变事件
		$("#menuname").change(function(){
			$(".showTitle").html($(this).val());
			
		}); */
		//文字实时更新
		$('#menuname').bind('input propertychange', function() {
			var title=$(this).val();
			$(".showTitle").text(title);
		});
		//根据菜单级别跳转菜单列表
		$("#typeSt").change(
			function() {
				$.ajax({
					dataType : "json",
					type : "post",
					data : {
						level : ($(this).val()-1)
					},
					url : "${basePath}rest/menu/getMenuByLevel",
					success : function(data) {
						// 解析数据
						var menuconfigList = data.menuconfigList;
						var html = "";
						var html1 = "";
						for (var i = 0; i < menuconfigList.length; i++) {
							html += "<option value='"+menuconfigList[i].id+"'>"
									+ menuconfigList[i].title
									+ "</option>"
						}
						html1 = "<option value='#'>-未选择-</option>"
								+ html;
						//alert(html1);
						$("#titleSt").html(html1);
					}
				});
		});
		
		// 菜单状态下拉框更改 触发事件
		$("#statusSt").change(function(){
			
			// 先判断是否是添加的一级菜单
			var type = $("#typeSt").val(); // 默认为1
			if (type == 1) { //添加一级菜单
				// 获取val
				var status = $(this).val();
				if (status == 0) {
					// 设置为显示
					// 去后台查 看一级页面是否有8个菜单显示
					$.ajax({
							dataType : "json",
							type : "post",
							data : {},
							url : "${basePath}rest/menu/menuCanShow",
							success : function(data) {
								// 
								if (data.status) {
									// 一级页面的菜单未满8个
									// 设置为显示
									$("#statusSt").val(0);
								} else {
									// 满8个
									parent.layer.msg("抱歉，一级菜单一级有8个，你可以先去隐藏其中的菜单！");
									// 设置为隐藏
									$("#statusSt").val(1);
								}
							}
					});
				}
			} 
		});
		
		// 点击提交按钮触发事件
		$("#submitBtn").click(
			function() {
				// 先判断是否选择了菜单的级别和列表，两者要么不选要么全选
				var type = $("#typeSt").val(); // 默认为1
				var title = $("#titleSt").val(); // 默认为#
				var module_type = $("#moduleSt").val(); // 模板类型
				//alert(""+type+"||"+title+((type == 0 && title == 0) || (type != 0 && title != 0)));
				var menuname = $("#menuname").val(); // 菜单名称
				//获取对应数据
				//先序列化不含有file文件的表单
				var formData = $("#addform").serialize();
				//序列化含有file文件的表单
				//var formData = new FormData($("#addform")[0]);
				if (((type == 1 && title == '#') || (type != 1 && title != '#'))) {
					if (menuname != "") {
						// 正确的情况
						$.ajax({
							dataType : "json",
							type : "post",
							data : formData,
							url : "${basePath}rest/menu/addMenu",
							success : function(data) {
								// 解析数据
								if (data.status == true) {
									parent.layer.msg("菜单新建成功！");
									// 跳转到上级页面
									window.location.href = "${basePath}rest/page/ModuleManger";
								}
							}
						});
					} else {
						parent.layer.msg("请输入菜单名称！");
					}
				} else {
					// 不正确的情况
					parent.layer.msg("请注意:菜单的级别和列表着两项，要么都选，要么都不选！");
					/* parent.layer.msg("各项均为比填项！"); */
					/* window.location.href = "{basePath }rest/studentAction!toShowStudentList"; */
				}
				
			});
	</script>
</body>
</html>
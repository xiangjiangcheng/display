<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>401</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${basePath }static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${basePath }static/bootstrap/css/bootstrap-theme.min.css">
<style>
.showView {
	width: 800px;
	height: 650px;
	border: 1px solid #ccc;
	margin: 10px auto;
}

#viewerPlaceHolder {
	width: 800px;
	height: 650px;
	display: block;
}

.input-append {
	width: 300px;
	display: inline-block;
}

.content {
	width: 100%;
	text-align: center;
	margin: 20px 0;
}

.save {
	width: 100%;
	text-align: center;
}
</style>
</head>
<body>
	<form method="post" enctype="multipart/form-data" id="addForm">
		<div class="content">
			<input id="lefile" type="file" name="file" style="display: none">
			<div class="input-append">
				<input id="photoCover" class="input-large" type="text"
					style="height: 35px;"> <a class="btn btn-success"
					onclick="$('input[id=lefile]').click();">选择</a>
			</div>
			<input class="btn btn-success" type="button" value="上传"
				id="submitBtn">
		</div>
	</form>
	<div class="showView">
		<a id="viewerPlaceHolder"></a>
	</div>
	<div class="save">
		<input class="btn btn-success" type="button" value="保存"
			id="savebutton">
	</div>

	<input class="groupid" type="hidden" value="${groupid}">
	<input class="menuid" type="hidden" value="${menuid}">
</body>
<script type="text/javascript"
	src="${basePath }static/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${basePath }static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${basePath }static/layer/layer.js"></script>
<script type="text/javascript"
	src="${basePath }static/FlexPaper_1.5.1_flash/js/jquery.js"></script>
<script type="text/javascript"
	src="${basePath }static/FlexPaper_1.5.1_flash/js/flexpaper_flash.js"></script>
<script type="text/javascript"
	src="${basePath }static/FlexPaper_1.5.1_flash/js/flexpaper_flash_debug.js"></script>
<script>
	$(function(){
		QueryFlash();
		
		function QueryFlash(){
			
			formData={
					groupid:$(".groupid").val()	
			}
			$.ajax({
				url : "${basePath}rest/module/QueryFlash",
				type : "POST",
				data : formData,
				success : function(data) {
					var fp = new FlexPaperViewer(
							'../../FlexPaperViewer',
							'viewerPlaceHolder',
							{
								config : {
									SwfFile : escape('http://localhost:8080/display/upload/'+ data.modulePpt.fileName),//编码设置  
									Scale : 0.6,
									ZoomTransition : 'easeOut',//变焦过渡  
									ZoomTime : 0.5,
									ZoomInterval : 0.2,//缩放滑块-移动的缩放基础[工具栏]  
									FitPageOnLoad : true,//自适应页面  
									FitWidthOnLoad : true,//自适应宽度  
									FullScreenAsMaxWindow : false,//全屏按钮-新页面全屏[工具栏]  
									ProgressiveLoading : false,//分割加载  
									MinZoomSize : 0.2,//最小缩放  
									MaxZoomSize : 3,//最大缩放  
									SearchMatchAll : true,
									InitViewMode : 'Portrait',//初始显示模式(SinglePage,TwoPage,Portrait)  

									ViewModeToolsVisible : true,//显示模式工具栏是否显示  
									ZoomToolsVisible : true,//缩放工具栏是否显示  
									NavToolsVisible : true,//跳页工具栏  
									CursorToolsVisible : false,
									SearchToolsVisible : true,
									PrintPaperAsBitmap : false,
									localeChain : 'en_US'
								}
							});
				}
			});
		}
	});
	$(function() {
		$('input[id=lefile]').change(function() {
			$('#photoCover').val($(this).val());
			});
		$("#submitBtn").click(
						function() {

							//序列化含有文件的表单
							var formData = new FormData($("#addForm")[0]);
							$.ajax({
										url : "${basePath}rest/module/flash",
										type : "POST",
										data : formData,
										async : false,
										cache : false,
										contentType : false,
										processData : false,
										success : function(data) {
											//alert(data.flashname);
											// flash文件名
											var fp = new FlexPaperViewer(
													'../../FlexPaperViewer',
													'viewerPlaceHolder',
													{
														config : {
															SwfFile : escape('${basePath}upload/'+ data.flashname),//编码设置  
															Scale : 0.6,
															ZoomTransition : 'easeOut',//变焦过渡  
															ZoomTime : 0.5,
															ZoomInterval : 0.2,//缩放滑块-移动的缩放基础[工具栏]  
															FitPageOnLoad : true,//自适应页面  
															FitWidthOnLoad : true,//自适应宽度  
															FullScreenAsMaxWindow : false,//全屏按钮-新页面全屏[工具栏]  
															ProgressiveLoading : false,//分割加载  
															MinZoomSize : 0.2,//最小缩放  
															MaxZoomSize : 3,//最大缩放  
															SearchMatchAll : true,
															InitViewMode : 'Portrait',//初始显示模式(SinglePage,TwoPage,Portrait)  

															ViewModeToolsVisible : true,//显示模式工具栏是否显示  
															ZoomToolsVisible : true,//缩放工具栏是否显示  
															NavToolsVisible : true,//跳页工具栏  
															CursorToolsVisible : false,
															SearchToolsVisible : true,
															PrintPaperAsBitmap : false,
															localeChain : 'en_US'
														}
													});
											/*  b保存*/
											$("#savebutton").click(function(){
												var filename = data.flashname;
;
												$.ajax({
													type:"post",
													dataType:"json",
													data:{
														filename:filename,
														groupid:$(".groupid").val(),
														menuid:$(".menuid").val()
													},
													url:"${basePath}rest/module/toaddFlash",
													success:function(data){
														if(data.flag) {
															parent.layer.msg("保存成功！");
														} else {
															parent.layer.msg("保存失败！");
														}
														
													},
													error:function(data){
														parent.layer.msg(data.msg);
													}
												});
											});
											
										},
										error : function(data) {
											alert("error:" + returndata);
										}
									});
						});
	});
</script>
</html>

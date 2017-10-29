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
	
        .showView{
        	width:400px;
        	height:400px;
        	border:1px solid #ccc;
        	margin:10px auto;
		}
		
        #viewerPlaceHolder{
        	width: 620px; height: 650px; display: block;
        }
        
	</style>
</head>
<body>
	<input id="uploadFile" placeholder="Choose File" disabled="disabled" />

    <form method="post" enctype="multipart/form-data" id="addForm">
		<div class="fileUpload btn btn-primary">
		    <span>Upload</span>
		    <input id="uploadBtn" type="file" name="file" class="upload" />
		</div>
	        <input type="button" value="上传" id="submitBtn">
	</form>
	<div class="showView">
			<a id="viewerPlaceHolder"></a>
	</div>
</body>
	<script type="text/javascript" src="${basePath }static/bootstrap/js/jquery.min.js"></script>
	<script type="text/javascript" src="${basePath }static/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${basePath }static/layer/layer.js"></script>
	<script type="text/javascript" src="${basePath }static/FlexPaper_1.5.1_flash/js/jquery.js"></script>
	<script type="text/javascript" src="${basePath }static/FlexPaper_1.5.1_flash/js/flexpaper_flash.js"></script>
	<script type="text/javascript" src="${basePath }static/FlexPaper_1.5.1_flash/js/flexpaper_flash_debug.js"></script>
	<script>
	$(function(){
		$("#uploadBtn").change(function(){
			$("#uploadFile").val($(this).val());
		});
		
		$("#submitBtn").click(function(){
			//序列化含有文件的表单
			var formData = new FormData($("#addForm")[0]);
		    $.ajax({
		          url:"${basePath}rest/module/flash",
		          type:"POST",
		          data:formData,
		          async:false,
		          cache:false,
		          contentType:false,
		          processData:false,
		          success:function(data){
		        	  	// flash文件名
		       		var fp = new FlexPaperViewer('FlexPaperViewer',
					'viewerPlaceHolder', {
						config : {
							SwfFile : escape('${basePath}upload/'+data),//编码设置  
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
		          },
		          error:function(data){
		                 alert("error:"+returndata);
		          }
		    });
		});
	});
		
	</script>
</html>

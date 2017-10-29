<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>首页配置</title>
<link rel="stylesheet"
	href="${basePath }static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${basePath }static/bootstrap/css/bootstrap-theme.min.css">
<style>
li{ list-style:none;}
#form {
	width: 85%;
	margin:0 auto;
	padding-top: 2em;
}
ul li{ text-align:center;}
label {
	color: #1ABC9C;
}
.img{
	width:240px;
	height:135px;
	margin-bottom:1em;
}
.showimg {
	width:480px;
	height:270px;
	margin-bottom:1em;
}
.modal-header{
	text-align:center;
}
.subbtn{
	width:85%;
	margin:0 auto;
	text-align:center;
}
.somebg{
 	position:relative;
}
.radio{
	width:480px;
	height:270px;
	margin-bottom:1em;
	position:absolute;
	left：0;
	top:0;
	filter:alpha(opacity=0);
	opacity:0;
}
.glyphicon-ok{
	color:#1ABC9C;
	font-size: 20px;
	position: absolute;
	left:90px;
	top:5px;
	display:none;
	} 
#clipAreaBg{
	width:960px;
	height:540px;
}
#updateBgModal{
	width:960px !important;
}
.modal-dialog{
	padding:0;
	width:960px !important;
}
.modal-content{
	width:100%;
}
#Bgfile{
	width:200px;
	margin:0 auto;
	margin-top:2em;
}
</style>
</head>
<body>
	<form id="form" method="post" enctype="multipart/form-data"
		class="form-horizontal"
		<%-- action="${basePath}rest/indexConfig/updateConfig?groupid="+ ${groupid} --%>>
		<input name="id" type="hidden" value="${title.id}">
		<input class="groupid" type="hidden" value="${groupid}">
		<div class="form-group">
			<label for="inputtitle1" class="col-sm-2 control-label">主标题：</label>
			<div class="col-sm-10">
				<input type="text" name="title1" class="form-control"
					id="inputtitle1" placeholder="主标题" value="${title.title1}">
			</div>
		</div>
		<div class="form-group">
			<label for="inputtitle2" class="col-sm-2 control-label">副标题：</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="title2"
					id="inputtitle2" placeholder="副标题" value="${title.title2}">
			</div>
		</div>
		<div class="form-group">
			<label for="inputtitle2" class="col-sm-2 control-label">班组下拉框背景：</label>
			<div class="col-sm-10">
					<select class="" style="width: 100px;" name="groupStBgcolor" id="groupStBgcolor" >
					
						<option value="#066D60">紫色</option>
						<option value="red">红色</option>
						<option value="blue">蓝色</option>
						<option value="#066D60">彩色</option>
					</select>
					<input type="hidden" value="${title.groupStBgcolor}" id="groupBgC">
			</div>
		</div>
		<div class="form-group">
			
			<label for="inputfile" class="col-sm-2 control-label">背景：</label>
			
			<div class="col-sm-10">
				<div class="">
					<input class="hidimg" name="backgroundid" type="hidden" value="${background.bgname}"/>
					<image class="showimg img"
						src="${basePath }static/web/img/bg/${background.bgname}" />
				</div>	
				<div class="">
					<button type="button" class="btn btn-info" id="chooseBg" data-toggle="modal" data-target="#bgModal">选择背景</button>
					<button type="button" class="btn btn-primary" id="uploadBg">上传背景</button>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10 subbtn">
				<button type="submit" class="btn btn-primary">提交</button>
			</div>
		</div>
	</form>
	<!--模态框中选择背景 -->
	<div class="modal fade" id="bgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">选择背景</h4>
	      </div>
	      <div class="modal-body col-md-12">
	        	<c:forEach var="backgrounds" items="${backgrounds}">
					<div class="col-md-4 somebg">
						<img class="img" src="${basePath }static/web/img/bg/${backgrounds.bgname}">
						<input class="radio" type="radio" value="${backgrounds.id }">
					</div>
				</c:forEach>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	      </div>
	    </div>
	  </div>
	</div>
<!--在模态框中上传新的背景 -->
				<div class="modal fade" id="updateBgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  					<div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				        <h4 class="modal-title" id="myModalLabel"><span class="modalHeadTitle">上传新的菜单背景</span><span class="modalTitleRemark">注：请上传1920*1080的矢量图</span></h4>
				      </div>
					  <div class="modal-body">
							<div id="clipAreaBg"></div>
							<input type="file" id="Bgfile">
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				        <button type="button" class="btn btn-primary" id="saveUpdateBg"  data-dismiss="modal">保存</button>
				      </div>
				    </div>
				  </div>
				</div>
	<input id="msg" type="hidden" value="${msg}">
	
</body>
<script type="text/javascript" src="${basePath }static/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="${basePath }static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${basePath }static/layer/layer.js"></script>
<script type="text/javascript" src="${basePath }static/photoClip/js/iscroll-zoom.js"></script> <!--实现图片的移动-->
<script type="text/javascript" src="${basePath }static/photoClip/js/hammer.js"></script>
<script type="text/javascript" src="${basePath }static/photoClip/js/lrz.all.bundle.js"></script>
<script type="text/javascript" src="${basePath }static/photoClip/js/jquery.photoClip.js"></script> <!--实现图片的剪裁-->
<script>
	$(function() {
		// 得到班组背景颜色
		var groupBgC = $("#groupBgC").val();
		// 选中
		$("#groupStBgcolor").val(groupBgC);
		var groupid = $(".groupid").val();
		$("#form").attr("action","${basePath}rest/indexConfig/updateConfig?groupid="+groupid);
		//弹出提示框
		if ($("#msg").val() != "") {
			parent.layer.msg($("#msg").val());
		}

		$(".radio").click(function(){
			var id = $('input:radio:checked').val();
			var src = $('input:radio:checked').prev().attr("src");
			$(".hidimg").val(id);
			$(".showimg").attr("src",src);
			$(this).attr("data-dismiss","modal");
		});

		//点击上传背景的按钮
		$("#uploadBg").click(function(){
			$("#updateBgModal").modal("show");
		});
		//上传背景的剪切插件
		var clipArea = new bjj.PhotoClip("#clipAreaBg", {
			size: [960, 540],
			outputSize: [960, 540],
			file: "#Bgfile",
			ok: "#saveUpdateBg",
			loadStart: function() {
				console.log("照片读取中");
			},
			loadComplete: function() {
				console.log("照片读取完成");
			},
			clipFinish: function(dataURL) {
	
				$.ajax({
					data:{base64:dataURL,Bgfile:$("#Bgfile").val()},
					type:'post',
					dataType:'json',
					url:'${basePath}rest/indexConfig/addbigbg',
					success:function(data){
						if(data.msg=='success'){
							var imgname=data.imgName;
							parent.layer.msg("修改背景成功");
							$(".showimg").attr("src","${basePath}static/web/img/bg/"+imgname+"");
							$(".hidimg").val(""+imgname+"");
						}else{
							parent.layer.msg("修改背景失败！");
						}
					}
				})
			}
		});
		
	});
</script>
</html>
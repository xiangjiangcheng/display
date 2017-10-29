<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%-- <%@ page import="org.apache.commons.lang.StringUtils"%> --%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<%-- <link rel="stylesheet" href="${basePath }static/web/css/base.css"> --%>
<link rel="stylesheet"
	href="${basePath }static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${basePath }static/bootstrap/css/bootstrap-theme.min.css">

<style>
.fileDetail {
	width: 200px;
	height: 200px;
	margin: 6px 3px;
	position: relative;
	float: left;
}

.img {
	width: 100%;
	height: 100%;
}

.title {
	width: 100%;
	margin:0 auto;
	height:34px;
	color: #fff;
	font-size: 2vw;
	position: absolute;
	left:0;
	bottom:20px;
	text-align: center;
	background: #ccc;
	filter:alpha(opacity=80);
	opacity:0.8;
	border:0;
	font-family: “Microsoft YaHei” ! important; 
}
.add{
	color: #ccc;
	font-size: 40px;
	position: absolute;
	width: 100%;
	height:100%;
	text-align: center;
	line-height:200px;
	top:0;
	left:0;
}
.addimg{
	width: 100%;
	height: 100%;
	background:#fff;
	border:2px solid #ccc;
	border-radius:5px;
}
.delet,.delete{
	border:2px solid #fff;
	border-radius:50%;
	padding:1px 6px; 
	position:absolute;
	top:2px;
	right:5px;
	color:#fff;
	font-weight:bold;
}
#addModal{
	width:960px;
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
#saveadd{
	margin-top:80px;
}
.control-label{
 	width:100%;
 	text-align:center;
}
.content{
	margin-top:10px;
	text-align: center;
}
.form-group{
	margin:10px 0 80px 0;
}
.word{
	font-family: “Microsoft YaHei” ! important; 
}
</style>
</head>
<body>
	<input class="albumid" type="hidden" value="${album.id}">
	<div class="form-group">
			<label class="word" for="inputtitle1" class="control-label">相册标题：</label>
			<div class="col-sm-12">
				<input type="text" class="form-control name word"
				 placeholder="相册标题" value="${album.name}">
			</div>
	</div>
	<div class="content">
		<c:forEach var="albumImgs" items="${albumImgs}" varStatus="status">
			<div class="fileDetail" at-id="${albumImgs.id}">
				<img src="${basePath }static/web/img/photo/${albumImgs.filename}"
					alt="" class="img-rounded img"> 
				<input at-id="${albumImgs.id}" type="text" class="title titlename" value="${albumImgs.realname}"/>
				<span at-id="${albumImgs.id}" class="delet">x</span>
			</div>
		</c:forEach>
		
		<div class="fileDetail">
			<div class="addimg"></div>
			<span data-toggle="modal" data-target="#addModal" class="add">+</span>
		</div>
		<div class="fileDetail">
			<button type="button" class="btn btn-primary" id="saveadd">保存</button>
		</div>
		
	</div>
	
	<!--在模态框中上传新的背景 -->
	<div class="modal fade" id="addModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						<span class="modalHeadTitle">上传新的图片</span>
					</h4>
				</div>
				<div class="modal-body">
					<div id="clipAreaBg"></div>
					<input type="file" id="Bgfile">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="saveUpdateBg"
						data-dismiss="modal">保存</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="${basePath }static/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="${basePath }static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${basePath }static/layer/layer.js"></script>
<script type="text/javascript" src="${basePath }static/photoClip/js/iscroll-zoom.js"></script> <!--实现图片的移动-->
<script type="text/javascript" src="${basePath }static/photoClip/js/hammer.js"></script>
<script type="text/javascript" src="${basePath }static/photoClip/js/lrz.all.bundle.js"></script>
<script type="text/javascript" src="${basePath }static/photoClip/js/jquery.photoClip.js"></script> <!--实现图片的剪裁-->
<script type="text/javascript">
	$(function() {
		
		$(".delet").click(function(){
			var id = $(this).attr("at-id");
			$.ajax({
				dataType : "json",
				type : "post",
				data :{
					id:id
				},
				url : "${basePath}rest/album/toDeleteAlbumImg",
				success : function(data) {
					parent.layer.msg(data.msg);
					var id = $(".albumid").val();
					location.href = "${basePath}rest/album/showPhotoDetil?id="+id;
				}
			});
		});
		
		$("#saveadd").click(function(){
			//拼接上传的图片的图片名字和title封装在一起
			var info = "[";
			$(".img2").each(function(){
				var src = $(this).attr("src");
				var index = src.lastIndexOf("\/");
				var photoname = src.substring(index + 1, src.length);
				info +="{'filename':"+photoname + ","+"'realname':"+$(this).next("input").val()+"},";
			});
			info += "]";
			//拼接数据库中已经有的图片修改的id和name
			var i = 0;
			var info2 = "[";
			$(".titlename").each(function(){
				if($(this).val()==""){
					i++;
				}
				info2+="{'id':"+ $(this).attr("at-id")+","+"'realname':"+$(this).val()+"},";
			});
			
			info2+="]";
			$(".titlenew").each(function(){
				if($(this).val()==""){
					i++;
				}
			});
			var name = $(".name").val();
			if(name==""){
				parent.layer.msg("请输入相册标题！");
			}else if(i!=0){
				parent.layer.msg("请输入图片名称！");
			}else{
				$.ajax({
					dataType : "json",
					type : "post",
					data :{
						info : info,
						info2:info2,
						name : name, 
						albumid:$(".albumid").val()
					},
					url : "${basePath}rest/album/toAddAlbumImg",
					success : function(data) {
						parent.layer.msg(data.msg);
						var id = $(".albumid").val();
						location.href = "${basePath}rest/album/showPhotoDetil?id="+id;
					}
				});
			}
			
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
					url:'${basePath}rest/album/addphoto',
					success:function(data){
						if(data.msg=='success'){
							var imgname=data.imgName;
							parent.layer.msg("上传成功");
							var html ="";
							html = "<div class='fileDetail'>"+
							"<img src='${basePath }static/web/img/photo/"+imgname+"' alt='' class='img-rounded img img2'> "+
							"<input type='text'  class='title titlenew' value=''/>"+
							"<span class='delete'>x</span></div>";
							
							$(".content").prepend(html);
							
							$(".delete").click(function(){
								$(this).parent().remove();
							});
							
							//location.href = "${basePath}rest/page/showPhoto";
							
						}else{
							parent.layer.msg("上传失败");
						}
					}
				})
			}
		});
		
	});
	
	
	  
</script>
</html>
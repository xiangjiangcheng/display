<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<title>修改先进展示</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${basePath }static/web/css/base.css">
<link rel="stylesheet" href="${basePath }static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${basePath }static/bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${basePath }static/web/css/display/custom.css" />
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
	left:23%;
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
				修改先进展示
			</div>
			<div class="panel-body">
				<form class="form-horizontal" role="form" id="addform">
					<input id="img" name="img" type="hidden">
					<input id="id" name="id" type="hidden" value="${advancedShow.id}">
					<input id="flag" name="flag" type="hidden" value="2">
				    <div class="form-group">
				     	<label for="username" class="col-sm-2 control-label" style="padding-top: 0px;">成员名称：</label>
				    	<div class="col-sm-10">
				    	 	<textarea class="form-control" rows="2" name="name" id="name" placeholder="请输入成员名称..."></textarea>
				    	</div>
				  	</div>
				  	<div class="form-group">
				     	<label for="username" class="col-sm-2 control-label" style="padding-top: 0px;">展示内容：</label>
				    	<div class="col-sm-10">
				      		<textarea class="form-control" rows="6" name="content" id="content" placeholder="请输入展示内容..."></textarea>
				    	</div>
				  	</div>
				  	<div class="form-group">
				     	<label for="username" class="col-sm-2 control-label" style="padding-top: 0px;">上传头像：</label>
				    	<div class="col-sm-10">
				    		<div id="showUploadImgDiv">
				    			<img alt="" src="${basePath}static/web/img/smallInnovate/${advancedShow.img}" style="width: 200px;height: 300px;" id="showIconimg">
				    		</div>
				      		
				      		<button type="button" class="btn btn-primary" id="uploadBg" >点击上传</button>
				    	</div>
				  	</div>
				  	<div class="form-group">
					    <div class="col-sm-offset-10 col-sm-2">
					      	<button type="button" class="btn btn-theme" id="submitBtn">提交</button>
							<button type="reset" class="btn btn-theme-cancel" id="backBtn">返回</button>
					    </div>
					 </div>
				</form>
				
			</div>
		</div>
	</div>
	
	<!--在模态框中上传新的头像 -->
	<div class="modal fade" id="updateBgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-flag="0">
	   <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	        <h4 class="modal-title" id="myModalLabel"><span class="modalHeadTitle">上传新的头像</span><span class="modalTitleRemark">注：请上传330*330的矢量图</span></h4>
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
	
	<script type="text/javascript" src="${basePath }static/bootstrap/js/jquery.min.js"></script>
	<script type="text/javascript" src="${basePath }static/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${basePath }static/layer/layer.js"></script>
	<script type="text/javascript" src="${basePath }static/photoClip/js/iscroll-zoom.js"></script> <!--实现图片的移动-->
	<script type="text/javascript" src="${basePath }static/photoClip/js/hammer.js"></script>
	<script type="text/javascript" src="${basePath }static/photoClip/js/lrz.all.bundle.js"></script>
	<script type="text/javascript" src="${basePath }static/photoClip/js/jquery.photoClip.js"></script> <!--实现图片的剪裁-->
	<script type="text/javascript">
		$(function() {
			// 给textarea 赋值，textarea标签没有value属性
			$("#name").val('${advancedShow.name }');
			$("#content").val('${advancedShow.content }');
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
					var url = '${basePath}rest/moduleform/uploadFile';
					$.ajax({
						data:{base64:dataURL,Bgfile:$("#Bgfile").val()},
						type:'post',
						dataType:'json',
						url:url,
						success:function(data){
							var html = "";
							if(data.msg=='success'){
								var imgName=data.imgName;
								parent.parent.layer.msg("上传成功");
								// append图片
								html += "<img src='${basePath}static/web/img/smallInnovate/"+imgName+"' style='width: 200px;height: 300px;margin-bottom: 20px;margin-right: 20px;'>"
								// 清空并追加
								$("#showUploadImgDiv").empty().append(html);
								$("#img").val(imgName);
							}else{
								parent.parent.layer.msg("上传失败！");
							}
						}
					})
				}
			});
			
		});
		// 点击按钮弹出选择图片的的模态框
		$("#uploadBg").click(function(){
			// 设置data-flag = 1
			$("#updateBgModal").modal("show");
		});
		
		$("#backBtn").click(function(){
			location.href = "${basePath}rest/moduleform/toAdvancedShow";
		});
		// 点击提交按钮触发事件
		$("#submitBtn").click(
			function() {
				//获取对应数据
				//先序列化不含有file文件的表单
				var formData = $("#addform").serialize();
				$.ajax({
					dataType : "json",
					type : "post",
					data : formData,
					url : "${basePath}rest/moduleform/addAndUpdateAdvancedShow",
					success : function(data) {
						// 解析数据，填充数据
						if (data.status) {
							parent.parent.layer.msg("操作成功！");
							/* history.back(-1); */
							location.href= "${basePath}rest/moduleform/toAdvancedShow";
						}else{
							parent.parent.layer.msg("操作失败！");
						}
					}
				});
				
			});
	</script>
</body>
</html>
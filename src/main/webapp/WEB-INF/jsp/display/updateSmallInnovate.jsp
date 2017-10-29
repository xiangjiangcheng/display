<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<title>微创新</title>
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
				微创新信息管理
				
			</div>
			<div class="panel-body">
				<form class="form-horizontal" role="form" id="addform">
					<input id="smallid" name="id" type="hidden">
					<input id="groupid" name="groupid" type="hidden">
					<input id="pictureids" name="pictureids" type="hidden">
				    <div class="form-group">
				     	<label for="username" class="col-sm-2 control-label" style="padding-top: 0px;">成果名称：</label>
				    	<div class="col-sm-10">
				    	 	<textarea class="form-control" rows="2" name="achievementname" id="achievementname" placeholder="请输入成果名称..."></textarea>
				    	</div>
				  	</div>
				  	 <div class="form-group">
				     	<label for="username" class="col-sm-2 control-label" style="padding-top: 0px;">主要完成人：</label>
				    	<div class="col-sm-10">
				      		<textarea class="form-control" rows="2" name="mainpersons" id="mainpersons" placeholder="请输入主要完成人..."></textarea>
				    	</div>
				  	</div>
				  	 <div class="form-group">
				     	<label for="username" class="col-sm-2 control-label" style="padding-top: 0px;">成果摘要：</label>
				    	<div class="col-sm-10">
				      		<textarea class="form-control" rows="12" name="achievementsummary" id="achievementsummary" placeholder="请输入成果摘要..."></textarea>
				    	</div>
				  	</div>
				  	<!-- <div class="form-group">
				     	<label for="username" class="col-sm-2 control-label" style="padding-top: 0px;">应用情况及利益：</label>
				    	<div class="col-sm-10">
				      		<textarea class="form-control" rows="6" name="achievementsummary" id="achievementsummary" placeholder="请输入应用情况及利益..."></textarea>
				    	</div>
				  	</div>
				  	<div class="form-group">
				     	<label for="username" class="col-sm-2 control-label" style="padding-top: 0px;">成果推广费用：</label>
				    	<div class="col-sm-10">
				      		<textarea class="form-control" rows="3" name="achievementcost" id="achievementcost" placeholder="请输入成果推广费用...例：xxx模块费用大约为10万元"></textarea>
				    	</div>
				  	</div> -->
				  	<div class="form-group">
				     	<label for="username" class="col-sm-2 control-label" style="padding-top: 0px;">示例图片：</label>
				    	<div class="col-sm-10">
				    		<div id="showUploadImgDiv" class="rows"></div>
				      		<button type="button" class="btn btn-primary" id="uploadBg" >上传图片</button><span sytle="color:red;">*每次上传一张，可以上传多张</span>
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
	
	<script type="text/javascript" src="${basePath }static/bootstrap/js/jquery.min.js"></script>
	<script type="text/javascript" src="${basePath }static/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${basePath }static/layer/layer.js"></script>
	<script type="text/javascript" src="${basePath }static/photoClip/js/iscroll-zoom.js"></script> <!--实现图片的移动-->
	<script type="text/javascript" src="${basePath }static/photoClip/js/hammer.js"></script>
	<script type="text/javascript" src="${basePath }static/photoClip/js/lrz.all.bundle.js"></script>
	<script type="text/javascript" src="${basePath }static/photoClip/js/jquery.photoClip.js"></script> <!--实现图片的剪裁-->
	<script type="text/javascript">
		$(function() {
			// 加载本页面时填充本页面的数据
			$.ajax({
				dataType : "json",
				type : "post",
				data : {
					id: "${smallid}",
				},
				url : "${basePath}rest/moduleform/getSmallInnovateByGid",
				success : function(data) {
					// 解析数据，填充数据
					var sInnovate = data.sInnovate;
					var html = "";
					if (data.status) {
						$("#smallid").val(sInnovate.id);
						$("#groupid").val(sInnovate.groupid);
						$("#achievementname").val(sInnovate.achievementname);
						$("#mainpersons").val(sInnovate.mainpersons);
						/* $("#achievementdetails").val(sInnovate.achievementdetails); */
						$("#achievementsummary").val(sInnovate.achievementsummary);
						 /*$("#achievementcost").val(sInnovate.achievementcost); */
						$("#pictureids").val(sInnovate.pictureids);
						// append图片
						var pictureids = sInnovate.pictureids;
						// 分割字符串
						var array = pictureids.split(",");
						for (i=0; i<array.length; i++) {
							
							html += "<div class='col-sm-4' style='text-align:center'><img src='${basePath}static/web/img/smallInnovate/"+array[i]+"' style='width: 200px;height: 300px;margin-bottom: 20px;margin-right: 20px;'> <button type='button' class='btn btn-success delete' data-name='"+array[i]+"'>删除</button></div>"
						}
						// 追加
						$("#showUploadImgDiv").append(html);
						// 给删除button添加事件
						$(".delete").click(function(){
							// 获取该图片的名称
							var imgname = $(this).attr("data-name");
							// 移除该张图片
							$(this).parent().remove();
						});
						
					}
				}
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
								parent.layer.msg("上传成功");
								// append图片
								html += "<div class='col-sm-4'><img src='${basePath}static/web/img/smallInnovate/"+imgName+"' style='width: 200px;height: 300px;margin-bottom: 20px;margin-right: 20px;'><button type='button' class='delete' data-name='"+imgName+"'>删除</button></div>"
								// 追加
								$("#showUploadImgDiv").append(html);
								// 给删除button添加事件
								$(".delete").click(function(){
									// 获取该图片的名称
									var imgname = $(this).attr("data-name");
									// 移除该张图片
									$(this).parent().remove();
								});
								
								/* 
								var pictureids = $("#pictureids").val();
								
								if (pictureids == "") {
									pictureids = imgName;
								}else {
									pictureids = pictureids+','+imgName;
								}
								// 重新设值
								// alert(pictureids);
								$("#pictureids").val(pictureids); */
							}else{
								parent.layer.msg("上传失败！");
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
			location.href = "${basePath}rest/page/smallInnovate";
		});
		// 点击提交按钮触发事件
		$("#submitBtn").click(
			function() {
				//获取对应数据
				//先序列化不含有file文件的表单
				// 遍历删除按钮 
				var pictureids = "";
				$(".delete").each(function(){
					var picturename = $(this).attr("data-name");
					if (pictureids == "") {
						pictureids = picturename;
					} else {
						pictureids = pictureids + ',' + picturename;
					}
				});
				$("#pictureids").val(pictureids);
				//alert(picture);exit;
				var formData = $("#addform").serialize();
				$.ajax({
					dataType : "json",
					type : "post",
					data : formData,
					url : "${basePath}rest/moduleform/addAndUpdateSmallInnovate",
					success : function(data) {
						// 解析数据，填充数据
						var sInnovate = data.sInnovate;
						if (data.status) {
							parent.layer.msg("操作成功！");
							/* $("#achievementname").val(sInnovate.achievementname);
							$("#mainpersons").val(sInnovate.mainpersons);
							$("#achievementdetails").val(sInnovate.achievementdetails);
							$("#achievementsummary").val(sInnovate.achievementsummary);
							$("#achievementcost").val(sInnovate.achievementcost); */
							history.back(-1);
						}else{
							parent.layer.msg("操作失败！");
						}
					}
				});
				
			});
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>模块详情页面</title>
<link rel="stylesheet" href="${basePath }static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${basePath }static/bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${basePath }static/web/css/base.css">
<style type="text/css">

.showMenu{
	position:relative;
}
.showBackground{
	position:absolute;
	left:25%;
}
#showBackground{
	height:330px;
}
.showIcon{
	position:absolute;
	top:20%;
	left:28%;
}
.showTitle{
	position: absolute;
    text-align: center;
    color: #fff;
    margin-top: 15%;
    width: 150px;
    font-size: xx-large;
}
.updateForm{
	margin-top:400px;
}
#clipAreaBg{width:100%;height:340px;}
.modalHeadTitle{font-weight: 700;font-size: 18px;}
.modalTitleRemark{font-size: 12px;color: red;margin-left: 10px;}
.selectBg{width:55%;}
.selectIcon{width:55%;}
.btn-info{margin-right: 10%;}
#uploadIcon,#saveModify{margin:0px 10%;}
#clipAreaIcon{height:160px;}

</style>
</head>
<body>
 	<div class="col-md-6 col-md-offset-3" style="margin-top:50px;">
 
		<div class="showMenu">
			<div class="showBackground">
				<img alt="" id="showBackground" src="${basePath}static/web/img/menubg/${menu.backgroundname}">
				<div class="showIcon">
					<img alt="" id="showIcon" src="${basePath}/static/web/img/menuicon/${menu.iconname}">
					<div class="showTitle">${menu.title }</div>
				</div>
			</div>
		</div>
	</div> 
		
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3" style="margin-top:50px;">
			<form class="updateForm form-horizontal" role="form" >
				<input type="hidden" name="id" value="${menu.id}">
				<div class="form-group">
					<label class="col-md-3 leftLabel">标题:</label>
					<div class="col-md-8">
						<input id="title" class="form-control" name="title" value="${menu.title }">
					</div>
				</div>
				 <div class="form-group">
					<label class="col-md-3 leftLabel">操作:</label>
				 	<div class="col-md-8">
						<!-- <button type="button" class="btn btn-info" id="chooseIcon">选择图标</button> -->
						<button type="button" class="btn btn-primary" id="uploadIcon">上传图标</button>
						<button type="button" class="btn btn-primary" id="uploadBg">上传背景</button>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 leftLabel">当前顺位:</label>
				 	<div class="col-md-8">
						<!-- <button type="button" class="btn btn-info" id="chooseIcon">选择图标</button> -->
						<input type="text" class="form-control" name="orderby" value="${menu.orderby}">
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 leftLabel">背景比例：</label>
					<div class="col-md-8">
						<select class="form-control" name="size" id="selectSize">
							<c:if test="${menu.size==1}">
								<option value="1" selected="selected">1:1</option>
								<option value="2">2:1</option>
							</c:if>
							<c:if test="${menu.size==2}">
								<option value="1" >1:1</option>
								<option value="2" selected="selected">2:1</option>
							</c:if>
							
						</select>
					</div>
				</div>
<!-- 				<div class="form-group">
					<label class="col-md-3 leftLabel">模板类型：</label>
					<div class="col-md-8">
						<select class="form-control" name="size" id="selectModel">
							<option value="0">菜单导航</option>
							<option value="1">文本编辑</option>
							<option value="2">PPT展示</option>
							<option value="3">内网链接</option>
						</select>
					</div>
				</div> -->
				
				 <div class="form-group">
					<label class="col-md-3 leftLabel"></label>
				 	<div class="col-md-8">
						<!-- <button type="button" class="btn btn-info" id="chooseBg">选择背景</button> -->
						
					</div>
				 </div> 
				
				<br><br><br>
				<!-- end form-group -->
			 	<div class="form-group" id="updateForm">
					<label class="col-md-3"></label>
					<div>
						<button class="btn btn-theme" type="button" id="saveModify">保存</button>
						<button class="btn btn-theme-cancel" type="button" id="cancel" onclick="history.back();">返回</button>
					</div>
				</div> 
				
				<!-- 在模态框中显示全部背景 -->
				<%-- <div class="modal fade bs-example-modal-lg" id="bgModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-lg">
				    <div class="modal-content ">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				        <h2 class="modal-title" id="myModalLabel"><span class="modalHeadTitle">选择背景</span></h2>
				      </div>
				      <div class="modal-body col-md-12">
				        <c:forEach var="bg" items="${backgrounds}">
				        	<div class="col-md-2" style="height: 130px; margin-bottom: 5px;">
				        	<div class="BgUl">
				        	<img class="selectBg" src="${basePath}static/web/img/menubg/${bg.bgname}" data-id="${bg.id }" data-name="${bg.bgname}">
				        	</div>
				        	</div>
				        </c:forEach>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				      </div>
				    </div>
				  </div>
				</div> --%>
				
				<!--在模态框中上传新的背景 -->
				<div class="modal fade" id="updateBgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
				        <button type="button" class="btn btn-primary" id="saveUpdateBg"  data-dismiss="modal">保存</button>
				      </div>
				    </div>
				  </div>
				</div>
				
				<!-- end form-group -->
				<%-- <div class="modal fade bs-example-modal-lg" id="iconModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-lg">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				        <h4 class="modal-title" id="myModalLabel"><span class="modalHeadTitle">选择图标</span></h4>
				      </div>
				      <div class="modal-body col-md-12" style="background: #ddd;">
				        <c:forEach var="icon" items="${icons}">
				        	<div class="col-md-2" style="height: 130px;">
				        	<div>
				        		<img class="selectIcon" src="${basePath}static/web/img/menuicon/${icon.iconname}" data-id="${icon.id}" data-name="${icon.iconname}">
				        	</div>
				        	</div>
				        </c:forEach>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				        
				      </div>
				    </div>
				  </div>
				</div> --%>
				
				<!--在模态框中上传新的背图标 -->
				<div class="modal fade" id="updateIcon" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  					<div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				        <h4 class="modal-title" id="myModalLabel"><span class="modalHeadTitle">上传新的菜单背景</span><span class="modalTitleRemark">注：请上传330*330的矢量图</span></h4>
				      </div>
					  <div class="modal-body">
							<div id="clipAreaIcon"></div>
							<input type="file" id="Iconfile">
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				        <button type="button" class="btn btn-primary" id="saveUpdateIcon"  data-dismiss="modal">保存</button>
				      </div>
				    </div>
				  </div>
				</div>
				
				<div id="hiddenBg"></div>
				<div id="hiddenIcon"></div>
			</form> 
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
	$(function(){
		// 页面初始化，初始化图片大小
		initSize();
		
		//点击保存按钮
		$("#saveModify").click(function(){
			var data=$("form").serialize()
			$.ajax({
				data:data,
				type:'post',
				dataType:'json',
				url:'${basePath}rest/menu/updateMenu',
				success:function(data){
					var msg=data.msg;
					if(msg="success"){
						parent.layer.msg("保存成功~！");
						location.reload();
					}else{
						parent.layer.msg("保存失败~！");
					}
				},error:function(){
					parent.layer.msg("保存失败，请联系管理员~！")
				}
			})
		});
		
		$("#selectSize").change(function(){
			initSize();
		})
		
		//文字实时更新
		$('#title').bind('input propertychange', function() {
			var title=$(this).val();
			$(".showTitle").text(title);
		});
		
		//点击上传背景的按钮
		$("#uploadBg").click(function(){
			$("#updateBgModal").modal("show");
		});
		//上传背景的剪切插件
		var clipArea = new bjj.PhotoClip("#clipAreaBg", {
			size: [330, 330],
			outputSize: [330, 330],
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
					url:'${basePath}rest/menu/addSmallBg',
					success:function(data){
						if(data.msg=='success'){
							var imgname=data.imgName;
							parent.layer.msg("修改背景成功");
							$("#showBackground").attr("src","${basePath}static/web/img/menubg/"+imgname);
							$("#hiddenBg").empty().append('<input type="hidden" name="backgroundid" value="'+imgname+'">');
						}else{
							parent.layer.msg("修改背景失败！");
						}
					}
				})
			}
		});
		
		//点击上传图标的按钮
		$("#uploadIcon").click(function(){
			$("#updateIcon").modal("show");
		});
		//上传图标的剪切插件
		var clipArea = new bjj.PhotoClip("#clipAreaIcon", {
			size: [150, 150],
			outputSize: [150, 150],
			file: "#Iconfile",
			ok: "#saveUpdateIcon",
			loadStart: function() {
				console.log("照片读取中");
			},
			loadComplete: function() {
				console.log("照片读取完成");
			},
			clipFinish: function(dataURL) {
				$.ajax({
					data:{base64:dataURL,Iconfile:$("#Iconfile").val()},
					type:'post',
					dataType:'json',
					url:'${basePath}rest/menu/addIcon',
					success:function(data){
						if(data.msg=='success'){
							var imgName=data.imgName
							parent.layer.msg("修改图标成功");
							$("#showIcon").attr("src","${basePath}static/web/img/menuicon/"+imgName);
							$("#hiddenIcon").empty().append('<input type="hidden" name="iconid" value="'+imgName+'">');
						}else{
							parent.layer.msg("修改图标失败！");
						}
					}
				})
			}
		});
		
		
		//打开显示全部图标的modal
		/* $("#chooseIcon").click(function(){
			$("#iconModal").modal("show");
		}); */
		
		//打开显示全部背景的modal
		/* $("#chooseBg").click(function(){
			$("#bgModal").modal("show");
		}); */
		
		//选择图标后
	/* 	$(".selectIcon").click(function(){
			// 得到图标的id
			var id = $(this).attr("data-id");
			var name = $(this).attr("data-name");
			// 替换预览的图片
			$("#showIcon").attr("src","${basePath}static/web/img/menuicon/"+name);
			//隐藏模态框
			$("#iconModal").modal("hide");
			$("#hiddenIcon").empty().append('<input type="hidden" name="iconid" value="'+id+'">');
		});
		
		//选择背景后
		$(".selectBg").click(function () {
			// 得到图标的id
			var id = $(this).attr("data-id");
			var name = $(this).attr("data-name");
			// 替换预览的图片
			$("#showBackground").attr("src","${basePath}static/web/img/menubg/"+name);
			//隐藏模态框
			$("#bgModal").modal("hide");
			$("#hiddenBg").empty().append('<input type="hidden" name="backgroundid" value="'+id+'">');
		}); */
		
	})
	
	function initSize(){
		var size=$("#selectSize").val();
		if(size==1){
			$(".showBackground").css("left","25%");
			$("#showBackground").css("width","330px");
			$(".showIcon").css("left","28%");
		}else if(size==2){
			$(".showBackground").css("left","0");
			$("#showBackground").css("width","700px");
			$(".showIcon").css("left","38%");
		}
	}

</script>


</html>
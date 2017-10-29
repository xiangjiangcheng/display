<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${basePath }static/web/css/base.css">
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
	height:100%;
	color: #fff;
	font-size: 2vw;
	position: absolute;
	top:0;
	left:0;
	text-align: center;
	line-height:350px;
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
.delet{
	border:2px solid #fff;
	border-radius:50%;
	padding:1px 7px; 
	position:absolute;
	top:2px;
	right:5px;
	color:#fff;
	font-weight:bold;
}
</style>
</head>
<body>
	<div>
		<c:forEach var="list" items="${list}" varStatus="status">
			<div class="fileDetail">
				<c:if test="${not empty list[0]}">
				   <img src="${basePath }static/web/img/photo/${list[0].filename}"
					alt="" class="img-rounded img"> 
					<span at-id="${list[1].id}" class="title">${list[1].name}</span>
					<span at-id="${list[1].id}" class="delet">x</span>
				</c:if>
				<c:if test="${empty list[0]}">
				   <img src="${basePath }static/web/img/photo/shezhi_bg.png"
					alt="" class="img-rounded img"> 
					<span at-id="${list[1].id}" class="title">${list[1].name}</span>
					<span at-id="${list[1].id}" class="delet">x</span>
					
				</c:if>
			</div>
		</c:forEach>
		 <input type="hidden" class="groupid" value="${groupid}"/> 
		<div class="fileDetail">
			<div class="addimg"></div>
			<span data-toggle="modal" data-target="#addModal" class="add">+</span>
		</div>
	</div>
	<!--模态框中选择背景 -->
	<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">添加相册</h4>
	      </div>
	      <div class="modal-body col-md-12">
	        	<span>相册标题：</span>
	        	<input type="text" class="form-control"
					id="addtitle" placeholder="请输入相册标题">
	        	
	      </div>
	      <div class="modal-footer">
	        <button id="add" type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
	      </div>
	    </div>
	  </div>
	</div>
</body>
<script type="text/javascript"
	src="${basePath }static/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${basePath }static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${basePath }static/layer/layer.js"></script>
<script type="text/javascript">
	$(function() {
		$("#add").click(function(){
			var title = $("#addtitle").val();
			var groupid = $(".groupid").val();
			var info = {
					title:title,
					groupid:groupid
			}
			//alert(groupid);
			if(title==""){
				parent.layer.msg("请输入完整的信息！");
			}else{
				$.ajax({
					dataType : "json",
					type : "post",
					data :info,
					url : "${basePath}rest/album/toAddAlbum",
					success : function(data) {
						parent.layer.msg(data.msg);
						location.href = "${basePath}rest/page/showPhoto";
					}
				});
			}
			
		});
		$(".title").click(function(){
			var id = $(this).attr("at-id");
			location.href = "${basePath}rest/album/showPhotoDetil?id="+id;
		});
		
		$(".delet").click(function(){
			var id = $(this).attr("at-id");
			$.ajax({
				dataType : "json",
				type : "post",
				data :{
					id:id
				},
				url : "${basePath}rest/album/toDeleteAlbum",
				success : function(data) {
					parent.layer.msg(data.msg);
					location.href = "${basePath}rest/page/showPhoto";
				}
			});
		});
	});
</script>
</html>
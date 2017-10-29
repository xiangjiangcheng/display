<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<title>添加班组信息</title>
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
				新建班组信息
			</div>
			<div class="panel-body">
				<form class="form-horizontal" role="form" id="addform">
				  <div class="form-group">
				    <label for="username" class="col-sm-2 control-label">班组名称：</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="groupname" placeholder="请输入班组名称" name="groupname">
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      	<button type="button" class="btn btn-theme" id="submitBtn">提交</button>
						<button type="reset" class="btn btn-theme-cancel" onclick="history.back();">返回</button>
				    </div>
				  </div>
				</form>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="${basePath }static/bootstrap/js/jquery.min.js"></script>
	<script type="text/javascript" src="${basePath }static/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${basePath }static/layer/layer.js"></script>
	<script type="text/javascript">
		$(function() {
			
			
		});
		// 点击提交按钮触发事件
		$("#submitBtn").click(
			function() {
				//获取对应数据
				//先序列化不含有file文件的表单
				var formData = $("#addform").serialize();
				if ($("#groupname").val()!="") { 
					// 正确的情况
					$.ajax({
						dataType : "json",
						type : "post",
						data : formData,
						url : "${basePath}rest/group/addGroup",
						success : function(data) {
							// 解析数据
							if (data.status) {
								parent.layer.msg("班组添加成功！");
								history.back(-1);
							}else{
								parent.layer.msg("班组添加失败！");
							}
						}
					});
				} else {
					// 不正确的情况
					parent.layer.msg("groupname为必填项");
				}
				
			});
	</script>
</body>
</html>
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
				微创新显示模板配置
			</div>
			<div class="panel-body">
				<form class="form-horizontal" role="form" id="addform">
					<input id="smallid" name="id" type="hidden">
					<input id="groupid" name="groupid" type="hidden">
					<input id="pictureids" name="pictureids" type="hidden">
				    <div class="form-group">
				     	<label for="username" class="col-sm-2 control-label" style="padding-top: 0px;">选择模板：</label>
				    	<div class="col-sm-8">
				    	 	<select name="module" class="selector" style="width:100px;"> 
				    	 		<option value="1">模板1</option>
				    	 		<option value="2">模板2</option>
				    	 		<!-- <option value="3">模板3</option> -->
				    	 	</select>
				    	</div>
				    	<div class="col-sm-2">
				    	 	<button type="button" class="btn btn-theme" id="submitBtn">提交</button>
							<button type="reset" class="btn btn-theme-cancel" id="backBtn">返回</button>
				    	</div>
				  	</div>
				</form>
				<hr>
			  	  这里根据选择的模板加载不同的页面
			  	 <div id="module_div">
			  	 	<div id="module1_div" style="display: block" class="modulediv"><jsp:include page="./smallInnovate/smallInnovateModule1.jsp"></jsp:include></div>
				 	<div id="module2_div" style="display: none" class="modulediv"><jsp:include page="./smallInnovate/smallInnovateModule2.jsp"></jsp:include></div>
				 	<%-- <div id="module3_div" style="display: none" class="modulediv"><jsp:include page="smallInnovateModule3.jsp"></jsp:include></div> --%>
				 </div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="${basePath }static/bootstrap/js/jquery.min.js"></script>
	<script type="text/javascript" src="${basePath }static/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${basePath }static/layer/layer.js"></script>
	<script type="text/javascript">
		$(function() {
			
			$.ajax({
				dataType : "json",
				type : "post",
				data : {},
				url : "${basePath}rest/moduleform/getSModuleByGid",
				success : function(data) {
					// 得到该班组当前的显示模板
					if (data.status) {
						var smallInnovateModule = data.smallInnovateModule;
						$(".selector").val(smallInnovateModule.module);
					}else{
						// 默认为1
						//$(".selector").find("option[text='模板3']").attr("selected",true);
						$(".selector").val(1);
					}
				}
			});
			
			$(".selector").change(function(){
				// 获取下拉框值
				var i = $(this).val();
				// alert("#module"+i+"_div");
				$(".modulediv").each(function () {
					// 隐藏全部
					$(this).hide();
				});
				// 显示对应的页面
				$("#module"+i+"_div").show();
				//$("#module"+i+"_div").css("display", "block");
			});
		});
		$("#backBtn").click(function(){
			location.href = "${basePath}rest/page/smallInnovate";
		});
		// 点击提交按钮触发事件
		$("#submitBtn").click(
			function() {
				//获取对应数据
				//先序列化不含有file文件的表单
				// var formData = $("#addform").serialize();
				$.ajax({
					dataType : "json",
					type : "post",
					data : {
						module:$(".selector").val(),
					},
					url : "${basePath}rest/moduleform/ConfigSmallInnovate",
					success : function(data) {
						// 解析数据，填充数据
						var sInnovate = data.sInnovate;
						if (data.status) {
							parent.layer.msg("操作成功！");
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
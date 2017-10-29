<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%-- <%@ page import="org.apache.commons.lang.StringUtils" %> --%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<%
/*	
	更新记录：
		2013-01-25 取消对SmartUpload的使用，改用commons-fileupload组件。因为测试发现SmartUpload有内存泄露的问题。
*/
//String path = request.getContextPath();
//String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String clientCookie = request.getHeader("Cookie");
%>
<!doctype html>
<html>
<head>
<title>添加用户</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${basePath }static/web/css/base.css">
<link rel="stylesheet"
	href="${basePath }static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${basePath }static/bootstrap/css/bootstrap-theme.min.css">
<link href="${basePath }static/web/css/display/custom.css"
	rel="stylesheet" />
	
<script type="text/javascript" src="${basePath }ueditor/ueditor.config.js"></script>
	<script type="text/javascript" src="${basePath }ueditor/ueditor.all.js" ></script>
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
<body style="overflow:scroll;overflow-x:hidden">
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading">
				<button class="icon" disabled="disabled">
					<span class="glyphicon glyphicon-th-large"></span>
				</button>
				${title }详情及修改
			</div>
			<div class="panel-body">
				<form class="form-horizontal" role="form" id="addform">
					<input type="hidden" id="id" value="${modelRich.id }" name="id">
					<input type="hidden" id="menuid" value="${menuid}" name="menuid">
					<input type="hidden" id="groupid" value="${groupid}" name="groupid">
					
				<div class="form-group">
				    <label for="title" class="col-sm-2 control-label" style="padding-top: 4px;margin-bottom: 0;text-align: right;font-size: 16px;">${title }标题名</label>
				    <div class="col-sm-6">
				      <input type="text" class="form-control" id="title" style="margin-top: 2px;display: block;width: 100%;height: 34px;line-height: 34px;" placeholder="请输入标题" name="title" value="${modelRich.title }">
				    </div>
				    <label for="deadline" class="col-sm-2 control-label" style="padding-top: 4px;margin-bottom: 0;text-align: right;font-size: 16px;">公示期限</label>
				    <div class="col-sm-2">
				     <!--  <input type="text" class="form-control" id="deadline" style="margin-top: 2px;display: block;width: 100%;height: 34px;line-height: 34px;"
				       placeholder="请输入期限(天数)" name="deadline"  value=""> -->
				       <select type="text" class="form-control" id="deadline" style="margin-top: 2px;display: block;width: 100%;height: 34px;line-height: 34px;" name="deadline">
				       <option value="0">永久</option>
				       <option value="1">七天</option>
				       <option value="2">一个月</option>
				       </select>
				    </div>
				  </div>
				  <div class="form-group">
				    <!--  <textarea name="后台取值的key" id="myEditor">这里写你的初始化内容</textarea> -->
				   <script id="editor" type="text/plain" style="width:100%;height:600px;" name="content"></script>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      	<button type="button" class="btn btn-theme" id="submitBtn">修改</button>
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
		$("#editor").val('${modelRich.content}');
		var date =${modelRich.deadline};
		obj = document.getElementById("deadline");
		for(i=0;i<obj.length;i++){
		  if(obj[i].value == date)
		    obj[i].selected = true;
		}
	//实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');
		});
		
		// 点击提交按钮触发事件
	    $("#submitBtn").click(
			function() {
				//获取对应数据
				//先序列化不含有file文件的表单
				var formData = $("#addform").serialize();
				//序列化含有file文件的表单
				//var formData = new FormData($("#addform")[0]);
				var title = $("#title").val();
				var content = $("#editor").val();
				var deadline=$("#deadline").val();
				/* if($("#deadline").val()=='永久'){
					deadline=0;
				}else{
					deadline=$("#deadline").val();
				}  */
				var menuid=$("#menuid").val();
				var groupid=$("#groupid").val();
					$.ajax({
						dataType : "json",
						type : "post",
						data : formData,
						url : "${basePath}rest/rich/updateRich",
						success : function(data) {
							// 解析数据
							if (data.status == true) {
								parent.parent.layer.msg("修改成功！");
								location.href = "${basePath}rest/page/ruleManange?menuid="+menuid+"&groupid="+groupid;
							}
						},
						error:function(){
							parent.parent.layer.msg("修改失败！");
						}
					});
			});
	</script>
</body>
</html>
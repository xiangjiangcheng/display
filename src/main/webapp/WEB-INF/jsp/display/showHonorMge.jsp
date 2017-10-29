<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>

<html>
<head>
<title>评议评先</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="${basePath }static/bootstrap/css/bootstrap.min.css">
<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet"
	href="${basePath }static/bootstrap/css/bootstrap-theme.min.css">
<script type="text/javascript"
	src="./static/plupload-2.2.1/js/plupload.full.min.js"></script>
 	<style>
.showMyIFrame{
	border:0;
	width:100%;
	height:100%;
}
.frame{
height:600px;
}
	</style> 
<body style="overflow:scroll;overflow-x:hidden">
	<input type="hidden" id="menuid"  value="${menuid}" name="menuid">
	<div class=" row container-fluid" id="main_div" >
		<div class="col-md-12 contain-header">
			<ul class="nav nav-tabs titleNav" id="headerUl">

			</ul>
			<div class="frame" >
			<iframe class="showMyIFrame" src=""  >
			
			
			</iframe>
			</div>
		</div>
	</div>
</body>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script type="text/javascript"
	src="${basePath }static/bootstrap/js/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script type="text/javascript"
	src="${basePath }static/bootstrap/js/bootstrap.min.js"></script>
<%-- <!-- 自己的js -->
<script type="text/javascript" src="${basePath }static/js/myuntil.js"></script> --%>
<script type="text/javascript">
	$(function(){
		var menuid=$("#menuid").val();
		 $.ajax({
				dataType : "json",
				type : "post",
				aysnc:false,
				data : {
					pid :menuid,
				},
				url : "${basePath}rest/menu/getMenuByPid",
				success : function(data) {
					var menuConfigList = data.menuConfigList;
					var html = "";
					for (i = 0; i < menuConfigList.length; i++) {
						html += "<li>"
						+"<a class='showMyLi' href='javascript:;' data-url="+menuConfigList[i].url+" data-id='"+menuConfigList[i].id+"' >"+menuConfigList[i].title+"</a></li>";
					}
					//${basePath }rest"+menuConfigList[i].url+"?menuid="+menuConfigList[i].id+"
					// 清空并追加
					$("#headerUl").empty().append(html);
					// 设置默认
					$("#headerUl li:first").attr("class","active");
					// 导航条样式设置
					$("#headerUl>li").each(function () {
						// 其它
						$(this).click(function(){
							// 设置该元素  选中
							$(this).attr("class","active");
							//alert($(this).attr("data-id"));
							$(this).siblings().attr("class","incative");
						});
					});
					
					$(".showMyLi").off().each(function(){
						var id=$(this).data("id");
						var url=$(this).data("url");
						var mySrc="${basePath}rest/"+url+"?menuid="+id;
						$(".showMyIFrame").attr("src",mySrc);
						return false;
					})	
					
					$(".showMyLi").off().click(function(){
						var id=$(this).data("id");
						var url=$(this).data("url");
						var mySrc="${basePath}rest/"+url+"?menuid="+id;
						$(".showMyIFrame").attr("src",mySrc);
					})
					
					
				}
		 });
	});
	
</script>
</html>
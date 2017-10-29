<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" href="./static/bootstrap/css/bootstrap.min.css" media="screen">
<link rel="stylesheet" href="./static/bootstrap/css/bootstrap-theme.min.css" media="screen">
<link rel="stylesheet" href="./static/web/css/front/public.css">
 -->
 <link rel="stylesheet" href="${basePath }static/web/css/guichengzhidu.css">

</head>
<body>
	<div class="contain">
		<div class="header_top">
			<a class="return" href="javascript:history.go(-1)"> <img
				src="${basePath }static/web/img/bg/reutrn_03.png" alt="">
			</a>
			<p>${moduleRich.title}</p>
		</div>
		<div class="main">
			<div class="main_box">
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${basePath }static/bootstrap/js/jquery.min.js"></script>
	<script type="text/javascript" src="${basePath }static/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${basePath }static/layer/layer.js"></script>
	<script type="text/javascript">
    $(function(){
          
         console.log('${modelRich.content}');
         $(".main_box").html('${moduleRich.content}');
    	/*   $.ajax({
            type : "post",
            dataType : "json",
            url : ,
            success : function(data) {
            $(".main_box").html(data);
            }); */
        }); 
        
</script>
</body>
</html>
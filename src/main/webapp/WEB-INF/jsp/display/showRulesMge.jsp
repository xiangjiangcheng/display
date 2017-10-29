<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>规程制度管理配置</title>
<link rel="stylesheet"
	href="${basePath }static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${basePath }static/bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="${basePath }static/web/css/display/page.css">
<style>
table {background: #000000 !important;}
.title{background:#fff;margin-top:25px;height:54px;border:1px solid #E7EBEB;position:relative;}
.title .c_search{margin:10px 0 10px 25px;width:800px;line-height:30px;float:left;}
.c_search div{float:left;margin-left:5px;}
.c_search div span{font-size:12px;}
.c_search form-control{border-color:#EFEFEF;}
.c_search .btn{background:#1ABC9C;cursor:pointer;font-weight:700;color:#fff;width:60px;}
.title .c_new{width:100px;height:30px;float:right;margin:10px 50px 10px 0px;}
.title .c_new .btn{background:#6EC30B;font-weight:700;color:#fff;}

</style>
</head>
<body style="overflow:scroll;overflow-x:hidden">
	<div class="title ">
		<div class="c_search ">
			<div class="checktype">
				<label style="" id="richTitle" >${title}:</label>
				 <input type="text" name="title" id="title">
			</div>
			<div>
				<button class="btn" id="query_btn">搜索</button>
			</div>
		</div>
		<div class="c_new">
			<a href="${basePath }rest/rich/toaddRich/${menuid}">
				<button class="btn" id="addRich">新增${title}</button>
			</a>
		</div>
	</div>
	<table id="mytable" class="table table-hover">
		<thead>
			<tr>
				<th style="background-color: #1abc9c ! important;">序号</th>
				<th style="background-color: #1abc9c ! important;" id="listRichTitle">${title}名称</th>
				<th style="background-color: #1abc9c ! important;">操作</th>
			</tr>
		</thead>
		<tbody class="table table-hover" style="background-color: #d6e4e1;">
		</tbody>
	</table>
	<!-- 分页 -->
	<div class="bottom">
		<div class="selectbtn">
			&nbsp;&nbsp;&nbsp;每页显示<label style="color: #85D9C8">5</label>条，共<label
				style="color: #85D9C8" id="total">0</label> 条 当前显示第<b
				style="color: #85D9C8" id="pagenum"></b>页
		</div>
		<div class="page ">
			<ul id="pageul">

			</ul>
		</div>
	</div>
	<input class="menuid" type="hidden" value="${menuid }">
</body>
<script type="text/javascript"
	src="${basePath }static/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${basePath }static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${basePath }static/layer/layer.js"></script>
<script type="text/javascript">
	/**
	 * 删除
	 */
	function deletPro(obj) {
		var id = String($(obj).attr("data-id"));
		var url = "${basePath}rest/rich/deleteRich/" + id;
		parent.parent.layer.confirm("是否删除?", {
			btn : [ "是", "否" ]
		}, function() {
			$.ajax({
				type : "post",
				url : url,
				dataType : "json",
				success : function(data) {
					if (data.status == true) {
						parent.parent.layer.msg("删除成功")
						QueryRules("", 1);
					} else {
						parent.parent.layer.msg("删除失败!");
					}
				}
			});
		});

	}
	//页面加载进来时,查询
	$(function() {
		
		QueryRules("", 1);
		$("#query_btn").click(function() {
			var title = $("#title").val();
			QueryRules(title, 1);
		});
	});
	//查询项目详细信息并显示在页面上,里面有异步加载.
	function QueryRules(name, page) {
		var info = {
			title : name,
			PageNum : page,
			menuid:$(".menuid").val(),
		}
		$.ajax({
			type : "post",
			dataType : "json",
			data : info,
			url : "${basePath}rest/rich/QueryRich",
			success : function(data) {
				$("#total").html(data.total);
				$("#pagenum").html(data.pageNum);
				var html = "";
				var html1 = "";
				var list = data.list;
				if (list.length > 0) {
					for (var i = 0; i < list.length; i++) {
						html += '<tr>'
								+ '<td style="vertical-align:middle;">'
								+ (i + 1)
								+ '</td>'
								+ '<td style="vertical-align:middle">'
								+ list[i].title
								+ '</td>'
						/* if (list[i].gender == 0) {
							html += '女'
						} else if (list[i].gender == 1) {
							html += '男'
						} */
						html += '<td style="vertical-align:middle">'
								+ '<a href="javascript:;" class="showRichDetails" data-id="'+ list[i].id+ '">预览</a>&nbsp;|'
								+ '<a href="javascript:;" class="queryById" data-id="'+ list[i].id+ '">修改</a>&nbsp;|'
								+ '<a href="javascript:;" style="color:#D9534F" data-id="'
								+ list[i].id
								+ '" onclick="deletPro(this);">删除</a>&nbsp;'
								+ '<tr>';
					}
				} else {
					parent.parent.layer.msg("没有搜索到您要查看的信息");
				}
				// 分页标签
				if (list.length > 0) {
					var html2 = '<li><button type="button" style="width:60px;text-align: center" id="prepage">上一页</button>'
							+ '</li><li id="firstPage"><button type="button">1</button></li>';

					for (var i = 1; i < data.pages; i++) {
						html2 += '<li id=btn' + (i + 1)
								+ '><button type="button">' + (i + 1)
								+ '</button></li>';
					}

					html2 += '<li><button style="width:60px;text-align: center" id="nextpage" type="button">下一页</button></li>';
				}

				$("#pageul").empty().append(html2);
				$("#mytable tbody").empty().append(html);

				//update
				$(".queryById").click(function() {
					var id = $(this).data("id");
					var menuid=$(".menuid").val(); 
					location.href = "${basePath}rest/rich/toUpdateRich?id="+id+"&menuid="+menuid;
				});
				//点击查看详情
				$(".showRichDetails").click(function(){
					var id = $(this).data("id");
					location.href = "${basePath}rest/rich/showRichDetails/"+ id;
				});
				//上一页
				$("#prepage").off().click(function() {
					if (data.pageNum - 1 <= 0) {
						parent.parent.layer.msg("当前已是首页");
					} else {
						QueryRules(name, data.pageNum - 1);
					}
				});
				//下一页
				$("#nextpage").off().click(function() {
					if (data.pageNum >= data.pages) {
						parent.parent.layer.msg("当前已是尾页");
					} else {
						QueryRules(name, data.pageNum + 1);
					}
				});
				//第一页
				$("#firstPage").off().click(function() {
					if (data.pageNum == 1) {
						parent.parent.layer.msg("当前已是首页");
					} else {
						QueryRules(name, 1);
					}
				});
				//2,3,4..... 注意闭包问题
				for (var i = 1; i < data.pages; i++) {
					(function(arg) {
						$("#btn" + (arg)).off().click(function() {
							QueryRules(name, arg);
						});
					})(i + 1);
				}

			}

		});
	}
</script>
</html>
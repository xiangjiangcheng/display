<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>先进展示模块管理</title>
<link rel="stylesheet"
	href="${basePath }static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${basePath }static/bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="${basePath }static/web/css/display/page.css">
<style>
table {
	background: #000000 !important;
}

.form-control {
	width: 150px;
	display: inline-block !important;
}
</style>
</head>
<body>
	<div class="title ">
		<div class="c_search ">
			<div>
				<span>姓名：</span>
			</div>
			<div>
				<input type="text" name="search" id="condition" class="form-control">
			</div>
			<div>
				<button class="btn" id="query_btn">搜索</button>
			</div>
		</div>
		<div class="c_new" style="width: 80px;">
			<a href="${basePath }rest/moduleform/toAddAdvancedShow">
				<button class="btn" id="newProject">新增</button>
			</a>
		</div>
	</div>
	<table id="mytable" class="table table-hover">
		<thead>
			<tr>
				<th style="background-color: #1abc9c ! important;">序号</th>
				<th style="background-color: #1abc9c ! important;">姓名</th>
				<th style="background-color: #1abc9c ! important;">头像</th>
				<th style="background-color: #1abc9c ! important;">展示内容</th>
				<th style="background-color: #1abc9c ! important;">备注</th>
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
		var url = "${basePath}rest/moduleform/deleteAdvance";
		parent.parent.layer.confirm("是否删除这条数据?", {
			btn : [ "是", "否" ]
		}, function() {
			$.ajax({
				type : "post",
				url : url,
				data : {
					id : id,
				},
				dataType : "json",
				success : function(data) {
					if (data.status) {
						parent.parent.layer.msg("删除成功");
						QueryData(1, 5, "");
						/* $(obj).parent().parent().remove(); */
					} else {
						parent.parent.layer.msg("删除失败");
					}
				}
			});
		});

	}
	//页面加载进来时,查询
	$(function() {
		QueryData(1, 5, "");
		$("#query_btn").click(function() {
			var condition = $("#condition").val();
			QueryData(1, 5, condition);
		});
	});
	//查询项目详细信息并显示在页面上,里面有异步加载.
	function QueryData(pageNum, pageSize, condition) {
		var sendData = {
			pageNum : Number(pageNum),
			pageSize : Number(pageSize),
			condition : condition
		}
		$
				.ajax({
					type : "post",
					dataType : "json",
					data : sendData,
					url : "${basePath}rest/moduleform/QueryAdvanceShowData",
					success : function(data) {
						$("#total").html(data.total);
						$("#pagenum").html(data.pageNum);
						var html = "";
						var html1 = "";
						var list = data.list;
						if (list.length > 0) {
							for (var i = 0; i < list.length; i++) {
								html += '<tr>'
										+ '<td style="vertical-align:middle; background:bule">'
										+ (i + 1)
										+ '</td>'
										+ '<td style="vertical-align:middle">'
										+ list[i].name
										+ '</td>'
										+ "<td style='vertical-align:middle'> "
										+ list[i].img
										+ '</td>'
										+ "<td style='vertical-align:middle'>"
										+ list[i].content
										+ '</td>'
										+ '<td style="vertical-align:middle">';
										var remark = list[i].remark;
										if (remark == null) {
											html += '无';
										} else {
											html += list[i].remark;
										}
								   html += '</td>';
								   html += '<td style="vertical-align:middle">'
										+ '<a href="javascript:;" class="queryById" data-id="'+ list[i].id+ '">修改</a>&nbsp;|'
										+ '<a href="javascript:;" style="color:#D9534F" data-id="'
										+ list[i].id
										+ '" onclick="deletPro(this);">删除</a>&nbsp;'
										+ '<tr>';
							}
						} else {
							parent.parent.layer.msg("没有搜索到您要查看的信息");
						}
						var html2="";
						// 分页标签
						if (list.length > 0) {
							html2 = '<li><button type="button" style="width:60px;text-align: center" id="prepage">上一页</button>'
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

						$(".queryById").click(
							function() {
								var id = $(this).data("id");
								location.href = "${basePath }rest/moduleform/toUpdateAdvancedShow/" + id;
						})

						//上一页
						$("#prepage").off().click(function() {
							if (data.pageNum - 1 <= 0) {
								parent.parent.layer.msg("当前已是首页");
							} else {
								QueryData(data.pageNum - 1,5, "");
							}
						});
						//下一页
						$("#nextpage").off().click(function() {
							if (data.pageNum >= data.pages) {
								parent.parent.layer.msg("当前已是尾页");
							} else {
								QueryData(data.pageNum + 1,5, "");
							}
						});
						//第一页
						$("#firstPage").off().click(function() {
							if (data.pageNum == 1) {
								parent.parent.layer.msg("当前已是首页");
							} else {
								QueryData(1, 5, "");
							}
						});
						//2,3,4..... 注意闭包问题
						for (var i = 1; i < data.pages; i++) {
							(function(arg) {
								$("#btn" + (arg)).off().click(function() {
									QueryData(arg, 5, "");
								});
							})(i + 1);
						}

					}

				});
	}
</script>
</html>
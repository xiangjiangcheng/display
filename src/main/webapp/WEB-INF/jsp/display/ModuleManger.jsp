<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>模块管理配置-列表</title>
<link rel="stylesheet" href="${basePath }static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${basePath }static/bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${basePath }static/web/css/display/page.css">
<style>
table {
background:#000000 !important;
}
.form-control{width: 150px; display:inline-block !important;}

</style>
</head>
<body>
<div class="title ">
		<div class="c_search ">
			<!-- <div>
				<span>模块名称：</span>
			</div>
			<div>
				<input type="text" name="search" id="condition" class="form-control">
			</div>
			<div>
				<button class="btn" id="query_btn">搜索</button>
			</div> -->
			
			<div class="checktype">
				<label style="">模块名称:</label>
				<select class="form-control" 
					style="" name="type" id="typeSt">
						<option value="1">一级菜单</option>
						<option value="2">二级菜单</option>
						<option value="3">三级菜单</option>
				</select>
			</div>
			<div>
				<input type="text" name="search" id="condition">
			</div>
			<div>
				<button class="btn" id="query_btn">搜索</button>
			</div>
		</div>
		<div class="c_new">
			<a href="${basePath }rest/menu/addModuleMenu">
				<button class="btn" id="newProject">新增模块</button>
			</a>
		</div>
</div>
<table id="mytable" class="table table-hover"  >
		<thead >
			<tr>
				<th style="background-color:#1abc9c ! important;">序号</th>
				<th style="background-color:#1abc9c ! important;">标题</th>
				<th style="background-color:#1abc9c ! important;">背景</th>
				<th style="background-color:#1abc9c ! important;">图标</th>
				<th style="background-color:#1abc9c ! important;">当前状态</th>
				<th style="background-color:#1abc9c ! important;">操作</th>
			</tr>
		</thead>
		<tbody class="table table-hover" style="background-color:#d6e4e1;">
		</tbody>
</table>
<!-- 分页 -->
	<div class="bottom">
		<div class="selectbtn">
			&nbsp;&nbsp;&nbsp;每页显示<label style="color: #85D9C8">5</label>条，共<label style="color: #85D9C8" id="total">0</label> 条
			当前显示第<b style="color: #85D9C8" id="pagenum"></b>页
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
	var url = "${basePath}rest/menu/delete/" + id;
	var level= document.getElementById("typeSt").value;
	parent.layer.confirm("确定删除这个菜单，删除后将无法恢复数据?", {
		btn : [ "是", "否" ]
	}, function() {
		$.ajax({
			type : "post",
			url : url,
			dataType : "json",
			success : function(data) {
				if (data.result == "true") {
					parent.layer.msg("删除成功")
					QueryModule("",1,level);
					/* $(obj).parent().parent().remove(); */
				} else {
					parent.layer.msg(data.message)
				}
			}
		});
	});

}
//页面加载进来时,查询
$(function() {
	QueryModule("",1,1);
	$("#query_btn").click(function(){
		var name = $("#condition").val();
		var level= document.getElementById("typeSt").value;
		QueryModule(name,1,level);
	});
});
//查询项目详细信息并显示在页面上,里面有异步加载.
function QueryModule(name,page,level){
	var info = {
			modulePageName:name,
			modulePageNum:page,
			moduleLevel:level
			
	}
	$.ajax({
		type:"post",
		dataType:"json",
		data:info,
		url:"${basePath}rest/menu/QueryModule",
		success:function(data){
			$("#total").html(data.total);
			$("#pagenum").html(data.pageNum);
			var html = "";
			var html1="";
			var list = data.list;
		if (list.length > 0) {
			for (var i = 0; i < list.length; i++) {
				html += '<tr>' 
				+ '<td style="vertical-align:middle; background:bule">'+ (i+1) + '</td>'
				+ '<td style="vertical-align:middle">'+ list[i].title+ '</td>'
				+ "<td style='vertical-align:middle'><img src='${basePath}static/web/img/menubg/"+list[i].backgroundname+"' style='width:50px;height:50px;'>"
				+'</td>'
				+ "<td style='vertical-align:middle'><img src='${basePath}static/web/img/menuicon/"+list[i].iconname+"' style='width:50px;height:50px;'>"
				+'</td>'
				+'<td style="vertical-align:middle">';
				if(list[i].ishide==1){
					html+='隐藏'
				}else if(list[i].ishide==0){
					html+='显示'
				}
				html+='</td>';
				/* html+='<td style="vertical-align:middle">'
				+ '<a href="javascript:;" class="queryById" data-id="'+ list[i].id+ '">详情</a>&nbsp;|'
				+ '<a href="javascript:;" style="color:#D9534F" data-id="'+ list[i].id+'" onclick="deletPro(this);">删除</a>&nbsp;'
				+ '<tr>'; */
				html+='<td style="vertical-align:middle">'
					+ '<a href="javascript:;" class="queryById" data-id="'+ list[i].id+ '">详情</a>&nbsp;|'
					+ '<a href="javascript:;" class="statusBtn" data-id="'+ list[i].id+ '" data-flag="'+ list[i].ishide + '">';
				if(list[i].ishide==1){
					html+='显示'
				}else if(list[i].ishide==0){
					html+='隐藏'
				}
				html += '</a>&nbsp;|'
					+ '<a href="javascript:;" style="color:#D9534F" data-id="'+ list[i].id+'" onclick="deletPro(this);">删除</a>&nbsp;'
					+ '<tr>';
								}
			} else {
			parent.layer.msg("没有搜索到您要查看的信息");
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
					
					
					$(".queryById").click(function(){
						var id=$(this).data("id");
						location.href="${basePath}rest/menu/showMenuDetail/"+id;
					})
					
					// 修改菜单的显示隐藏状态 
					// 这里修改一级菜单状态的时候需要判断是否可以显示 
					$(".statusBtn").click(function(){
						// 获取菜单当前的状态
						var status = $(this).data("flag");
						// 获取菜单的级别
						var level = $("#typeSt").val();
						// 获取菜单的id
						var menuid = $(this).data("id");
						// alert(status);
						// location.href="${basePath}rest/menu/showMenuDetail/"+id;
						// 是显示还是隐藏
						if (status == 1) {
							status = 0;
						} else {
							status = 1;
						}
						if (level == 1 && status == 0) {
							// 去后台查 看一级页面是否有8个菜单显示
							$.ajax({
									dataType : "json",
									type : "post",
									data : {},
									url : "${basePath}rest/menu/menuCanShow",
									success : function(data) {
										// 
										if (data.status) {
											// 一级页面的菜单未满8个
											// 设置为显示
											$.ajax({
												type:"post",
												dataType:"json",
												data:{
													ishide : status,
													menuid : menuid,
												},
												url:"${basePath}rest/menu/updateIsHide",
												success:function(data){
													if(data.status) {
														parent.layer.msg("操作成功！");
														// 跳转到上级页面
														// window.location.href = "${basePath}rest/page/ModuleManger";
														var name = $("#condition").val();
														var level= document.getElementById("typeSt").value;
														QueryModule(name,1,level);
													} else {
														parent.layer.msg("操作失败！");
													}
												}
											})
										} else {
											// 满8个
											parent.layer.msg("抱歉，一级菜单一级已经有8个，你可以先去隐藏其他的一级菜单！");
										}
									}
							});
						} else {
							$.ajax({
								type:"post",
								dataType:"json",
								data:{
									ishide : status,
									menuid : menuid,
								},
								url:"${basePath}rest/menu/updateIsHide",
								success:function(data){
									if(data.status) {
										parent.layer.msg("操作成功！");
										// 跳转到上级页面
										var name = $("#condition").val();
										var level= document.getElementById("typeSt").value;
										QueryModule(name,1,level);
									} else {
										parent.layer.msg("操作失败！");
									}
								}
							})
						}
						
						
					})
					//上一页
					$("#prepage").off().click(function() {
										if (data.pageNum - 1 <= 0) {
											parent.layer.msg("当前已是首页");
										} else {
											QueryModule(name, data.pageNum - 1,level);
										}
									});
					//下一页
					$("#nextpage").off().click(function() {
										if (data.pageNum >= data.pages) {
											parent.layer.msg("当前已是尾页");
										} else {
											QueryModule(name, data.pageNum + 1,level);
										}
									});
					//第一页
					$("#firstPage").off().click(function() {
						if (data.pageNum == 1) {
							parent.layer.msg("当前已是首页");
						} else {
							QueryModule( name, 1,level);
						}
					});
					//2,3,4..... 注意闭包问题
					for (var i = 1; i <data.pages; i++) {
						(function(arg) {
							$("#btn" + (arg)).off().click(function() {
								QueryModule(name,arg,level);
									});
						})(i + 1);
					}
					
		}
		
	});
}
</script>
</html>
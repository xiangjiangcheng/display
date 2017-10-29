<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>查看计划总结页面</title>
<link rel="stylesheet" href="${basePath }static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${basePath }static/bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${basePath }static/web/css/display/page.css">
<link rel="stylesheet" href="${basePath }static/web/css/front/lastweeksumary.css">
<style>
.previewExcel{color:#1ABC9C;}
#showMyTbody td:nth-child(2){width: 70%;}
#showIssue{color:#EC3838;}
h4{text-align: center;}
</style>
</head>
<body>
	<div class="title ">
		<div class="c_search ">
			<div class="checktype">
				<label style="">名称:</label>
				<input type="text" id="search">
			</div>
			<div>
				<button class="btn" id="query_btn">搜索</button>
			</div>
		</div>
		<div class="c_new">
			<button type="button" class="btn btn-info" id="newExcel">上传新表格</button>
		</div>
	</div>
	<table id="mytable" class="table table-hover">
		<thead>
			<tr>
				<th>序号</th>
				<th>名称</th>
				<th>年份</th>
				<th>月份</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody class="table table-hover" style="background-color: #d6e4e1;">
		</tbody>
	</table>
	<!-- 分页 -->
	<div class="bottom">
		<div class="selectbtn">
			每页显示 <select name="numsize" id="numsize" >
				<option value="5" selected="selected">5</option>
				<option value="10" >10</option>
				<option value="15">15</option>
			</select> 条,共<label style="color: #85D9C8" id="total">0</label> 条
		</div>
		<div class="page">
			<ul id="pageul">
			</ul>
		</div>
	</div>
</body>

		<!-- 预览Excel-->
	<div id="previewExcelModal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" >
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="bgModalLabel">请选择Excel模板：</h4>
				</div>
				<div class="modal-body" id="ExcelBody">
					<table align="center" class="tab_sumary">
					<caption></caption>
					<thead>
					<tr style="background:#43c0b5;" id="showTh"></tr>
					</thead>
					<tbody id="showMyTbody">
					</tbody>
					</table>
					<div id="showIssue"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>

<input type="hidden" value="${menuid}" id="hiddenMenuId">
<script type="text/javascript" src="${basePath }static/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="${basePath }static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${basePath }static/layer/layer.js"></script>
<script type="text/javascript">
	//页面加载进来时,查询
	$(function() {
		//页面初始化
		QueryPlan(1,5,"");
		
		$("#newExcel").off().click(function(){
			var menuid=$("#hiddenMenuId").val();
			location.href="${basePath }rest/excel/toAddDynamic/"+menuid;
		});
		
		//搜索功能
		$("#query_btn").click(function() {
			var condition = $("#search").val();
			var pageSize=$("#numsize").val();
			QueryPlan(1,pageSize,condition);
		});
		
		//分页显示功能
		$("#numsize").change(function(){
			var condition = $("#search").val();
			var pageSize=$("#numsize").val();
			QueryPlan(1,pageSize,condition);
		})
	});
	//查询项目详细信息并显示在页面上,里面有异步加载.
	function QueryPlan(pageNum,pageSize,condition) {
		var sendData = {
			name : condition,
			pageNum : pageNum,
			pageSize:pageSize,
			menuid:$("#hiddenMenuId").val()
		}
		$.ajax({
			type : "post",
			data : sendData,
			dataType : "json",
			url : "${basePath }rest/excel/doShowPlanList",
			success : function(data) {
				//alert("testPage:"+data.pages);
				$("#total").html(data.total);
				var html = "";
				var list = data.list;
				if(list.length>0){
					for (var i = 0; i < list.length; i++) {
						html += '<tr>' + '<td>'
								+ ((data.pageNum - 1) * pageSize + i + 1)
								+ '</td>'
								+ '<td>'+ list[i].remark+ '</td>'
								+ '<td>'+ list[i].year+ '</td>'
								+ '<td>'+ list[i].month+ '</td>'
								+ '<td>'
								+'<a href="javascript:;" class="previewExcel" data-id="'+ list[i].id+ '">预览</a>&nbsp;&nbsp;|&nbsp;&nbsp;'
								+'<a href="javascript:;" class="deleteExcel"  data-id="'+ list[i].id+ '">删除</a> </td>'
								+ '</tr>';
					}
					var html2 = "<li><button style='width:60px;text-align: center' id='prepage'>上一页</button>"
						+ "</li><li id='firstPage'><button>1</button></li>";
					for (var i = 1; i < data.pages; i++) {
					html2 += '<li id=btn' + (i + 1) + '><button>'
							+ (i + 1) + '</button></li>';
					}
					html2 += '<li><button style="width:60px;text-align: center" id="nextpage">下一页</button></li>';
					$("#pageul").empty().append(html2);
					$("#mytable tbody").empty().append(html);
				}else{
					$("#pageul").empty();
					$("#mytable tbody").empty();
					parent.layer.msg("没有搜索到想要的数据");
				}
				
				$(".previewExcel").click(function(){
					var id=$(this).data("id");
					$.ajax({
						data:{id:id},
						type:'post',
						async:false,
						dataType:'json',
						url:'${basePath}rest/excel/previewExcel',
						success:function(data){
							var title=data.title,map=data.map,filename=data.fileName;
							var head='',content='';
							if(filename!=undefined){
								$(".modal-title").html(filename);
							}
							if(title!=undefined){
								for(var i in title){
									head+='<th>'+title[i]+'</th>'
								}
								for(var i in map){
										content+='<tr>'
										for(var j in map[i]){
											if("存在的问题"==map[i][j]){
												$("#showIssue").empty().append("存在的问题："+map[i][j*1+1])
												break;
											}
											content+='<td>'+map[i][j]+'</td>'
										}
										content+='</tr>'
								}
								$("#showMyTbody").empty().append(content);
								$("#showTh").empty().append(head);
							}else{
								$("#showMyTbody").empty();
								$("#showTh").empty();
								layer.msg("没有数据哦~请重新选择时间~");
							}
						}
					})
					$("#previewExcelModal").modal("show");
				})
				
				
				$(".deleteExcel").click(function(data){
					var id=$(this).data("id");
					
					$.ajax({
						data:{id:id},
						type : "post",
						url : "${basePath}rest/excel/delExcel",
						dataType : "json",
						success : function(data) {
							var msg=data.msg;
						
							if (data.msg == 'success') {
								parent.layer.msg("删除成功")
								location.reload();
							} else {
								parent.layer.msg("删除失败!");
							}
						}
					});
				})
					
				//上一页
				$("#prepage").off().click(
						function() {
							if (data.isFirstPage == true) {
								parent.layer.msg("当前已是首页");
							} else {
								QueryPlan(data.pageNum - 1,data.pageSize, condition);
							}
						});
				//下一页
				$("#nextpage").off().click(
						function() {
							if (data.isLastPage == true) {
								parent.layer.msg("当前已是尾页");
							} else {
								QueryPlan(data.pageNum + 1,data.pageSize, condition);
							}
						});
				//第一页
				$("#firstPage").off().click(function() {
					if (data.isFirstPage == true) {
						parent.layer.msg("当前已是首页");
					} else {
						QueryPlan(1, data.pageSize, condition);
					}
				});
				//2,3,4..... 注意闭包问题
				for (var i = 1; i < data.pages; i++) {
					(function(arg) {
						$("#btn" + (arg)).off().click(
								function() {
									QueryPlan(arg, data.pageSize,condition);
								});
					})(i + 1);
				}
			}
		});
	}
</script>
</html>
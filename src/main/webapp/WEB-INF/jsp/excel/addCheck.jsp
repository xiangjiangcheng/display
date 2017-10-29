<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<title>上传新的Excel</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${basePath }static/web/css/base.css">
<link rel="stylesheet" href="${basePath }static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${basePath }static/bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${basePath }static/web/css/display/page.css" />
<link rel="stylesheet" href="${basePath }static/bootstrap-fileinput/css/fileinput.min.css">
<link rel="stylesheet" href="${basePath }static/web/css/front/lastweeksumary.css">

<style type="text/css">
.container{margin-top: 20px;}
.btn{margin-right:45px; margin-top: 20px;}
th,td{height: 30px;}
.tab_sumary {
    width: calc(100% - 225px);
    text-align: center;}
.showPre{padding: 0; text-align: center;}
#showName{background: #43c0b5;text-align: center;color: #fff;padding: 5px;height: 30px;}
.showCol{    width: 30px;
    height: 170px;
    font-size: 20px;
    font-weight: 700;
    text-align: center;}
.showGet{height: 30px;text-align: center;width: calc(100% - 30px);padding-top: 5px;}
.showSet{height: 30px;text-align: center;width: calc(100% - 30px);padding-top: 5px;}
.showPre{
	position:relative;
}
.showCol{
	float: left;
	height:100%;
}
.showMonth{
	height: 60px;
    float: left;
    display: flex;
    align-items: center;
    margin-left: 30px;
}
.info{
	margin-left: 30px;
}
h4{text-align: center;}
</style>
</head>
<body>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading">
				<button class="icon" disabled="disabled">
					<span class="glyphicon glyphicon-th-large"></span>
				</button>
				新增绩效考核
			</div>
			<div class="panel-body">
				<form class="form-horizontal" role="form" id="addform">
					<!-- 隐藏数据 -->
					<input type="hidden" id="hiddenMenuId" value="${menuid}" name="menuid">
					<input type="hidden" id="hiddenFileName" name="fileName">
					<input type="hidden" id="hiddenExcelId" value="${excels.id}" name="excelid">
					
				  <div class="form-group">
				    <label for="username" class="col-sm-3 control-label">标题：</label>
				    <div class="col-sm-7">
				      <input type="text" class="form-control" id="remark" placeholder="请输入标题" name="remark">
				    </div>
				  </div>
				  <div class="form-group">
				    <label id="forYears" class="col-sm-3 control-label">年份：</label>
				    <div class="col-sm-3">
				    	<select class="form-control" id="years"  name="year"></select>
				      <input type="text" >
				    </div>
				  </div>
				  <div class="myButton col-sm-6  col-md-offset-2">
					<button class="btn btn-info" type="button" id="downExcel"  data-id="${excels.filename}">下载Excel模板</button>
					<button class="btn btn-primary" type="button" id="previewExcel">预览</button>
					<input type="file" id="uploadExcel" name="file" accept=".xls,.xlsx,.csv">
				  </div>
				  
				 
				    <div class=" col-sm-4">
				      	<button type="button" class="btn btn-theme" id="submitBtn">提交</button>
						<button type="reset" class="btn btn-theme-cancel" onclick="history.back();">返回</button>
				    </div>
				  
				</form>
			</div>
		</div>
	</div>
	
	<!-- 预览Excel-->
	<div id="previewExcelModal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" >
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="bgModalLabel">预览：</h4>
				</div>
				
				
					<div class="col-md-3 showPre">
					</div>
					<table align="center" class="tab_sumary col-md-8">
					<tr style="background:#43c0b5;" id="showTh">
					</tr>
					<tbody id="showMyTbody">
					</tbody>
					</table>
					<div id="showIssue"></div>
					
					
					
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${basePath }static/bootstrap/js/jquery.min.js"></script>
	<script type="text/javascript" src="${basePath }static/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${basePath }static/layer/layer.js"></script>
	<script type="text/javascript" src="${basePath }static/bootstrap-fileinput/js/fileinput.js"></script>
	<script type="text/javascript" src="${basePath }static/bootstrap-fileinput/js/locales/zh.js"></script>
	
	<script type="text/javascript">
		$(function() {
			initTime();
			//初始化上传文件
	    	initFileInput("uploadExcel", "${basePath}rest/excel/uploadExcel");
			
			$("#downExcel").click(function(){
				var name=$(this).data("id");
				window.location.href="${basePath}static/web/excelModel/"+name;
			});
			$("#previewExcel").click(function(){
				var file=$("#hiddenFileName").val();
				if(file==""){
					parent.layer.msg("还没有上传文件哦！");
				}else{
					var excelid=$("#hiddenExcelId").val();//获取menuid,确定上传的模板
					$.ajax({
						data:{filename:file,excelid:excelid},
						type:'post',
						async:false,
						dataType:'json',
						url:'${basePath}rest/excel/previewExcelByName',
						success:function(data){
							var map=data.map,title=data.title;
							var content='', head='';
							var remark = $("#remark").val();
							$("#bgModalLabel").html(remark);
							if(title.length>0){
								for(var i in title){
									head+='<th>'+title[i]+'</th>'
								}
							}else{
								parent.layer.msg("没有标题,是模板有错吗？");
							}
							for(var i in map){
								content+='<tr>'
								for(var j in map[i]){
									content+='<td>'+map[i][j]+'</td>'
								}
								content+='</tr>'
							}
							var pre='<div id="showName">姓名</div><div class="showCol"><span >绩效考核情况</span></div>'
									for(var i=1;i<=12;i++){
										pre+='<div class="info"> <div class="showMonth">'+i+'月</div><div class="showGet">得分</div><div class="showSet">加减分情况</div></div>'
									}
							$("#showMyTbody").empty().append(content);
							$("#showTh").empty().append(head);
							$(".showPre").empty().append(pre);
							$(".showCol").height($(".showPre").outerHeight());
						}
					});
					$("#previewExcelModal").modal("show");
				}
			})
		})
			
			// 点击提交按钮触发事件
			$("#submitBtn").click(function() {
				//获取对应数据
				//先序列化不含有file文件的表单
				var filename=$("#hiddenFileName").val();
				if(filename!=""){
				var formData = $("#addform").serialize();
					$.ajax({
						dataType : "json",
						type : "post",
						data : formData,
						url : "${basePath}rest/excel/doAddPlan",
						success : function(data) {
							// 解析数据
							if (data.msg=='success') {
								parent.layer.msg("添加成功！");
								history.back(-1);
							}else{
								parent.layer.msg("添加失败！");
							}
						}
					});
				}else{
					parent.layer.msg("你还没上传文件哦~请先上传文件");
				}
				});
			

			
		function initTime(){
			//初始化了时间
			var date=new Date();
			var years=date.getFullYear();
			years=years-5;
			var html=''
			for(var i=0;i<=7;i++){
				
				if(i==5){
					html+='<option value="'+(years)+'" selected>'+(years++)+'年</option>'
				}else{
					html+='<option value="'+(years)+'">'+(years++)+'年</option>'
				}
			}
			$("#years").empty().append(html);
			
			var month=date.getMonth()+1;
			$("#month option").each(function(){
				var myMonth=$(this).val();
				if(myMonth==month){
					$(this).attr("selected",true);
				}
			});
			
			if("check"=="${excels.type}"){
				$("#month").parent().empty();
				$("#forMonth").empty();
			}
		}	

		
		function initFileInput(ctrName,uploadUrl){
			//id
			var control=$("#"+ctrName);
			
			control.fileinput({
				language:'zh',//语言
				uploadUrl:uploadUrl, //url
				showPreview:false,
				uploadAsync: true,
				showProgress:false,
				allowedFileExrensions:['xls','xlsx','csv'],//后缀
				showUpload:false,//不是否显示上传按钮
				showRemove:false,//不显示移出按钮
				showCaption:false,//不是否显示标题
				browseClass:'btn btn-info',//按钮样式
				priviewFileIcon:"<i class='glyphicon glyphicon-king></i>'",
				maxFileSize:10240,//图片最大为3096M
				enctype:'multipart/form-data',
				//这是文件名替换
				slugCallback:function(filename) {
			      return filename.replace('(', '_').replace(']', '_');
			    }
			}).on("filebatchselected", function(event, files) {
	            $(this).fileinput("upload");
	        }).on("fileuploaded", function(event, data, previewId, index) {//上传事件
		        var filename=data.response.filename;
		       	$("#hiddenFileName").val(filename);
		  });
		}//end init
	</script>
</body>
</html>
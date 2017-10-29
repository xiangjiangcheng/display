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
<link rel="stylesheet" href="${basePath }static/bootstrap/css/bootstrap-datetimepicker.min.css">
<style type="text/css">
.container{margin-top: 20px;}
.btn{margin-right:45px; margin-top: 20px;}
#showIssue{color:#EC3838;}
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
				上传Excel
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
				    <label id="forYears" class="col-sm-3 control-label">日期：</label>
				    <div class="mytime col-sm-3">
				    	<input class="form-control" id="mydate" readonly="readonly" >
				    </div>
				  </div>
				  
				  <div class="myButton col-sm-6  col-md-offset-2">
					<button class="btn btn-info" type="button" id="downExcel"  data-id="${excels.id}">下载Excel模板</button>
					<button class="btn btn-primary" type="button" id="previewExcel" style="text-align:center;">预览</button>
					<input type="file" id="uploadExcel" name="file" accept=".xls,.xlsx,.csv">
				  </div>
				  
				 
				    <div class=" col-sm-4">
				      	<button type="button" class="btn btn-theme" id="submitBtn">提交</button>
						<button type="reset" class="btn btn-theme-cancel" onclick="history.back();">返回</button>
				    </div>
				  
				  <!--日期 ，年月日 -->
					<input type="hidden" id="hiddenYear" name="year">
					<input type="hidden" id="hiddenMonth" name="month">
					<input type="hidden" id="hiddenDay" name="day">
					
				  
				  
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
				<div class="modal-body" id="ExcelBody">
					<table align="center" class="tab_sumary">
					<caption></caption>
					<tr style="background:#43c0b5;" id="showTh">
					</tr>
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
	<script type="text/javascript" src="${basePath }static/bootstrap/js/jquery.min.js"></script>
	<script type="text/javascript" src="${basePath }static/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${basePath }static/layer/layer.js"></script>
	<script type="text/javascript" src="${basePath }static/bootstrap-fileinput/js/fileinput.js"></script>
	<script type="text/javascript" src="${basePath }static/bootstrap-fileinput/js/locales/zh.js"></script>
	<script type="text/javascript" src="${basePath }static/bootstrap/js/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" src="${basePath }static/bootstrap/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	
	<script type="text/javascript">
		$(function() {
			
			$("#mydate").change(function(){
				var date=$(this).val();
				var ss=date.split("-");
				$("#hiddenYear").val(ss[0]);
				$("#hiddenMonth").val(ss[1]);
				$("#hiddenDay").val(ss[2]);
			})
			
			$("#mydate").datetimepicker({
				language:'zh-CN',
				format:"yyyy-mm-dd",
				autoclose:1,
				todayBtn:1,
				todayHighlight:1,
				minView:"month"
			});
			
			
			
			
			initTime();
			//初始化上传文件
	    	initFileInput("uploadExcel", "${basePath}rest/excel/uploadExcel");
			
			$("#downExcel").click(function(){
				var id=$(this).data("id");
				window.location.href="${basePath}rest/excel/DownloadMyModel/?id="+id
				/* $(".downHref").attr("href","${basePath}static/web/excelModel/"+name).attr("download","工作计划.xls"); */
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
							var title=data.title,map=data.map;
							var head='',content='';
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
						}
					})
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
			var myDate=new Date();
			//获取当前年
			var year=myDate.getFullYear();
			//获取当前月
			var month=myDate.getMonth()+1+"";
			if(month.length==1){
				month="0"+month
			}
			//获取当前日
			var date=myDate.getDate()+"";
			if(date.length==1){
				date="0"+date
			}
			$("#mydate").val(year+"-"+month+"-"+date);
			$("#hiddenYear").val(year);
			$("#hiddenMonth").val(month);
			$("#hiddenDay").val(date);
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
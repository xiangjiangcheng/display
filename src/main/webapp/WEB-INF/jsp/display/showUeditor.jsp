<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="org.apache.commons.lang.StringUtils" %>
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
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;"/>
	<title>编辑器完整版实例-1.2.6.0</title>
	<script type="text/javascript" src="${basePath }ueditor/ueditor.config.js"></script>
	<script type="text/javascript" src="${basePath }ueditor/ueditor.all.js" ></script>
	<link type="text/css" rel="Stylesheet" href="${basePath }ueditor/WordPaster/css/WordPaster.css"/>
    <link type="text/css" rel="Stylesheet" href="${basePath }ueditor/WordPaster/js/skygqbox.css" />
    <script type="text/javascript" src="${basePath }ueditor/WordPaster/js/json2.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="${basePath }ueditor/WordPaster/js/jquery-1.4.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="${basePath }ueditor/WordPaster/js/WordPaster.js" charset="utf-8"></script>
    <script type="text/javascript" src="${basePath }ueditor/WordPaster/js/skygqbox.js" charset="utf-8"></script>
</head>
<body>
	<div>
    <h1>完整demo</h1>
   <!--  <script id="editor" type="text/plain" style="width:1024px;height:500px;"></script>
 -->
 	<textarea name="后台取值的key" id="editor">这里写你的初始化内容</textarea>
 </div>
<div id="btns">
    <div>
        <button onclick="getAllHtml()">获得整个html的内容</button>
        <button onclick="getContent()">获得内容</button>
        <button onclick="setContent()">写入内容</button>
        <button onclick="setContent(true)">追加内容</button>
        <button onclick="getContentTxt()">获得纯文本</button>
        <button onclick="getPlainTxt()">获得带格式的纯文本</button>
        <button onclick="hasContent()">判断是否有内容</button>
        <button onclick="setFocus()">使编辑器获得焦点</button>
        <button onmousedown="isFocus(event)">编辑器是否获得焦点</button>
        <button onmousedown="setblur(event)" >编辑器失去焦点</button>

    </div>
    <div>
        <button onclick="getText()">获得当前选中的文本</button>
        <button onclick="insertHtml()">插入给定的内容</button>
        <button id="enable" onclick="setEnabled()">可以编辑</button>
        <button onclick="setDisabled()">不可编辑</button>
        <button onclick=" UE.getEditor('editor').setHide()">隐藏编辑器</button>
        <button onclick=" UE.getEditor('editor').setShow()">显示编辑器</button>
        <button onclick=" UE.getEditor('editor').setHeight(300)">设置高度为300默认关闭了自动长高</button>
    </div>

    <div>
        <button onclick="getLocalData()" >获取草稿箱内容</button>
        <button onclick="clearLocalData()" >清空草稿箱</button>
    </div>

</div>
<div>
    <button onclick="createEditor()">
    创建编辑器</button>
    <button onclick="deleteEditor()">
    删除编辑器</button>
</div>

<script type="text/javascript">

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');
    function isFocus(e){
        alert(UE.getEditor('editor').isFocus());
        UE.dom.domUtils.preventDefault(e)
    }
    function setblur(e){
        UE.getEditor('editor').blur();
        UE.dom.domUtils.preventDefault(e)
    }
    function insertHtml() {
        var value = prompt('插入html代码', '');
        UE.getEditor('editor').execCommand('insertHtml', value)
    }
    function createEditor() {
        enableBtn();
        UE.getEditor('editor');
    }
    function getAllHtml() {
        alert(UE.getEditor('editor').getAllHtml())
    }
    function getContent() {
        var arr = [];
        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getContent());
        console.log(arr.join("\n"));
    }
    function getPlainTxt() {
        var arr = [];
        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getPlainTxt());
        alert(arr.join('\n'))
    }
    function setContent(isAppendTo) {
        var arr = [];
        arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
        UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
        alert(arr.join("\n"));
    }
    function setDisabled() {
        UE.getEditor('editor').setDisabled('fullscreen');
        disableBtn("enable");
    }

    function setEnabled() {
        UE.getEditor('editor').setEnabled();
        enableBtn();
    }

    function getText() {
        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
        var range = UE.getEditor('editor').selection.getRange();
        range.select();
        var txt = UE.getEditor('editor').selection.getText();
        alert(txt)
    }

    function getContentTxt() {
        var arr = [];
        arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
        arr.push("编辑器的纯文本内容为：");
        arr.push(UE.getEditor('editor').getContentTxt());
        alert(arr.join("\n"));
    }
    function hasContent() {
        var arr = [];
        arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
        arr.push("判断结果为：");
        arr.push(UE.getEditor('editor').hasContents());
        alert(arr.join("\n"));
    }
    function setFocus() {
        UE.getEditor('editor').focus();
    }
    function deleteEditor() {
        disableBtn();
        UE.getEditor('editor').destroy();
    }
    function disableBtn(str) {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            if (btn.id == str) {
                UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
            } else {
                btn.setAttribute("disabled", "true");
            }
        }
    }
    function enableBtn() {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
        }
    }

    function getLocalData () {
        alert(UE.getEditor('editor').execCommand( "getlocaldata" ));
    }

    function clearLocalData () {
        UE.getEditor('editor').execCommand( "clearlocaldata" );
        alert("已清空草稿箱")
    }
        var pasterMgr = new WordPasterManager();
    	pasterMgr.Config["PostUrl"] = "http://10.176.62.59:8080/display/upload.jsp"
    	pasterMgr.Config["Cookie"] = '<%=clientCookie%>';
    	pasterMgr.Load();//加载控件
		
	 	UE.getEditor('editor',{onready:function(){//创建一个编辑器实例
			 pasterMgr.SetEditor(this);
	 	}});
	</script>
</body>
</html>

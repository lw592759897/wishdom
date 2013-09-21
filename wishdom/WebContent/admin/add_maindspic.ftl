<!doctype html>
<html lang="zh">
<head>
<#assign contextPath = request.contextPath />
<script type="text/javascript" src="${contextPath}/plugins/lib/jquery/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="${contextPath}/plugins/ueditor/editor_config.js"></script>
<script type="text/javascript" src="${contextPath}/plugins/ueditor/editor_all.js"></script>
<link rel=stylesheet href="${contextPath}/plugins/ueditor/themes/default/css/ueditor.css">
<link rel="stylesheet" href="${contextPath}/plugins/alloy/build/aui-css/css/bootstrap.css">
<script src="${contextPath}/plugins/alloy/build/aui/aui.js"></script>
</head>
<body>
<div class="details">
	<table width="100%">
		<tr align="center">
			<td>
				<b style="font-size:16px">编辑首页国匠大师</b>
				<hr>
			</td>
		</tr>
		<tr>
			<td>
				<div width="100%">
					<script type="text/plain" id="editor"></script>
					<div class="con-split"></div>
				</div>
			</td>
		</tr> 
		<tr> 
			<td align="center">
				<button class="btn btn-info" onclick="submit()"/>提交内容</button>
				<button class="btn btn-info" onclick="setContent()"/>重置</button>
			</td>
		</tr>
	</table>
</div>

<script type="text/javascript">
      //实例化编辑器
    var ue = UE.getEditor('editor');
    var domUtils = UE.dom.domUtils;
    var hascontent;

    ue.addListener("ready", function () {
        ue.focus(true);
        <#if maindspic?has_content>
        	UE.getEditor('editor').setContent('${maindspic.CONTENT}');
        </#if>
    });
    function setContent() {
        <#if maindspic?has_content>
        	UE.getEditor('editor').setContent('${maindspic.CONTENT}');
        <#else>
        	UE.getEditor('editor').setContent('后台管理系统');
        </#if>
        setFocus();
    }
    function setFocus() {
        UE.getEditor('editor').focus();
    }
	function submit(){
		hascontent = UE.getEditor('editor').hasContents();
		if(hascontent==true){
			content = UE.getEditor('editor').getContent().replace(/<p>/g,'').replace(/<\/p>/g,'');
			$.post('${contextPath}/admin/update_maindspic.htm',{content:content},function(data){if(data=='success'){alert("保存成功");}else{alert("保存失败");}});
			return;
		}else{
			alert("请先填写首页国匠大师内容");
			return;
		}
	}
</script>
</body>
<html>
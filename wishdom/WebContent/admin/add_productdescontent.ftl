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
				<b style="font-size:16px">编辑产品描述</b>
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
				<button class="btn btn-info" onclick="goList()"/>返回产品列表</button>
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
        <#if productcontents?has_content>
        	UE.getEditor('editor').setContent('${productcontents.CONTENT}');
        </#if>
    });
    function setContent() {
        <#if productcontents?has_content>
        	UE.getEditor('editor').setContent('${productcontents.CONTENT}');
        <#else>
        	UE.getEditor('editor').setContent('后台管理系统');
        </#if>
        setFocus();
    }
    function setFocus() {
        UE.getEditor('editor').focus();
    }
    function goList() {
    	window.location.href='${contextPath}/admin/list_product.htm';
    }
	function submit(){
		hascontent = UE.getEditor('editor').hasContents();
		if(hascontent==true){
			content = UE.getEditor('editor').getContent();
			$.post('${contextPath}/admin/update_productdescontent.htm',{content:content,productId:'${productId}'},function(data){if(data=='success'){alert("保存成功");}else{alert("保存失败");}});
			return;
		}else{
			alert("请先填写产品的描述内容");
			return;
		}
	}
</script>
</body>
<html>
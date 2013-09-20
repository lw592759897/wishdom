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
	<form id="myForm">
	<table width="100%">
		<tr align="center">
			<td colspan="4">
				<b style="font-size:16px">新增产品</b>
				<hr>
			</td>
		</tr>
		<tr>
			<td align="right" width="100">产品ID:</td>
			<td width="400"><input type="text" id="productId" name="productId" class="field-required"/></td>
			<td align="right" width="100">产品名称:</td>
			<td><input type="text" id="productName" name="productName" class="field-required"/></td>
		</tr>
		<tr>
			<td align="right" width="100">产品分类:</td>
			<td width="400"><input type="text" id="productCatalog" name="productCatalog" class="field-required"/></td>
			<td colspan="2"></td>
		</tr>
		<tr>
			<td colspan="4">
				<div width="100%">
					<script type="text/plain" id="editor"></script>
					<div class="con-split"></div>
				</div>
			</td>
		</tr> 
		<tr> 
			<td align="center"  colspan="4">
				<button class="btn btn-info" onclick="submit()"/>提交内容</button>
				<button class="btn btn-info" onclick="setContent()"/>重置</button>
				<button class="btn btn-info" onclick="goList()"/>返回产品列表</button>
			</td>
		</tr>
	</table>
	</form>
</div>

<script type="text/javascript">
      //实例化编辑器
    var ue = UE.getEditor('editor');
    var domUtils = UE.dom.domUtils;
    var content;
    var txtcontent;
    var hascontent;
    var plainTxt;

    ue.addListener("ready", function () {
        ue.focus(true);
        UE.getEditor('editor').setContent('');
    });
    function getContent() {
        content = UE.getEditor('editor').getContent();
        alert(content);
    }
    function getPlainTxt() {
        plainTxt = UE.getEditor('editor').getPlainTxt();
    }
    function setContent() {
        UE.getEditor('editor').setContent('欢迎使用后台管理系统');
        setFocus();
    }
    function getContentTxt() {
		txtcontent = UE.getEditor('editor').getContentTxt();
    }
    function hasContent() {
        hascontent = UE.getEditor('editor').hasContents();
    }
    function setFocus() {
        UE.getEditor('editor').focus();
    }
    function goList() {
    	window.location.href='${contextPath}/admin/list_product.htm';
    }
    YUI().use(
	  'aui-form-validator',
	  function(Y) {
	   var rules = {
	      productId: {
	        required: true
	      },
	      productName: {
	        required: true
	      },
	      productCatalog: {
	        required: true
	      }
	    };
	
	    var fieldStrings = {
	      productId: {
	        required: '请输入产品ID.'
	      },
	      productName: {
	        required: '请输入产品名称.'
	      },
	      productCatalog: {
	        required: '请输入产品分类.'
	      }
	    };
	
	    new Y.FormValidator(
	      {
	        boundingBox: '#myForm',
	        fieldStrings: fieldStrings,
	        showAllMessages: true
	      }
	    );
	  }
	);
	function submit(){
		alert("----");
		if(hascontent){
			alert("true");
			return;
		}else{
			alert("false");
			return;
		}
	}
</script>
</body>
<html>
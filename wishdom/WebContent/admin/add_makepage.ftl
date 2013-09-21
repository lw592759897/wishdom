<!doctype html>
<html lang="zh">
<head>
<#assign contextPath = request.contextPath />
<script type="text/javascript" src="${contextPath}/plugins/lib/jquery/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="${contextPath}/script/jquery.form.js"></script>
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
			<td colspan="4">
				<#if makes?has_content>
					<b style="font-size:16px">修改工艺</b>
				<#else>
					<b style="font-size:16px">新增工艺</b>
				</#if>
				<hr>
			</td>
		</tr>
		<tr> 
			<td  colspan="4">
				<font color="red">注意:1、工艺描述相当于该工艺备注,便于后台维护和查看,无实际意义; 2、工艺展示序号为前台页面展示一个简单排序,请正确输入(非重复)数字。</font>
				<br>
			</td>
		</tr>
		<tr>
			<td align="right" width="150">工艺描述:</td>
			<td width="400"><input type="text" id="makeProductdes" name="makeProductdes" class="field-required" <#if makes?has_content><#if makes.MAKEPRODUCTDES?exists> value="${makes.MAKEPRODUCTDES!}"</#if></#if> /> *</td>
			<td align="right" width="150">工艺展示序号:</td>
			<td><input type="text" id="makeProductseq" name="makeProductseq" class="field-required" <#if makes?has_content><#if makes.MAKEPRODUCTSEQ?exists> value="${makes.MAKEPRODUCTSEQ!}"</#if></#if>/> </td>
		</tr>
		<tr>
			<td align="right" width="150">工艺页面展示图片:</td>
			<td width="400">
				<form action="${contextPath}/admin/upload_propic.htm" id="uploadform1" method="post" enctype="multipart/form-data">
					<input type="file" id="productimg" name="productimg" class="form-builder-field-node"/>
					<input type="hidden" id="makeproductimgurl" name="makeproductimgurl" value="<#if makes?has_content><#if makes.MAKEPRODUCTIMGURL?exists>${makes.MAKEPRODUCTIMGURL}</#if></#if>"/>
					<input type="button" class="btn btn-mini" value="上传" onclick="_upload1()"/>
				</form>
			</td>
			<td align="right">工艺页面内页图片:</td>
			<td>
				<form action="${contextPath}/admin/upload_propic.htm" id="uploadform2" method="post" enctype="multipart/form-data">
					<input type="file" id="productimg" name="productimg" class="form-builder-field-node"/>
					<input type="hidden" id="makeproductinnerimg" name="makeproductinnerimg" value="<#if makes?has_content><#if makes.MAKEPRODUCTINNERIMG?exists>${makes.MAKEPRODUCTINNERIMG}</#if></#if>"/>
					<input type="button" class="btn btn-mini" value="上传" onclick="_upload2()"/>
				</form>
				<script>
						function _upload1(){
							$("#uploadform1").ajaxSubmit({
								dataType:'text',
								success:function(msg){
									msg = eval("("+msg+")");
									if(msg.msg=='success'){
										alert("上传成功");
										$('#productImgShow1').attr('src','${contextPath}'+msg.url);
										$('#makeproductimgurl').val(msg.url);
									}else{
										alert("上传失败");
									}
								}
							});
						}
						function _upload2(){
							$("#uploadform2").ajaxSubmit({
								dataType:'text',
								success:function(msg){
									msg = eval("("+msg+")");
									if(msg.msg=='success'){
										alert("上传成功");
										$('#productImgShow2').attr('src','${contextPath}'+msg.url);
										$('#makeproductinnerimg').val(msg.url);
									}else{
										alert("上传失败");
									}
								}
							});
						}
				</script>
			</td>
		</tr>
		<tr> 
			<td align="center"  colspan="2">
				<#if makes?has_content>
					<#if makes.MAKEPRODUCTIMGURL?exists>
						<img src="${contextPath}${makes.MAKEPRODUCTIMGURL}" width="100" height="100" id="productImgShow1" name="productImgShow1"/>
					<#else>
						<img src="" width="100" height="100" id="productImgShow1" name="productImgShow1"/>
					</#if>
				<#else>
					<img src="" width="100" height="100" id="productImgShow1" name="productImgShow1"/>
				</#if>
			</td>
			<td align="center"  colspan="2">
				<#if makes?has_content>
					<#if makes.MAKEPRODUCTINNERIMG?exists>
						<img src="${contextPath}${makes.MAKEPRODUCTINNERIMG}" width="100" height="100" id="productImgShow2" name="productImgShow2"/>
					<#else>
						<img src="" width="100" height="100" id="productImgShow2" name="productImgShow2"/>
					</#if>
				<#else>
					<img src="" width="100" height="100" id="productImgShow2" name="productImgShow2"/>
				</#if>
			</td>
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
				<input class="btn btn-info" type="button" onclick="tj()" value="提交内容" />
				<input class="btn btn-info" type="button" onclick="goList()" value="返回工艺列表" />
			</td>
		</tr>
	</table>
</div>

<script type="text/javascript">
	var ue = UE.getEditor('editor');
    var domUtils = UE.dom.domUtils;
    var hascontent;

    ue.addListener("ready", function () {
        ue.focus(true);
        <#if makes?has_content>
        	<#if makes.MAKEPRODUCTINNERCONTENT?has_content>
        		UE.getEditor('editor').setContent('${makes.MAKEPRODUCTINNERCONTENT}');
        	</#if>
        </#if>
    });
    function setContent() {
        <#if makes?has_content>
        	<#if makes.MAKEPRODUCTINNERCONTENT?has_content>
        		UE.getEditor('editor').setContent('${makes.MAKEPRODUCTINNERCONTENT}');
        	</#if>
        <#else>
        	UE.getEditor('editor').setContent('后台管理系统');
        </#if>
        setFocus();
    }
    function setFocus() {
        UE.getEditor('editor').focus();
    }

    function goList() {
    	window.location.href='${contextPath}/admin/list_makepage.htm';
    }
    
	function tj(){
		if($("#makeProductdes").val()==null || $("#makeProductdes").val() == ""){
			alert("工艺描述不能为空");
			return;
		}
		hascontent = UE.getEditor('editor').hasContents();
		if(hascontent==true){
			content = UE.getEditor('editor').getContent();
			$.ajax({
				type: "POST",
				url:'${contextPath}/admin/update_makepage.htm',
				dataType: 'text',
				success: function(data){if(data=="success"){<#if makes?has_content>alert("修改成功");<#else>alert("添加成功");</#if>}else{<#if makes?has_content>alert("修改失败");<#else>alert("添加失败");</#if>}},
				data:{
					<#if makes?has_content>
						<#if makes.MAKEPRODUCTID?has_content>
							makeproductid:'${makes.MAKEPRODUCTID}',
						</#if>
					</#if>
					makeProductdes:$("#makeProductdes").val(),
					makeProductseq:$("#makeProductseq").val(),
					content:content,
					makeproductinnerimg:$("#makeproductinnerimg").val(),
					makeproductimgurl:$('#makeproductimgurl').val()
				}
			});
		}else{
			alert('添加工艺内页描述');
			return;
		}
	}
</script>
</body>
<html>
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
				<#if product?has_content>
					<b style="font-size:16px">修改产品</b>
				<#else>
					<b style="font-size:16px">新增产品</b>
				</#if>
				<hr>
			</td>
		</tr>
		<tr> 
			<td  colspan="4">
				<font color="red">注意:1、产品id和产品名称为必填项; 2、产品图片选择完成,点击上传以后,请记得提交修改产品。</font>
				<br>
			</td>
		</tr>
		<tr>
			<td align="right" width="100">产品ID:</td>
			<td width="400"><input type="text" id="productId" name="productId" class="field-required" <#if product?has_content><#if product.PRODUCTID?exists>readonly="true" value="${product.PRODUCTID!}"</#if></#if> /> *</td>
			<td align="right" width="100">产品名称:</td>
			<td><input type="text" id="productName" name="productName" class="field-required" <#if product?has_content><#if product.PRODUCTNAME?exists> value="${product.PRODUCTNAME!}"</#if></#if>/> *</td>
		</tr>
		<tr>
			<td align="right" width="100">产品分类:</td>
			<td width="400">
			<#--<input type="text" id="productCatalog" name="productCatalog" class="field-required" <#if product?has_content><#if product.PRODUCTCATALOG?exists> value="${product.PRODUCTCATALOG!}"</#if></#if>/>-->
				<select id="productCatalog" class="form-builder-field-node" name="productCatalog">
						<option value="1" <#if product?has_content><#if product.PRODUCTCATALOG?exists><#if product.PRODUCTCATALOG=='1'>selected="true"</#if></#if></#if>>贵金属</option>
						<option value="2" <#if product?has_content><#if product.PRODUCTCATALOG?exists><#if product.PRODUCTCATALOG=='2'>selected="true"</#if></#if></#if>>钟表</option>
						<option value="3" <#if product?has_content><#if product.PRODUCTCATALOG?exists><#if product.PRODUCTCATALOG=='3'>selected="true"</#if></#if></#if>>景泰蓝</option>
				</select>
			</td>
			<td align="right">产品编号:</td>
			<td><input type="text" id="productNumber" name="productNumber" <#if product?has_content><#if product.PRODUCTNUMBER?exists> value="${product.PRODUCTNUMBER!}"</#if></#if>/></td>
		</tr>
		<tr>
			<td align="right" width="100">前台展示:</td>
			<td width="400">
				<select id="productshow" class="form-builder-field-node" name="productshow">
						<option value="Y" <#if product?has_content><#if product.PRODUCTSHOW?exists><#if product.PRODUCTSHOW=='Y'>selected="true"</#if></#if></#if>>Y</option>
						<option value="N" <#if product?has_content><#if product.PRODUCTSHOW?exists><#if product.PRODUCTSHOW=='N'>selected="true"</#if></#if></#if>>N</option>
				</select>
			</td>
			<td align="right">置顶展示:</td>
			<td><select id="productshowhead" class="form-builder-field-node" name="productshowhead">
					<option value="N" <#if product?has_content><#if product.PRODUCTSHOWHEAD?exists><#if product.PRODUCTSHOWHEAD=='N'>selected="true"</#if></#if></#if>>N</option>
					<option value="Y" <#if product?has_content><#if product.PRODUCTSHOWHEAD?exists><#if product.PRODUCTSHOWHEAD=='Y'>selected="true"</#if></#if></#if>>Y</option>
				</select>
			</td>
		</tr>
		<tr>
			<td align="right" width="100">产品规格:</td>
			<td width="400">
				<input type="text" id="productDes" name="productDes" <#if product?has_content><#if product.PRODUCTDES?exists>value = '${product.PRODUCTDES!}'</#if></#if>/> 
			</td>
			<td align="right">分类页图片:</td>
			<td>
				<form action="${contextPath}/admin/upload_propic.htm" id="uploadform" method="post" enctype="multipart/form-data">
					<input type="file" id="productimg" name="productimg" class="form-builder-field-node"/>
					<input type="hidden" id="productToid" name="productToid" value="<#if product?has_content><#if product.PRODUCTIMG?exists>${product.PRODUCTIMG}</#if></#if>"/>
					<input type="button" class="btn btn-mini" value="上传" onclick="_upload()"/>
				</form>
				<script>
						function _upload(){
							$("#uploadform").ajaxSubmit({
								dataType:'text',
								success:function(msg){
									msg = eval("("+msg+")");
									if(msg.msg=='success'){
										alert("上传成功");
										$('#productImgShow').attr('src','${contextPath}'+msg.url);
										$('#productToid').val(msg.url);
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
			<td align="right"  colspan="3">
				<#if product?has_content>
					<#if product.PRODUCTIMG?exists>
						<img src="${contextPath}${product.PRODUCTIMG}" width="100" height="100" id="productImgShow" name="productImgShow"/>
					<#else>
						<img src="" width="100" height="100" id="productImgShow" name="productImgShow"/>
					</#if>
				<#else>
					<img src="" width="100" height="100" id="productImgShow" name="productImgShow"/>
				</#if>
			</td>
			<td>
			</td>
		</tr>
		<tr> 
			<td align="center"  colspan="4">
				<input class="btn btn-info" type="button" onclick="tj()" value="提交内容" />
				<input class="btn btn-info" type="button" onclick="goList()" value="返回产品列表" />
			</td>
		</tr>
	</table>
</div>

<script type="text/javascript">
    function goList() {
    	window.location.href='${contextPath}/admin/list_product.htm';
    }
    
	function tj(){
		if($("#productId").val()==null || $("#productId").val() == ""){
			alert("产品id不能为空");
			return;
		}
		if($("#productName").val()==null || $("#productName").val() == ""){
			alert("产品名称不能为空");
			return;
		}
		$.ajax({
			type: "POST",
			url:'${contextPath}/admin/update_product.htm',
			dataType: 'text',
			success: function(data){if(data=="success"){<#if product?has_content>alert("修改成功");<#else>alert("添加成功");</#if>}else{<#if product?has_content>alert("修改失败");<#else>alert("添加失败");</#if>}},
			data:{
				productId:$("#productId").val(),
				productName:$("#productName").val(),
				productCatalog:$("#productCatalog").val(),
				productNumber:$("#productNumber").val(),
				productshow:$("#productshow").val(),
				productshowhead:$("#productshowhead").val(),
				productDes:$("#productDes").val(),
				productToid:$("#productToid").val(),
			}
		});
	}
</script>
</body>
<html>
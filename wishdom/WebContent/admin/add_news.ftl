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
			<td colspan="4">
				<#if news?has_content>
					<b style="font-size:16px">编辑消息内容</b>
				<#else>
					<b style="font-size:16px">新增消息</b>
				</#if>
				<hr>
			</td>
		</tr>
		<tr>
			<td align="right" width="100">消息标题:</td>
			<td width="400">
			<input type="hidden" id="newsid" name="newsid" <#if news?has_content><#if news.NEWSID?exists> value="${news.NEWSID!}"</#if></#if> />
			<input type="text" id="newstitle" name="newstitle" <#if news?has_content><#if news.NEWSTITLE?exists> value="${news.NEWSTITLE!}"</#if></#if> /> *</td>
			<td align="right" width="100">消息关键字:</td>
			<td><input type="text" id="newsKeywords" name="newsKeywords" <#if news?has_content><#if news.NEWSKEYWORDS?exists> value="${news.NEWSKEYWORDS!}"</#if></#if>/></td>
		</tr>
		<tr>
			<td align="right" width="100">前台展示:</td>
			<td width="400">
				<select id="newsshow" class="form-builder-field-node" name="newsshow">
						<option value="Y" <#if news?has_content><#if news.NEWSSHOW?exists><#if news.NEWSSHOW=='Y'>selected="true"</#if></#if></#if>>Y</option>
						<option value="N" <#if news?has_content><#if news.NEWSSHOW?exists><#if news.NEWSSHOW=='N'>selected="true"</#if></#if></#if>>N</option>
				</select>
			</td>
			<td align="right">置顶展示:</td>
			<td><select id="newsheadshow" class="form-builder-field-node" name="newsheadshow">
					<option value="N" <#if news?has_content><#if news.NEWSHEADSHOW?exists><#if news.NEWSHEADSHOW=='N'>selected="true"</#if></#if></#if>>N</option>
					<option value="Y" <#if news?has_content><#if news.NEWSHEADSHOW?exists><#if news.NEWSHEADSHOW=='Y'>selected="true"</#if></#if></#if>>Y</option>
				</select>
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
			<td align="center" colspan="4">
				<button class="btn btn-info" onclick="submit()"/>提交内容</button>
				<button class="btn btn-info" onclick="setContent()"/>重置</button>
				<button class="btn btn-info" onclick="goList()"/>返回消息列表</button>
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
        <#if newscontent?has_content>
        	UE.getEditor('editor').setContent('${newscontent.CONTENT}');
        </#if>
    });
    function setContent() {
        <#if newscontent?has_content>
        	UE.getEditor('editor').setContent('${newscontent.CONTENT}');
        <#else>
        	UE.getEditor('editor').setContent('后台管理系统');
        </#if>
        setFocus();
    }
    function setFocus() {
        UE.getEditor('editor').focus();
    }
    function goList() {
    	window.location.href='${contextPath}/admin/list_news.htm';
    }
	function submit(){
		if($("#newstitle").val()==null && $("#newstitle").val()==""){
			alert("消息标题不能为空");
		}
		hascontent = UE.getEditor('editor').hasContents();
		if(hascontent==true){
			content = UE.getEditor('editor').getContent();
			$.post('${contextPath}/admin/update_news.htm',
				{content:content,
				 <#if news?has_content>
				 	<#if news.NEWSID?has_content>
				 		newsId:'${news.NEWSID}',
				 	</#if>
				 </#if>
				 newstitle:$("#newstitle").val(),
				 newsKeywords:$("#newsKeywords").val(),
				 newsshow:$("#newsshow").val(),
				 newsheadshow:$("#newsheadshow").val()
				},function(data){if(data=='success'){alert("保存成功"); goList();}else{alert("保存失败");}});
			return;
		}else{
			alert("请先填写消息内容");
			return;
		}
	}
</script>
</body>
<html>
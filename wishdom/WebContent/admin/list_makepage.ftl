<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<#assign contextPath = request.contextPath />
<head>
    <link href="${contextPath}/plugins/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath}/plugins/lib/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath}/plugins/lib/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />
    <script src="${contextPath}/plugins/lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script> 
    <script src="${contextPath}/plugins/lib/ligerUI/js/core/base.js" type="text/javascript"></script> 
    <script src="${contextPath}/plugins/lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script>
    <script src="${contextPath}/plugins/lib/ligerUI/js/plugins/ligerToolBar.js" type="text/javascript"></script>
    <script src="${contextPath}/plugins/lib/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>
    <script src="${contextPath}/plugins/lib/ligerUI/js/plugins/ligerCheckBox.js" type="text/javascript"></script>
    <script type="text/javascript">
        function _upd(){
        	if(g.getSelectedRow()){
	     		makeId = g.getSelectedRow().MAKEPRODUCTID;
	     		window.location.href='${contextPath}/admin/add_makepage.htm?makeId='+makeId;
     		}else{
     			alert('请选择要修改的工艺制作信息!');
     			return;
     		}
        }
        function _add(){
            window.location.href='${contextPath}/admin/add_makepage.htm';
        }
        function _del(){
        	if(g.getSelectedRow()){
	     		makeId = g.getSelectedRow().MAKEPRODUCTID;
     		}else{
     			alert('请选择要删除的工艺记录!');
     			return;
     		}
        	if(confirm("确定要删除该工艺吗？删除将不能恢复！")){
        		$.post('${contextPath}/admin/del_makepage.htm',{makeId:makeId},function(data){if(data=="success"){ g.deleteSelectedRow();}else{alert("删除失败!");}});
        	}
        }
        $(function () {
        	<#if makelist?has_content> 
        		var data = ${makelist!};
        	<#else>
        		var data;
        	</#if>
            window['g'] =
            $("#maingrid").ligerGrid({
                height:'450px',
                columns: [
	                { display: '工艺展示序号', name: 'MAKEPRODUCTSEQ', align: 'right', width: 100, minWidth: 60 },
	                { display: '工艺展示描述', name: 'MAKEPRODUCTDES', minWidth: 80 }
                ], data: data, pageSize:20, rownumbers:true, isScroll: false,
                toolbar:{ items: [
		                	{ text: '增加', click: _add, icon: 'add'},
		                	{ text: '修改', click: _upd, icon: 'modify'},
		                	{ text: '删除', click: _del, img: '${contextPath}/plugins/lib/ligerUI/skins/icons/delete.gif'}
					]
				}
            });
            $("#pageloading").hide();
        });
    </script>
</head>
<body style="overflow-x:hidden; padding:2px;">
	<b style="font-size:16px">消息列表</b>
	<hr>
	<div class="l-loading" style="display:block" id="pageloading"></div>
	<a class="l-button" style="width:120px; float:left; margin-left:10px; display:none;" onclick="deleteRow()">删除选择的行</a>
	<div class="l-clear"></div>
	<div id="maingrid"></div>
	<div style="display:none;"></div>
</body>
</html>
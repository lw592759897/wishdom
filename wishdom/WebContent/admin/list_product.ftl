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
	     		productId = g.getSelectedRow().PRODUCTID;
	     		window.location.href='${contextPath}/admin/add_product.htm?productId='+productId;
     		}else{
     			alert('请选择要修改的产品!');
     			return;
     		}
        }
        function _add(){
            window.location.href='${contextPath}/admin/add_product.htm';
        }
        function _del(){
        	if(g.getSelectedRow()){
	     		productId = g.getSelectedRow().PRODUCTID;
     		}else{
     			alert('请选择要删除的产品!');
     			return;
     		}
        	if(confirm("确定要删除该产品吗？删除将不能恢复！")){
        		$.post('${contextPath}/admin/del_product.htm',{productId:productId},function(data){if(data=="success"){ g.deleteSelectedRow();}else{alert("删除失败!");}});
        	}
        }
        $(function () {
        	<#if products?has_content> 
        		var data = ${products!};
        	<#else>
        		var data;
        	</#if>
            window['g'] =
            $("#maingrid").ligerGrid({
                height:'450px',
                columns: [
	                { display: '产品ID', name: 'PRODUCTID', align: 'right', width: 100, minWidth: 60 },
	                { display: '产品名称', name: 'PRODUCTNAME', minWidth: 80 },
	                { display: '产品分类', name: 'PRODUCTCATALOG', minWidth: 40, render: function(item){if(item.PRODUCTCATALOG=='1'){return '贵金属'}else if(item.PRODUCTCATALOG=='2'){return '钟表'}else if(item.PRODUCTCATALOG=='3'){return '景泰蓝'}else{return '未知分类'}}},
	                //{ display: '产品图片', name: 'PRODUCTPIC', minWidth: 40 },
	                { display: '前台展示', name: 'PRODUCTSHOW', minWidth: 20 },
	                { display: '置顶展示', name: 'PRODUCTSHOWHEAD', minWidth: 20 },
	                { display: '内容', minWidth: 40, render: function(item){return '<a href="${contextPath}/admin/add_productcontent.htm?productId='+ item.PRODUCTID +'">编辑图片内容</a> <a href="${contextPath}/admin/add_productdescontent.htm?productId='+ item.PRODUCTID +'">编辑描述内容</a>';}}
	               // { display: '产品描述', name: 'PRODUCTDES'}
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
	<b style="font-size:16px">产品列表</b>
	<hr>
	<div class="l-loading" style="display:block" id="pageloading"></div>
	<a class="l-button" style="width:120px; float:left; margin-left:10px; display:none;" onclick="deleteRow()">删除选择的行</a>
	<div class="l-clear"></div>
	<div id="maingrid"></div>
	<div style="display:none;"></div>
</body>
</html>
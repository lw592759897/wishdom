<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<#assign contextPath = request.contextPath />
<head>
    <title></title>
    <link href="${contextPath!}/plugins/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" /> 
    <script src="${contextPath!}/plugins/lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="${contextPath!}/plugins/lib/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="${contextPath!}/plugins/lib/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>
    <script src="${contextPath!}/plugins/lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
    <script src="${contextPath!}/plugins/lib/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>
    <style type="text/css">
        .l-case-title
        {
            font-weight: bold;
            margin-top: 20px;
            margin-bottom: 20px;
        }
        body, html
        {
            width: 100%;
            height: 100%;
        }
        *
        {
            margin: 0;
            padding: 0;
        }
        #winlinks
        {
            position: absolute;
            left: 20px;
            top: 20px;
            width: 100%;
        }
        #winlinks ul
        {
            position: relative;
        }
        #winlinks li
        {
            width: 70px;
            cursor: pointer;
            height: 80px;
            position: absolute;
            z-index: 101;
            list-style: none;
            text-align: center;
        }
        #winlinks li img
        {
            width: 36px;
            height: 36px;
        }
        #winlinks li span
        {
            background: none repeat scroll 0 0 rgba(0, 0, 0, 0.3);
            border-radius: 10px 10px 10px 10px;
            display: block;
            font-size: 12px;
            margin-top: 1px;
            color: White;
            line-height: 18px;
            text-align: center;
        }
        #winlinks li.l-over div.bg
        {
            display: block;
        }
        #winlinks li div.bg
        {
            display: none;
            position: absolute;
            top: -2px;
            left: -2px;
            z-index: 0;
            width: 75px;
            height: 64px;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            background: #000;
            opacity: 0.1;
            filter: alpha(opacity=10);
        }
        .l-taskbar-task-icon
        {
            top: 3px; left: 6px; background-image:none;
        } 
        .l-taskbar-task-content{ margin-left:30px;}
        .l-taskbar-task-icon img
        {
            width: 22px;
            height: 22px;
        }
    </style>
</head>
<body style="overflow: hidden; background: url(images/applebg.jpg) no-repeat  center center;">
    <div id="winlinks">
        <ul>
        </ul>
    </div>
</body>
<script type="text/javascript">
    var LINKWIDTH = 90, LINKHEIGHT = 90, TASKBARHEIGHT = 43;
    var winlinksul =  $("#winlinks ul");
    function f_open(url, title, icon) {
        var win = $.ligerDialog.open(
        { height: 600, url: url, width: 1050, showMax: true, showToggle: true, showMin: true, isResize: true, modal: false, title: title, slide: false//, buttons: [
           // { text: '确定', onclick: function (item, Dialog, index) {
               // win.hide();
           // }
            //}
        //]
        });
        var task = jQuery.ligerui.win.tasks[win.id];
        if (task) {
            $(".l-taskbar-task-icon:first", task).html('<img src="' + icon + '" />');
        }
        return win;
    }
    var links = [
            { icon: 'images/3DSMAX.png', title: '发布新产品', url: '${contextPath!}/admin/list_product.htm'},
            { icon: 'images/3DSMAX.png', title: '发布资讯', url: '${contextPath!}/admin/list_news.htm'},
            { icon: 'images/Xp-G5 006.png', title: '定制页显示', url: '${contextPath!}/admin/add_commission.htm'},
            { icon: 'images/Alien Folder.png', title: '公司介绍', url: '${contextPath!}/admin/add_company.htm'},
            { icon: 'images/Alien Folder.png', title: '国匠文化', url: '${contextPath!}/admin/add_cultural.htm'},
            { icon: 'images/Program Files Folder.png', title: '修改大师', url: '${contextPath!}/admin/add_master.htm'},
            { icon: 'images/Program Files Folder.png', title: '首页艺术品定制', url: '${contextPath!}/admin/add_mainyspdz.htm'},
            { icon: 'images/Alien Folder.png', title: '首页大图修改', url: '${contextPath!}/admin/add_homebigpicture.htm'},
            { icon: 'images/Xp-G5 006.png', title: '首页大师图片', url: '${contextPath!}/admin/add_maindspic.htm'},
            { icon: 'images/Xp-G5 006.png', title: '首页关于国匠', url: '${contextPath!}/admin/add_maingj.htm'},
            { icon: 'images/Alien Folder.png', title: '首页制作工艺', url: '${contextPath!}/admin/add_mainmake.htm'},
            { icon: 'images/Alien Folder.png', title: '制作工艺', url: '${contextPath!}/admin/list_makepage.htm'}
        ];
             
    function onResize() {
        var linksHeight = $(window).height() - TASKBARHEIGHT;
        var winlinks = $("#winlinks");
        winlinks.height(linksHeight);
        var colMaxNumber = parseInt(linksHeight / LINKHEIGHT);//一列最多显示几个快捷方式
        for (var i = 0, l = links.length; i < l; i++) {
            var link = links[i];
            var jlink = $("li[linkindex=" + i + "]", winlinks);
            var top = (i % colMaxNumber) * LINKHEIGHT, left = parseInt(i / colMaxNumber) * LINKWIDTH;
            if (isNaN(top) || isNaN(left)) continue;
            jlink.css({ top: top, left: left });
        }

    }
    function linksInit() {
        for (var i = 0, l = links.length; i < l; i++) {
            var link = links[i];
            var jlink;
            var jlink = $("<li></li>");
            jlink.attr("linkindex", i);
            jlink.append("<img src='" + link.icon + "' />");
            jlink.append("<span>" + link.title + "</span>");
            jlink.append("<div class='bg'></div>");
            jlink.hover(function () {
                $(this).addClass("l-over");
            }, function () {
                $(this).removeClass("l-over");
            }).click(function () {
                var linkindex = $(this).attr("linkindex");
                var link = links[linkindex];
                f_open(link.url, link.title, link.icon);
            });
            jlink.appendTo(winlinksul);
        }

    }

    $(window).resize(onResize);
    $.ligerui.win.removeTaskbar = function () { }; //不允许移除
    $.ligerui.win.createTaskbar(); //页面加载时创建任务栏

    linksInit();
    onResize();

</script>
</html>

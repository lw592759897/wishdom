<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>智慧金</title>
<#assign contextPath = request.contextPath />
<link href="style/style.css" rel="stylesheet"/> 
</head>
<script>
window.onload=function(){
	function $(id){return document.getElementById(id);};
	$('about').onmouseover=function(){$('div-a-about').style.display='block';};$('about').onmouseout=function(){$('div-a-about').style.display='none';};$('art').onmouseover=function(){$('div-a-art').style.display='block';};$('art').onmouseout=function(){$('div-a-art').style.display='none';};
};
</script>
<div class="index-top other-top">
	<div class="box">
		<h1 class="logo"></h1>
        <div class="box-nav-other">
            <ul class="nav">
                <li><a href="${contextPath!}/index.htm" title="首页" class="a-index"></a></li>
                <li id="about">
                    <a href="${contextPath!}/cominfo.htm" title="关于国匠" class="a-about"></a>
                    <div class="div-a-about" id="div-a-about">
                        <a href="${contextPath!}/cominfo.htm" title="公司简介">公司简介</a>
                        <a href="${contextPath!}/news.htm" title="最新资讯">最新资讯</a>
                        <a href="${contextPath!}/gjwh.htm" title="国匠文化">国匠文化</a>
                    </div>
                </li>
                <li><a href="${contextPath!}/gjds.htm" title="国匠大师" class="a-master"></a></li>
                <li><a href="${contextPath!}/zzgy.htm" title="制作工艺" class="a-craft"></a></li>
                <li id="art">
                    <a href="${contextPath!}/pdshow.htm?catalogId=1" title="国匠艺术品" class="a-art"></a>
                    <div class="div-a-about div-a-art" id="div-a-art">
                        <a href="${contextPath!}/pdshow.htm?catalogId=1" title="贵金属">贵金属</a>
                        <a href="${contextPath!}/pdshow.htm?catalogId=2" title="钟表">钟&nbsp;&nbsp;&nbsp;表</a>
                        <a href="${contextPath!}/pdshow.htm?catalogId=3" title="景泰蓝">景泰蓝</a>
                    </div>
                </li>
                <li class="com com-nav">
                    <em></em>
                    <a href="#" title="联系我们" class="a-com"></a>
                    <div class="search clearfix">
                        <span class="s-span1"></span>
                        <input name="" type="text" class="input-text">
                        <a href="#" class="a-bg-search"></a>
                        <span class="s-span2"></span>
                        <a href="#" title="搜索" class="a-search"></a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
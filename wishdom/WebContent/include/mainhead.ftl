<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<title>智慧金</title>
	<link href="./style/style.css" rel="stylesheet"/>
	</head>
<body>
<div class="index-top">
	<h1 class="logo">
    	<a href="#" title=""></a>
    </h1>
    <ul class="index-top-ul">
    	<li><a href="#" title="贵金属">贵金属</a></li>
        <li><a href="#" title="钟表">钟表</a></li>
        <li><a href="#" title="景泰蓝">景泰蓝</a></li>
    </ul>
</div>
<!-- index-top over -->
<script src="./script/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {$(".num-div").show();$(".num-div a:first").addClass("active");var imageWidth = $(".window").width();var imageSum = $(".box-pic img").size();var imageReelWidth = imageWidth * imageSum;$(".box-pic").css({'width' : imageReelWidth});rotate = function(){var triggerID = $active.attr("rel") - 1;var image_reelPosition = triggerID * imageWidth;$(".num-div a").removeClass('active');$active.addClass('active');$(".box-pic").animate({left: -image_reelPosition},500);};rotateSwitch = function(){play = setInterval(function(){$active = $('.num-div a.active').next();if ( $active.length === 0){$active = $('.num-div a:first');}rotate();},5000);};rotateSwitch();$(".box-pic a").hover(function(){clearInterval(play);},function(){rotateSwitch();});$(".num-div a").click(function(){	$active = $(this);clearInterval(play);rotate();rotateSwitch();return false;});});
</script>
<div class="box index-pic">
	<div class="window">
        <div class="box-pic">
            <a href="#"><img src="images/pic-index1.jpg"/></a>
            <a href="#"><img src="images/pic-index1.jpg"/></a>
            <a href="#"><img src="images/pic-index1.jpg"/></a>
            <a href="#"><img src="images/pic-index1.jpg"/></a>
            <a href="#"><img src="images/pic-index1.jpg"/></a>
            <a href="#"><img src="images/pic-index1.jpg"/></a>
            <a href="#"><img src="images/pic-index1.jpg"/></a>
            <a href="#"><img src="images/pic-index1.jpg"/></a>
            <a href="#"><img src="images/pic-index1.jpg"/></a>
            <a href="#"><img src="images/pic-index1.jpg"/></a>
        </div>
    </div>
    <div class="num-div">
    	<a href="#"rel="1"></a>
        <a href="#"rel="2"></a>
        <a href="#"rel="3"></a>
        <a href="#"rel="4"></a>
        <a href="#"rel="5"></a>
        <a href="#"rel="6"></a>
        <a href="#"rel="7"></a>
        <a href="#"rel="8"></a>
        <a href="#"rel="9"></a>
        <a href="#"rel="10"></a> 
    </div>
</div>
<!-- index-pic over -->
<script>
window.onload=function(){
	function $(id){return document.getElementById(id);};
	$('about').onmouseover=function(){$('div-a-about').style.display='block';};$('about').onmouseout=function(){$('div-a-about').style.display='none';};$('art').onmouseover=function(){$('div-a-art').style.display='block';};$('art').onmouseout=function(){$('div-a-art').style.display='none';};var scrollY = document.documentElement.scrollTop || document.body.scrollTop;var veiwHeight = document.documentElement.clientHeight;$('return').style.top=veiwHeight + scrollY -240 + 'px';$('return-up').onclick=function(){	startMoveScroll(0);$('return-down').style.display='block';$('return-down2').style.display=$('return-down3').style.display=$('return-down4').style.display='none';};$('return-down').onclick=function(){startMoveScroll(800);$('return-down').style.display='none';$('return-down2').style.display='block';};$('return-down2').onclick=function(){startMoveScroll(1550);$('return-down2').style.display='none';$('return-down3').style.display='block';};$('return-down3').onclick=function(){startMoveScroll(2150);$('return-down3').style.display='none';$('return-down4').style.display='block';};$('return-down4').onclick=function(){startMoveScroll(2800);};
};
var timer = null;
function startMoveScroll(iTarget){clearInterval(timer);timer = setInterval(function(){var bBtn = true;var scrollY = document.documentElement.scrollTop || document.body.scrollTop;var iSpeed = (iTarget - scrollY)/6;	iSpeed = Math.floor(iSpeed);if(scrollY != iTarget){bBtn = false;}document.documentElement.scrollTop = document.body.scrollTop = scrollY + iSpeed;window.onscroll = function(){if(bBtn){clearInterval(timer);}	else{bBtn = true;}}},30);
}
</script>
<div class="box box-nav">
    <div class="nav index-nav">
        <ul class="clearfix">
            <li class="com">
                <em></em>
                <a href="#" title="联系我们" class="a-com"></a>
            </li>
            <li><a href="#" title="首页" class="a-index"></a></li>
            <li id="about">
            	<a href="#" title="关于国匠" class="a-about"></a>
            	<div class="div-a-about" id="div-a-about">
                	<a href="#" title="公司简介">公司简介</a>
                    <a href="#" title="最新资讯">最新资讯</a>
                    <a href="#" title="国匠文化">国匠文化</a>
                </div>
            </li>
            <li><a href="#" title="国匠大师" class="a-master"></a></li>
            <li><a href="#" title="制作工艺" class="a-craft"></a></li>
            <li id="art">
            	<a href="#" title="国匠艺术品" class="a-art"></a>
                <div class="div-a-about div-a-art" id="div-a-art">
                	<a href="#" title="贵金属">贵金属</a>
                    <a href="#" title="钟表">钟&nbsp;&nbsp;&nbsp;表</a>
                    <a href="#" title="景泰蓝">景泰蓝</a>
                </div>
            </li>
            <li>
            	<div class="search clearfix">
                	<span class="s-span1"></span>
                	<input name="" type="text" class="input-text">
                    <a href="#" class="a-bg-search"></a>
                    <span class="s-span2"></span>
                </div>
                <a href="#" title="搜索" class="a-search"></a>
            </li>
        </ul>
    </div>
</div>
<!-- nav over -->
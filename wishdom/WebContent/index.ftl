<#include "include/mainhead.ftl">
<script>
window.onload=function(){
	function $(id){return document.getElementById(id);};
	$('about').onmouseover=function(){$('div-a-about').style.display='block';};$('about').onmouseout=function(){$('div-a-about').style.display='none';};$('art').onmouseover=function(){$('div-a-art').style.display='block';};$('art').onmouseout=function(){$('div-a-art').style.display='none';};var scrollY = document.documentElement.scrollTop || document.body.scrollTop;var veiwHeight = document.documentElement.clientHeight;$('return').style.top=veiwHeight + scrollY -240 + 'px';$('return-up').onclick=function(){	startMoveScroll(0);$('return-down').style.display='block';$('return-down2').style.display=$('return-down3').style.display=$('return-down4').style.display='none';};$('return-down').onclick=function(){startMoveScroll(800);$('return-down').style.display='none';$('return-down2').style.display='block';};$('return-down2').onclick=function(){startMoveScroll(1550);$('return-down2').style.display='none';$('return-down3').style.display='block';};$('return-down3').onclick=function(){startMoveScroll(2150);$('return-down3').style.display='none';$('return-down4').style.display='block';};$('return-down4').onclick=function(){startMoveScroll(2800);};
};
var timer = null;
function startMoveScroll(iTarget){clearInterval(timer);timer = setInterval(function(){var bBtn = true;var scrollY = document.documentElement.scrollTop || document.body.scrollTop;var iSpeed = (iTarget - scrollY)/6;	iSpeed = Math.floor(iSpeed);if(scrollY != iTarget){bBtn = false;}document.documentElement.scrollTop = document.body.scrollTop = scrollY + iSpeed;window.onscroll = function(){if(bBtn){clearInterval(timer);}	else{bBtn = true;}}},30);
}
</script>
<h3 class="title-master"></h3>
<div class="box">
    <ul class="list-master clearfix">
        <li>
            <a href="#"><img src="images/pic01.jpg" width="240" height="290"/></a>
            <h4><a href="#">中国工艺美术大师</a></h4>
            <h5><a href="#">米振雄</a></h5>
        </li>
        <li>
            <a href="#"><img src="images/pic01.jpg" width="240" height="290"/></a>
            <h4><a href="#">中国工艺美术大师</a></h4>
            <h5><a href="#">米振雄</a></h5>
        </li>
        <li>
            <a href="#"><img src="images/pic01.jpg" width="240" height="290"/></a>
            <h4><a href="#">中国工艺美术大师</a></h4>
            <h5><a href="#">米振雄</a></h5>
        </li>
        <li>
            <a href="#"><img src="images/pic01.jpg" width="240" height="290"/></a>
            <h4><a href="#">中国工艺美术大师</a></h4>
            <h5><a href="#">米振雄</a></h5>
        </li>
        <li>
            <a href="#"><img src="images/pic01.jpg" width="240" height="290"/></a>
            <h4><a href="#">中国工艺美术大师</a></h4>
            <h5><a href="#">米振雄</a></h5>
        </li>
    </ul>
</div>
<!--master over -->

<div class="about-master">
	<div class="box">
    	<h3 class="h3-about-master" title="关于国匠"></h3>
        <div class="box-list-about">
            <ul class="list-about-masrter clearfix">
                <li>
                    <a href="#" class="a-img-master"></a>
                    <h5>
                        <a href="#">标题标题标题标题</a>
                        <span>2013-01-01</span>
                    </h5>
                    <p>关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠<a href="#" class="more">More</a></p>
                    <h4><img src="images/pic-about1.png"/></h4>
                </li>
                <li>
                    <a href="#" class="a-img-master"></a>
                    <h5>
                        <a href="#">标题标题标题标题</a>
                        <span>2013-01-01</span>
                    </h5>
                    <p>关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠<a href="#" class="more">More</a></p>
                    <h4><img src="images/pic-about2.png"/></h4>
                </li>
                <li>
                    <a href="#" class="a-img-master"></a>
                    <h5>
                        <a href="#">标题标题标题标题</a>
                        <span>2013-01-01</span>
                    </h5>
                    <p>关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠关于国匠<a href="#" class="more">More</a></p>
                    <h4><img src="images/pic-about3.png"/></h4>
                </li>
            </ul>
        </div>
    </div>
</div>
<!-- about-master over -->

<h3 class="title-customize"></h3>
<div class="box box-hidden">
	<div class="box-customize clearfix">
    	<div class="pic-customize">
        	<a href="#"><img src="images/img-customize1.png"/></a>
            <h4><a href="#" title="贵金属"><img src="images/title-customize1.png"/></a></h4>
        </div>
        <div class="pic-customize">
        	<a href="#"><img src="images/img-customize2.png"/></a>
            <h4><a href="#" title="钟表"><img src="images/title-customize2.png"/></a></h4>
        </div>
        <div class="pic-customize">
        	<a href="#"><img src="images/img-customize3.png"/></a>
            <h4><a href="#" title="景泰蓝"><img src="images/title-customize3.png"/></a></h4>
        </div>
    </div>
</div>
<!-- customize over -->
<div class="box-carft">
	<h3 class="title-carft"></h3>
    <ul class="list-carft clearfix">
        <li><a href="#"><img src="images/img-carft1.png"/></a></li>
        <li><a href="#"><img src="images/img-carft2.png"/></a></li>
        <li><a href="#"><img src="images/img-carft3.png"/></a></li>
        <li><a href="#"><img src="images/img-carft4.png"/></a></li>
        <li><a href="#"><img src="images/img-carft5.png"/></a></li>
        <li><a href="#"><img src="images/img-carft6.png"/></a></li>
        <li><a href="#"><img src="images/img-carft7.png"/></a></li>
        <li><a href="#"><img src="images/img-carft8.png"/></a></li>
        <li><a href="#"><img src="images/img-carft9.png"/></a></li>
        <li><a href="#"><img src="images/img-carft10.png"/></a></li>
        <li><a href="#"><img src="images/img-carft11.png"/></a></li>
        <li><a href="#"><img src="images/img-carft12.png"/></a></li>
    </ul>
</div>
<!-- carft over -->
<script type="text/javascript">
(function($){$.fn.extend({Scroll:function(opt,callback){if(!opt) var opt={};var _this=this.eq(0).find("ul:first");var lineH=_this.find("li:first").height(),line=opt.line?parseInt(opt.line,10):parseInt(this.height()/lineH,10),speed=opt.speed?parseInt(opt.speed,10):500,timer=opt.timer?parseInt(opt.timer,10):3000; if(line==0) line=1;var upHeight=0-line*lineH;scrollUp=function(){_this.animate({marginTop:upHeight},speed,function(){for(i=1;i<=line;i++){_this.find("li:first").appendTo(_this);}_this.css({marginTop:0});});};_this.hover(function(){clearInterval(timerID);},function(){timerID=setInterval("scrollUp()",timer);}).mouseout();}})})(jQuery);$(document).ready(function(){$("#scrollDiv").Scroll({line:1,speed:500,timer:4000});});
</script>
<div class="box box-news clearfix" id="scrollDiv">
	<h3 class="h3-news">国匠最新动态</h3>
    <div class="box-news-list">
    	<ul class="list-news">
        	<li><span>(2013-01-01)</span><a href="#">动态内容动态内容动态内容动态内容</a></li>
            <li><span>(2013-01-01)</span><a href="#">动态内容动态内容动态内容动态内容</a></li>
            <li><span>(2013-01-01)</span><a href="#">动态内容动态内容动态内容动态内容</a></li>
            <li><span>(2013-01-01)</span><a href="#">动态内容动态内容动态内容动态内容</a></li>
            <li><span>(2013-01-01)</span><a href="#">动态内容动态内容动态内容动态内容</a></li>
            <li><span>(2013-01-01)</span><a href="#">动态内容动态内容动态内容动态内容</a></li>
            <li><span>(2013-01-01)</span><a href="#">动态内容动态内容动态内容动态内容</a></li>
            <li><span>(2013-01-01)</span><a href="#">动态内容动态内容动态内容动态内容</a></li>
        </ul>
    </div>
    <div class="news-change">
    	<span class="up"></span>
        <span class="down"></span>
    </div>
</div>
<!-- news over -->
<#include "include/foot.ftl">
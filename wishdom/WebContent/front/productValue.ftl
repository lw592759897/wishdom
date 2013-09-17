<#include "/include/head.ftl">
<title>智慧金-产品详情</title>
<!-- index-top over -->
<script src="script/jquery-1.2.6.pack.js"></script>
<script src="script/base.js"></script>
<script src="script/lib.js"></script>
<script src="script/pic-css.js"></script>
<script>
	$(function(){			
	   $(".jqzoom").jqueryzoom({
			xzoom:400,
			yzoom:400,
			offset:10,
			position:"right",
			preload:1,
			lens:1
		});
		$("#spec-list").jdMarquee({
			deriction:"left",
			width:440,
			height:90,
			step:2,
			speed:4,
			delay:10,
			control:true,
			_front:"#spec-right",
			_back:"#spec-left"
		});
		$("#spec-list img").bind("mouseover",function(){
			var src=$(this).attr("src");
			$("#spec-n1 img").eq(0).attr({
				src:src.replace("\/n5\/","\/n1\/"),
				jqimg:src.replace("\/n5\/","\/n0\/")
			});
			
		})			
	})
</script>
<div class="box-info">
    <div class="box clearfix">
        <div class="pic-info">
        	<div class="box-info-share">
            	<div class="jqzoom" id="spec-n1"><img src="images/pic-info-demo.png" jqimg="images/pic-info-demo.png" width="540" height="347" /></div>
                	<span class="up" id="spec-left"></span>
                    <div class="commodity-img-list" id="spec-list">
                        <ul class="clearfix" id="list-h">
                            <li><img src="images/pic-info-demo.png"/></li>
                            <li><img src="images/pic-info-demo.png"/></li>
                            <li><img src="images/pic-info-demo.png"/></li>
                            <li><img src="images/pic-info-demo.png"/></li>
                            <li><img src="images/pic-info-demo.png"/></li>
                            <li><img src="images/pic-info-demo.png"/></li>
                            <li><img src="images/pic-info-demo.png"/></li>
                            <li><img src="images/pic-info-demo.png"/></li>
                            <li><img src="images/pic-info-demo.png"/></li>
                            <li><img src="images/pic-info-demo.png"/></li>
                            <li><img src="images/pic-info-demo.png"/></li>
                            <li><img src="images/pic-info-demo.png"/></li>
                            <li><img src="images/pic-info-demo.png"/></li>
                            <li><img src="images/pic-info-demo.png"/></li>
                            <li><img src="images/pic-info-demo.png"/></li>
                            <li><img src="images/pic-info-demo.png"/></li>
                            <li><img src="images/pic-info-demo.png"/></li>
                            <li><img src="images/pic-info-demo.png"/></li>
                        </ul>
                    </div>
                    <span class="down" id="spec-right"></span>
            </div>
            <!--box-info-share over -->
            <script>
			(function($){$.fn.extend({Scroll:function(opt,callback){if(!opt) var opt={};var _this=this.eq(0).find("ul:first");var lineH=_this.find("li:first").height(),line=opt.line?parseInt(opt.line,10):parseInt(this.height()/lineH,10),speed=opt.speed?parseInt(opt.speed,10):500,timer=opt.timer?parseInt(opt.timer,10):3000; if(line==0) line=1;var upHeight=0-line*lineH;scrollUp=function(){_this.animate({marginTop:upHeight},speed,function(){for(i=1;i<=line;i++){_this.find("li:first").appendTo(_this);}_this.css({marginTop:0});});};_this.hover(function(){clearInterval(timerID);},function(){timerID=setInterval("scrollUp()",timer);}).mouseout();}})})(jQuery);$(document).ready(function(){$("#scrollDiv").Scroll({line:1,speed:500,timer:4000});});
			</script>
            <div class="box-news clearfix" id="scrollDiv">
                <h3 class="h3-news">国匠最新动态</h3>
                <div class="box-news-list">
                    <ul class="list-news">
                        <li><span>(2013-01-01)</span><a href="#">动态内容动态内容动态内容动态内容动态内容动态内容动态内容动态内容</a></li>
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
            <!-- box-news over-->
            
        </div>
        <!-- pic-info over -->
        <script>
		window.onload=function(){
			function $(id){return document.getElementById(id);};
			$('about').onmouseover=function(){$('div-a-about').style.display='block';};$('about').onmouseout=function(){$('div-a-about').style.display='none';};$('art').onmouseover=function(){$('div-a-art').style.display='block';};$('art').onmouseout=function(){$('div-a-art').style.display='none';};
			var disY = 0;$('scroll-btn').onmousedown = function(ev){var ev = ev || window.event;disY = ev.clientY - $('scroll-btn').offsetTop;document.onmousemove = function(ev){var ev = ev || window.event;var T = ev.clientY - disY;if(T<0){T = 0;}else if(T>$('scroll-l').offsetHeight - $('scroll-btn').offsetHeight){T = $('scroll-l').offsetHeight - $('scroll-btn').offsetHeight;}$('scroll-btn').style.top = T + 'px';var scale = T/($('scroll-l').offsetHeight - $('scroll-btn').offsetHeight);$('box-scroll').style.top = - scale * ($('box-scroll').offsetHeight - $('news-info-right').offsetHeight) + 'px';};document.onmouseup = function(){document.onmousemove = null;document.onmouseup = null;};return false;};
		};
		</script>
        <div class="text-info">
        	<h3>【五福五代宝玺】</h3>
            <div class="news-info-right" id="news-info-right">
            	<div class="box-scroll" id="box-scroll">
                    <p>很多中小企业对公司简介不晓得如何写，不是写的太少就是写的太多，总是不能好好掌握，明天我们在这里好好说说关于公司简介的书写办法。公司简介是什么，就是对公司，对企业的引见。</p>
                    <p>这种引见不是一句话带过，也不是长篇大论，是复杂简明的引见公司的一段文字，让他人初步理解公司的根本状况。饶网站筹划收录了一些比拟不错的公司简介范文，希望经过这些范文可以让您明白公司简介应该怎样写。新饶网站筹划公司简介范文新饶网站筹划股份无限公司成立于</p>
                    <p>很多中小企业对公司简介不晓得如何写，不是写的太少就是写的太多，总是不能好好掌握，明天我们在这里好好说说关于公司简介的书写办法。公司简介是什么，就是对公司，对企业的引见。</p>
                    <p>这种引见不是一句话带过，也不是长篇大论，是复杂简明的引见公司的一段文字，让他人初步理解公司的根本状况。饶网站筹划收录了一些比拟不错的公司简介范文，希望经过这些范文可以让您明白公司简介应该怎样写。新饶网站筹划公司简介范文新饶网站筹划股份无限公司成立于</p>
                    <p>很多中小企业对公司简介不晓得如何写，不是写的太少就是写的太多，总是不能好好掌握，明天我们在这里好好说说关于公司简介的书写办法。公司简介是什么，就是对公司，对企业的引见。</p>
                    <p>这种引见不是一句话带过，也不是长篇大论，是复杂简明的引见公司的一段文字，让他人初步理解公司的根本状况。饶网站筹划收录了一些比拟不错的公司简介范文，希望经过这些范文可以让您明白公司简介应该怎样写。新饶网站筹划公司简介范文新饶网站筹划股份无限公司成立于</p>
                    <p>很多中小企业对公司简介不晓得如何写，不是写的太少就是写的太多，总是不能好好掌握，明天我们在这里好好说说关于公司简介的书写办法。公司简介是什么，就是对公司，对企业的引见。</p>
                    <p>这种引见不是一句话带过，也不是长篇大论，是复杂简明的引见公司的一段文字，让他人初步理解公司的根本状况。饶网站筹划收录了一些比拟不错的公司简介范文，希望经过这些范文可以让您明白公司简介应该怎样写。新饶网站筹划公司简介范文新饶网站筹划股份无限公司成立于</p>
                </div>
                <div class="scroll-l" id="scroll-l"><div class="scroll-btn" id="scroll-btn"></div></div>
            </div>
            <!--news-info-right over -->
            
            <p class="text-info-p">
            	<span>编号：</span>
                123456
            </p>
            <p class="text-info-p">
                <span>规格：</span>
                未知
            </p>
            
            <div class="box-share clearfix">
            	<span class="text">分享到：</span>
            	<!-- Baidu Button BEGIN -->
                <div id="bdshare" class="bdshare_t bds_tools_32 get-codes-bdshare">
                <a class="bds_qzone"></a>
                <a class="bds_tsina"></a>
                <a class="bds_tqq"></a>
                <a class="bds_renren"></a>
                <a class="bds_t163"></a>
                <span class="bds_more"></span>
                </div>
                <script type="text/javascript" id="bdshare_js" data="type=tools&amp;uid=0" ></script>
                <script type="text/javascript" id="bdshell_js"></script>
                <script type="text/javascript">
                document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + Math.ceil(new Date()/3600000)
                </script>
                <!-- Baidu Button END -->
                <div class="consult"><a href="tencent://message/?uin=123456789&Site=购物咨询&Menu=yes" title="购物咨询"></a></div><!-- 修改 uin 咨询QQ -->
            </div>
            <div class="info-list-link clearfix">
                <div class="list-link"><a href="#"><img src="images/pic06.jpg"/></a></div>
                <div class="list-link"><a href="#"><img src="images/pic06.jpg"/></a></div>
                <div class="list-link"><a href="#"><img src="images/pic06.jpg"/></a></div>
            </div>
            
            
        </div>
        <!-- text-info over -->
    </div>
</div>

<#include "/include/foot.ftl">
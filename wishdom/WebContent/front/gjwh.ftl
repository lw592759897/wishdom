<#include "/include/head.ftl">
<title>智慧金-国匠文化</title>
<!-- index-top over -->
        <script>
				window.onload=function(){
					function $(id){return document.getElementById(id);};
					$('about').onmouseover=function(){$('div-a-about').style.display='block';};$('about').onmouseout=function(){$('div-a-about').style.display='none';};$('art').onmouseover=function(){$('div-a-art').style.display='block';};$('art').onmouseout=function(){$('div-a-art').style.display='none';};
					var disY = 0;$('scroll-btn').onmousedown = function(ev){var ev = ev || window.event;disY = ev.clientY - $('scroll-btn').offsetTop;document.onmousemove = function(ev){var ev = ev || window.event;var T = ev.clientY - disY;if(T<0){T = 0;}else if(T>$('scroll-l').offsetHeight - $('scroll-btn').offsetHeight){T = $('scroll-l').offsetHeight - $('scroll-btn').offsetHeight;}$('scroll-btn').style.top = T + 'px';var scale = T/($('scroll-l').offsetHeight - $('scroll-btn').offsetHeight);$('box-scroll').style.top = - scale * ($('box-scroll').offsetHeight - $('news-info-right').offsetHeight) + 'px';};document.onmouseup = function(){document.onmousemove = null;document.onmouseup = null;};return false;};
				};
		</script>
<div class="box-news-info">
	<div class="box">
    	<h3 class="h3-news-info"><img src="images/about-nav-b3.png"/></h3>
        <div class="text-news-info">
        <#if wenhua?exists>
        	${wenhua.CONTENT!}
        </#if>
        	<span class="span-news-img"><img src="images/pic06.png"/></span>
            <div class="news-info-right" id="news-info-right">
            	<div class="box-scroll" id="box-scroll">
                    <p>很多中小企业对公司简介不晓得如何写，不是写的太少就是写的太多，总是不能好好掌握，明天我们在这里好好说说关于公司简介的书写办法。公司简介是什么，就是对公司，对企业的引见。</p>
                    <p>这种引见不是一句话带过，也不是长篇大论，是复杂简明的引见公司的一段文字，让他人初步理解公司的根本状况。饶网站筹划收录了一些比拟不错的公司简介范文，希望经过这些范文可以让您明白公司简介应该怎样写。新饶网站筹划公司简介范文新饶网站筹划股份无限公司成立于</p>
                    <p>很多中小企业对公司简介不晓得如何写，不是写的太少就是写的太多，总是不能好好掌握，明天我们在这里好好说说关于公司简介的书写办法。公司简介是什么，就是对公司，对企业的引见。</p>
                    <p>这种引见不是一句话带过，也不是长篇大论，是复杂简明的引见公司的一段文字，让他人初步理解公司的根本状况。饶网站筹划收录了一些比拟不错的公司简介范文，希望经过这些范文可以让您明白公司简介应该怎样写。新饶网站筹划公司简介范文新饶网站筹划股份无限公司成立于</p>
                    <p>很多中小企业对公司简介不晓得如何写，不是写的太少就是写的太多，总是不能好好掌握，明天我们在这里好好说说关于公司简介的书写办法。公司简介是什么，就是对公司，对企业的引见。</p>
                    <p>这种引见不是一句话带过，也不是长篇大论，是复杂简明的引见公司的一段文字，让他人初步理解公司的根本状况。饶网站筹划收录了一些比拟不错的公司简介范文，希望经过这些范文可以让您明白公司简介应该怎样写。新饶网站筹划公司简介范文新饶网站筹划股份无限公司成立于</p>
                </div>
                <div class="scroll-l" id="scroll-l"><div class="scroll-btn" id="scroll-btn"></div></div>
            </div>
            
            
        </div>
    </div>
</div>

<div class="news-info-other">
	<div class="box">
        <ul>
            <li><a href="${contextPath!}/cominfo.htm"><img src="images/about-nav-1.png"/></a></li>
            <li><a href="${contextPath!}/news.htm"><img src="images/about-nav-2.png"/></a></li>
        </ul>
    </div>
</div>

<#include "/include/foot.ftl">
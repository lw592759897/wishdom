<#include "/include/head.ftl">
<div class="box-news-info">
	<div class="box">
    	<h3 class="h3-news-info"><img src="images/about-nav-b2.png"/></h3>
        <div class="text-news-info">
        	<span class="span-news-img"><img src="images/pic06.png"/></span>
        	<#if newNews?exists>
            	<h4 class="h4-news-title">${newNews.NEWSTITLE!}<span>${newNews.NEWSDATE!}</span></h4>
            </#if>
            <div class="news-info-right news-info-scroll" id="news-info-right">
            	<div class="box-scroll" id="box-scroll">
                   <#if newsMap?exists>
                   		${newsMap.CONTENT!}
                   </#if>
                </div>
                <div class="scroll-l" id="scroll-l"><div class="scroll-btn" id="scroll-btn"></div></div>
            </div>
        </div>
    </div>
</div>

<div class="news-info-other">
	<div class="box">
        <ul class="sub-nav fl-left">
            <li><a href="${contextPath!}/cominfo.htm"><img src="images/about-nav-1.png"/></a></li>
            <li><a href="${contextPath!}/gjwh.htm"><img src="images/about-nav-3.png"/></a></li>
        </ul>
        
        <div class="list-news-info">
        	<ul class="clearfix">
        		<#if newsList?exists>
        			<#list newsList as list>
            			<li><span>${list.NEWSDATE!}</span><a href="${contextPath!}/news.htm?newsid=${list.NEWSID!}">${list.NEWSTITLE!}</a></li>
            		</#list>
        		</#if> 
            </ul>
            <p class="clearfix"><a href="${contextPath!}/news.htm?newsid=${newNews.PERNEWSID!}" title="上一条" class="up"></a><a href="${contextPath!}/news.htm?newsid=${newNews.NEXTNEWSID!}" title="下一条" class="down"></a></p>
        </div>
        
    </div>
</div>
<#include "/include/foot.ftl">
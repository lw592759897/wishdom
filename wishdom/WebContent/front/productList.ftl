<!-- index-top over -->
<title>智慧金-产品</title>
<#include "/include/head.ftl">
<div class="bg-box-type clearfix">
	<div class="box-type">
        <ul class="list-type">
        <#if productList?exists>
        <#list productList as product>
         	<li><a href="${contextPath!}/productdetail.htm?productId=${product.PRODUCTID!}"><img src="${contextPath!}/${product.PRODUCTIMG}" width="290px" title="${product.PRODUCTNAME}"></a></li> 
        </#list>
        </#if>
        </ul>
    </div>
    <div id="page" style="padding-bottom:5px;height:50px;padding-left:400px;"> 
    <#if totlePage?exists>
    	<#if totlePage<11>
    	  				<a href="${contextPath!}/pdshow.htm?catalogId=${catalogId}&currPage=1" class="page_">首页</a> 
    				<#list 1..totlePage as pages>
    					<#if currIndex?exists>
	    					<#if currIndex==pages>
	    						<a href="${contextPath!}/pdshow.htm?catalogId=${catalogId}&currPage=${pages}" class="current">${pages}</a> 
	    						<#else>
	    						<a href="${contextPath!}/pdshow.htm?catalogId=${catalogId}&currPage=${pages}" >${pages}</a> 
	    					</#if>
    					</#if>
    				</#list>
    				<a href="${contextPath!}/pdshow.htm?catalogId=${catalogId}&currPage=${totlePage!}" class="page_">末页</a> 
    	<#else> 
    				<#if currIndex<10>
    				<a href="${contextPath!}/pdshow.htm?catalogId=${catalogId}&currPage=1" class="page_">首页</a> 
    				<#list 1..10 as pages>
    					<#if currIndex?exists>
	    					<#if currIndex==pages>
	    						<a href="${contextPath!}/pdshow.htm?catalogId=${catalogId}&currPage=${pages}" class="current">${pages}</a> 
	    						<#else>
	    						<a href="${contextPath!}/pdshow.htm?catalogId=${catalogId}&currPage=${pages}" >${pages}</a> 
	    					</#if>
    					</#if>
    				</#list>
    				<a href="${contextPath!}/pdshow.htm?catalogId=${catalogId}&currPage=${totlePage!}" class="page_">末页</a> 
   		<#else>
   				<#if currIndex+5<totlePage>
    				<a href="${contextPath!}/pdshow.htm?catalogId=${catalogId}&currPage=1" class="page_">首页</a> 
    				<#list currIndex-4..currIndex+5 as pages>
    					<#if currIndex?exists>
	    					<#if currIndex==pages>
	    						<a href="${contextPath!}/pdshow.htm?catalogId=${catalogId}&currPage=${pages}" class="current">${pages}</a> 
	    						<#else>
	    						<a href="${contextPath!}/pdshow.htm?catalogId=${catalogId}&currPage=${pages}" >${pages}</a> 
	    					</#if>
    					</#if>
    				</#list>
    				<a href="${contextPath!}/pdshow.htm?catalogId=${catalogId}&currPage=${totlePage!}" class="page_">末页</a> 	
    				<#else>
    				<a href="${contextPath!}/pdshow.htm?catalogId=${catalogId}&currPage=1" class="page_">首页</a> 
    				<#list totlePage-9..totlePage as pages>
    					<#if currIndex?exists>
	    					<#if currIndex==pages>
	    						<a href="${contextPath!}/pdshow.htm?catalogId=${catalogId}&currPage=${pages}" class="current">${pages}</a> 
	    						<#else>
	    						<a href="${contextPath!}/pdshow.htm?catalogId=${catalogId}&currPage=${pages}" >${pages}</a> 
	    					</#if>
    					</#if>
    				</#list>
    				<a href="${contextPath!}/pdshow.htm?catalogId=${catalogId}&currPage=${totlePage!}" class="page_">末页</a> 	
    				</#if>
    			</#if>
    	</#if>
    	</#if> 
		</div> 
    
    <div class="box clearfix">
        <div class="list-link"><a href="#"><img src="images/pic06.jpg"/></a></div>
        <div class="list-link"><a href="#"><img src="images/pic06.jpg"/></a></div>
        <div class="list-link"><a href="#"><img src="images/pic06.jpg"/></a></div>
    </div>
   
</div>
<#include "/include/foot.ftl">
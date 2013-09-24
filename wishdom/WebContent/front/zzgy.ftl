<#include "/include/head.ftl">
<title>智慧金-制作工艺</title>
<#assign contextPath = request.contextPath />
<!-- index-top over -->
<script>
 function clickshow( id){
 		document.getElementById("bg-black").style.display='block';
 		document.getElementById(id).style.display='block';
 }
 function closed( id){
 		document.getElementById("bg-black").style.display='none';
 		document.getElementById(id).style.display='none';
 }
</script>
   <script>
			(function($){$.fn.extend({Scroll:function(opt,callback){if(!opt) var opt={};var _this=this.eq(0).find("ul:first");var lineH=_this.find("li:first").height(),line=opt.line?parseInt(opt.line,10):parseInt(this.height()/lineH,10),speed=opt.speed?parseInt(opt.speed,10):500,timer=opt.timer?parseInt(opt.timer,10):3000; if(line==0) line=1;var upHeight=0-line*lineH;scrollUp=function(){_this.animate({marginTop:upHeight},speed,function(){for(i=1;i<=line;i++){_this.find("li:first").appendTo(_this);}_this.css({marginTop:0});});};_this.hover(function(){clearInterval(timerID);},function(){timerID=setInterval("scrollUp()",timer);}).mouseout();}})})(jQuery);$(document).ready(function(){$("#scrollDiv").Scroll({line:1,speed:500,timer:4000});});
			</script>
<div class="box box-craft">
	<ul class="list-craft clearfix" id="list-craft">
	<#if mkproductList ?exists>
	<#list mkproductList as mk>
	
    		<li><a href="javascript:void(0)" onClick="clickshow('text-craft_${mk.MAKEPRODUCTID}')"><img src="${contextPath}/${mk.MAKEPRODUCTIMGURL!}"/></a></li>
    	</#list>
      </#if>  
    </ul>
</div>
		<#if mkproductList ?exists>
			<#list mkproductList as mk>
			<div class="text-craft" id="text-craft_${mk.MAKEPRODUCTID}">
		    	<span class="craft-img"><img src="${contextPath}/${mk.MAKEPRODUCTINNERIMG!}"/></span>
		        <div class="text-craft-right" id="text-craft-right">
		        	<div class="box-craft-scroll" id="box-craft-scroll">
		            	${mk.MAKEPRODUCTINNERCONTENT!}
		            </div>
		            <div class="craft-scroll-l" id="craft-scroll-l"><div class="craft-scroll-btn" id="craft-scroll-btn"></div></div>
		        </div>
		        <span class="close" title="关闭" id="close" onClick="closed('text-craft_${mk.MAKEPRODUCTID}')">X</span>
		    </div>
		     	</#list>
      	</#if> 
    <div class="bg-black" id="bg-black"></div>
    
    <div id="page" style="padding-bottom:5px;height:50px;padding-left:400px;"> 
    <#if totlePage?exists>
    	<#if totlePage<11>
    	  				<a href="${contextPath!}/zzgy.htm?gyId=${catalogId!}&currPage=1" class="page_">首页</a> 
    				<#list 1..totlePage as pages>
    					<#if currIndex?exists>
	    					<#if currIndex==pages>
	    						<a href="${contextPath!}/zzgy.htm?gyId=${catalogId!}&currPage=${pages}" class="current">${pages}</a> 
	    						<#else>
	    						<a href="${contextPath!}/zzgy.htm?gyId=${catalogId!}&currPage=${pages}" >${pages}</a> 
	    					</#if>
    					</#if>
    				</#list>
    				<a href="${contextPath!}/zzgy.htm?gyId=${catalogId!}&currPage=${totlePage!}" class="page_">末页</a> 
    	<#else> 
    				<#if currIndex<10>
    				<a href="${contextPath!}/zzgy.htm?gyId=${catalogId}&currPage=1" class="page_">首页</a> 
    				<#list 1..10 as pages>
    					<#if currIndex?exists>
	    					<#if currIndex==pages>
	    						<a href="${contextPath!}/zzgy.htm?gyId=${catalogId!}&currPage=${pages}" class="current">${pages}</a> 
	    						<#else>
	    						<a href="${contextPath!}/zzgy.htm?gyId=${catalogId!}&currPage=${pages}" >${pages}</a> 
	    					</#if>
    					</#if>
    				</#list>
    				<a href="${contextPath!}/zzgy.htm?gyId=${catalogId!}&currPage=${totlePage!}" class="page_">末页</a> 
   		<#else>
   				<#if currIndex+5<totlePage>
    				<a href="${contextPath!}/zzgy.htm?gyId=${catalogId!}&currPage=1" class="page_">首页</a> 
    				<#list currIndex-4..currIndex+5 as pages>
    					<#if currIndex?exists>
	    					<#if currIndex==pages>
	    						<a href="${contextPath!}/zzgy.htm?gyId=${catalogId!}&currPage=${pages}" class="current">${pages}</a> 
	    						<#else>
	    						<a href="${contextPath!}/zzgy.htm?gyId=${catalogId!}&currPage=${pages}" >${pages}</a> 
	    					</#if>
    					</#if>
    				</#list>
    				<a href="${contextPath!}/zzgy.htm?gyId=${catalogId!}&currPage=${totlePage!}" class="page_">末页</a> 	
    				<#else>
    				<a href="${contextPath!}/zzgy.htm?gyId=${catalogId!}&currPage=1" class="page_">首页</a> 
    				<#list totlePage-9..totlePage as pages>
    					<#if currIndex?exists>
	    					<#if currIndex==pages>
	    						<a href="${contextPath!}/zzgy.htm?gyId=${catalogId!}&currPage=${pages}" class="current">${pages}</a> 
	    						<#else>
	    						<a href="${contextPath!}/zzgy.htm?gyId=${catalogId!}&currPage=${pages}" >${pages}</a> 
	    					</#if>
    					</#if>
    				</#list>
    				<a href="${contextPath!}/zzgy.htm?gyId=${catalogId!}&currPage=${totlePage!}" class="page_">末页</a> 	
    				</#if>
    			</#if>
    	</#if>
    	</#if> 
		</div> 
    <#include "/include/foot.ftl">
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
    
    
    <div class="box clearfix">
        <div class="list-link"><a href="#"><img src="images/pic06.jpg"/></a></div>
        <div class="list-link"><a href="#"><img src="images/pic06.jpg"/></a></div>
        <div class="list-link"><a href="#"><img src="images/pic06.jpg"/></a></div>
    </div>
   
</div>
<#include "/include/foot.ftl">
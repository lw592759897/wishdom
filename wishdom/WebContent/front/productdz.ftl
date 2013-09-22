<#include "/include/head.ftl">
<h3 class="h3-art-work"></h3>
<div class="box-art">
<#if productLidz?exists>
	${productLidz.CONTENT!}
	</#if>
</div>
<#include "/include/foot.ftl">
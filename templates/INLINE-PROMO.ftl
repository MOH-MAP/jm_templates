<div class="container">
	<div class="row promo__sec">
	<div class="col-md-8 promo__block">
	<p class="promo__signup">${Name.getData()}</p>
	<h2 class="promo__heading">${Title.getData()}</h2>
	<a class="promo__btn" href="${Path.getData()}">
	${PreTitle.getData()}
	<span class="arrow__forward"></span>
	</a>
	</div>
	<div class="col-md-4">
	<#if (ImageLarge.getData())?? && ImageLarge.getData() != "">
	<img 
	   <#if ImageLarge.getAttribute("alt")??>  alt="${ImageLarge.getAttribute("alt")}" </#if>
	   <#if ImageLarge.getAttribute("fileEntryId")??> data-fileentryid="${ImageLarge.getAttribute("fileEntryId")}"</#if> src="${ImageLarge.getData()}"  class="inline-img"/>
	</#if>
	</div>
	</div>
	</div>
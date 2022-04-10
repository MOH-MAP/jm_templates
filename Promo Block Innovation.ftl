<div class="promoblck__cont">
<h1 class="promoblck__title">
	<#if (Title.getData())??>
	${Title.getData()}
</#if></h1>
<div class="fraser--row innovation--cont"> 
<div class="col-md-5">
<#if (ImageLarge.getData())?? && ImageLarge.getData() != "">
	<img alt="${ImageLarge.getAttribute("alt")}" data-fileentryid="${ImageLarge.getAttribute("fileEntryId")}" src="${ImageLarge.getData()}" class="img__invt"/>
</#if>
</div>
<div class="col-md-6">
<h3 class="promoblck__heading">${Title.getData()}</h3>

<p class="promoblck__para">${Body.getData()}</p>
</div>
</div>
</div>
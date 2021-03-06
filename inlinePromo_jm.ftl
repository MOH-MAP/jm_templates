<div class="container">
	<div class="row jminline-promo--section">
		<div class="col-md-8 jminline--promo">
			<p class="jminline-promo--sign-up">${Name.getData()}</p>
			<h2 class="jminline-promo--heading">${Title.getData()}</h2>
			<a class="jminline-promo--btn" href="${Path.getData()}">
				${PreTitle.getData()}
				<span class="jminline-promo--forward-icon"></span>
			</a>
		</div>
		<div class="col-md-4">
			<#if (ImageLarge.getData())?? && ImageLarge.getData() != "">
				<img 
				 <#if ImageLarge.getAttribute("alt")??>  alt="${ImageLarge.getAttribute("alt")}" </#if>
				<#if ImageLarge.getAttribute("fileEntryId")??> data-fileentryid="${ImageLarge.getAttribute("fileEntryId")}"</#if> src="${ImageLarge.getData()}"  class="jminline-promo--img"/>
			</#if>
		</div>
	</div>
</div>
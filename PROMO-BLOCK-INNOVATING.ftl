<div class="container jmpromo--block-container-alignment">
	<div class="row">
		<div class="col-md-7">
			<#if (Title.getData())??>
				<h1> ${Title.getData()}</h1>
			</#if>
			<p>${Body.getData()}</p>
		</div>
		<div class="col-md-5">
			<#if (ImageLarge.getData())?? && ImageLarge.getData() != "">
				<img alt="${ImageLarge.getAttribute("alt")}" data-fileentryid="${ImageLarge.getAttribute("fileEntryId")}" src="${ImageLarge.getData()}" />
			</#if>
		</div>
	</div>
</div>
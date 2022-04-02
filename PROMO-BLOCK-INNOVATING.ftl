<div class="container jmpromoblock">
	<div class="row">
		<div class="col-md-7">
			<h1>${Name.getData()}</h1>
			<p>${Body.getData()}</p>
		</div>
		<div class="col-md-5">
			<#if (ImageLarge.getData())?? && ImageLarge.getData() !="">
				<img alt="${ImageLarge.getAttribute(" alt")}" data-fileentryid="${ImageLarge.getAttribute("
					fileEntryId")}" src="${ImageLarge.getData()}" />
			</#if>
		</div>
	</div>
</div>
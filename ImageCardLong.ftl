<#--
Web content templates are used to lay out the fields defined in a web
content structure.

Please use the left panel to quickly add commonly used variables.
Autocomplete is also available and can be invoked by typing "${".
-->

<div class="img__card__container">
	<div class="image__card img__main__cardblock bg-light">
		<div class="row no-gutters">
			<div class="col-4">
				<div class="img__cardblock-body body">
					<h6 class="img__card__title">${PreTitle.getData()}</h6>
					<h3 class="img__card__text">${Title.getData()}</h3>
					<#assign linkHref = "" />
					<#assign linkTitle = "Read More" />
					<#if Link_Title?? && Link_Title.getData()?has_content>
						<#assign linkTitle = Link_Title.getData()/>
					</#if>
					<#if Link_Title.Link_Internal?? && Link_Title.Link_Internal.getFriendlyUrl()?has_content>
						<#assign linkHref = Link_Title.Link_Internal.getFriendlyUrl() />
					<#elseif Link_Title.Link_Media?? && Link_Title.Link_Media.getData()?has_content>
						<#assign linkHref = Link_Title.Link_Media.getData() />
					<#elseif Link_Title.Link_Mailto?? && Link_Title.Link_Mailto.getData()?has_content>
						<#assign linkHref = "mailto:" + Link_Title.Link_Mailto.getData() />
					<#elseif Link_Title.Link_External?? && Link_Title.Link_External.getData()?has_content>
						<#assign linkHref = Link_Title.Link_External.getData() />
					</#if>
					<#if linkHref?has_content>
						<a class="list-link text-decoration-none" href="${linkHref}" target="${Link_Title.Link_Target.getData()}" style="padding-top: 10px;">
							<span class="link-text">${linkTitle}</span>
							<span class="link-icon"></span>
						</a>
					</#if>
				</div>
			</div>
			<div class="col-8 img__cardblock__longcol">
				<#if (ImageLarge.getData())?? && ImageLarge.getData() != "">
					<img class="img__card-img rounded-0" alt="${ImageLarge.getAttribute("alt")}" data-fileentryid="${ImageLarge.getAttribute("fileEntryId")}" src="${ImageLarge.getData()}" />
				</#if>
			</div>
		</div>
	</div>
</div>
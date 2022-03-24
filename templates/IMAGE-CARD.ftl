<div class="image__card-block img__cardblock bg-light">
	<div class="row no-gutters">
		<div class="col-7">
			<div class="img__card-body">
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
				    <#if Link_Title.Link_Target??>
				        <#assign linkTarget = Link_Title.Link_Target.getData()>
				    </#if>
			        <a class="img__list__link" href="${linkHref}" target="${linkTarget!}" tyle="padding-top: 10px;">
						<span class="img__link__text">${linkTitle}</span>
                        <span class="img__link__icon"></span>
					</a>
				</#if>
			</div>
		</div>
		<div class="col-5 right-img">
		<!--	<#if (ImageLarge.getData())?? && ImageLarge.getData() != "">
				<img class="img__card-img img__card-img2 rounded-0" alt="${ImageLarge.getAttribute("alt")}" data-fileentryid="${ImageLarge.getAttribute("fileEntryId")}" src="${ImageLarge.getData()}" />
			</#if> -->
		</div>
	</div>
</div>
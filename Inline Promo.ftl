<div class="container">
	<div class="row jminline-promo--section">
        <#if (ImageLarge.getData())?? && ImageLarge.getData() != "">
        <div class="col-md-8 jminline--promo">
		<#else>
        <div class="col-md-12 jminline--promo jminline--promo-no-image">
		</#if>
			<p class="jminline-promo--sign-up">${PreTitle.getData()}</p>
			<h2 class="jminline-promo--heading">${Title.getData()}</h2>

			<#if Link_Title?? && Link_Title.getData()?has_content>
                <#assign linkHref = "#" />
        
                <#if Link_Title.Link_Internal?? && Link_Title.Link_Internal.getFriendlyUrl()?has_content>
                    <#assign linkHref = Link_Title.Link_Internal.getFriendlyUrl() />
                <#elseif Link_Title.Link_Media?? && Link_Title.Link_Media.getData()?has_content>
                    <#assign linkHref = Link_Title.Link_Media.getData() />
                <#elseif Link_Title.Link_Mailto?? && Link_Title.Link_Mailto.getData()?has_content>
                    <#assign linkHref = "mailto:" + Link_Title.Link_Mailto.getData() />
                <#elseif Link_Title.Link_External?? && Link_Title.Link_External.getData()?has_content>
                    <#assign linkHref = Link_Title.Link_External.getData() />
                </#if>
                <a href="${linkHref}" class="jminline-promo--btn" title="${Link_Title.getData()}">
                    <span class="btn__text">${Link_Title.getData()}</span>
                    <span class="arrow__forward"></span>
                </a>
            </#if>
		</div>

        <#if (ImageLarge.getData())?? && ImageLarge.getData() != "">
            <div class="col-md-4">
                <img alt="${ImageLarge.getAttribute("alt")}" data-fileentryid="${ImageLarge.getAttribute("fileEntryId")}" src="${ImageLarge.getData()}" class="inline-img" />
            </div>
        </#if>
	</div>
</div>
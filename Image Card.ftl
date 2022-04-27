<div class="jmimage__card-block jmimg-card_block bg-light">
	<div class="row jmimg-cardblock--no-gutters">
		<#if (ImageLarge.getData())?? && ImageLarge.getData() != "">
			<div class="col-7">
			<#else>
			<div class="col-12">
		</#if>
			<div class="jmimg--cardblock--body body">
				<h6 class="jmimg--cardblock--title">${PreTitle.getData()}</h6>
				<h3 class="jmimg--cardblock--text">${Title.getData()}</h3>

				<#assign linkHref = "#" />
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
					<a class="jmimg--cardblock-list--full-ilnk" href="${linkHref}" target="${linkTarget!}"></a>
					<a class="jmimg--cardblock-list--ilnk text-decoration-none" href="${linkHref}" target="${linkTarget!}">
						<span class="jmimg--cardblock-link--text">${linkTitle}</span>
						<span class="jmimg--cardblock-link--icon"></span>
					</a>
				</#if>

			</div>
		</div>
		 
		<#if (ImageLarge.getData())?? && ImageLarge.getData() != "">
			<div class="col-5 jmimg-cardblock--right-img">
			<img class="img__card-img img__card-img2 rounded-0" alt="${ImageLarge.getAttribute("alt")}" data-fileentryid="${ImageLarge.getAttribute("fileEntryId")}" src="${ImageLarge.getData()}" />
			</div>
		</#if>
	</div>
</div>
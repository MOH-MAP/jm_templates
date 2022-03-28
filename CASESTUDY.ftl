<div class="container">
	<article class="jmcase-study__main">
		<div class="jmcase-study__inner-container">
			<div class="row">
				<div class="col-md-4">
					<#if (Image.getData())?? && Image.getData() != "">
						<img class="jmcase-study__img" alt="case-study" data-fileentryid="${Image.getAttribute("fileEntryId")}" src="${Image.getData()}"
							 />
					</#if>
				</div>
				<div class="col-md-8">
					<div class="jmcase-study__content">
						<div class="jmcase-study__header">
							<div class="jmcase-study__title"><#if (Title.getData())??>${Title.getData()}</#if></div>
								<div class="jmcase-study__subtitle"><#if (Subtitle.getData())??>${Subtitle.getData()}</#if></div>
							</div>
						<div class="jmcase-study__copy">
							<div><#if (Summary.getData())??>${Summary.getData()}</#if></div>
						</div>
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
							<div class="jmcase-study__link">
								<a href="${linkHref}" class="jmcase-study__btn-link">
                                    <span class="jmcase-study__link-text">${Link_Title.getData()}</span>
								<span class="jmcase-study__link-icon"></span>
							</div>
						</#if>
					</div>
				</div>
			</div>
		</div>
	</article>
</div>
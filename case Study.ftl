<div class="container">
	<article class="jmcasestudy__main">
		<div class="jmcasestudy__inner-container">
			<div class="row">
				<div class="col-md-4">
					<#if (Image.getData())?? && Image.getData() != "">
						<img class="jmcasestudy__img" alt="case-study" data-fileentryid="${Image.getAttribute("fileEntryId")}" src="${Image.getData()}"
							 />
					</#if>
				</div>
				<div class="col-md-8">
					<div class="jmcasestudy__content">
						<div class="jmcasestudy__header">
							<#if (Title.getData())??>
								<div class="jmcasestudy__title">${Title.getData()}</div>
							</#if>
							<#if (Subtitle.getData())??>
								<div class="jmcasestudy__subtitle">${Subtitle.getData()}</div>
							</#if>
						</div>
						<div class="jmcasestudy__copy">
							<#if (Summary.getData())??>
								<div>${Summary.getData()}</div>
							</#if>
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
							<div class="jmcasestudy__link">
								<a href="${linkHref}" class="jmcasestudy__btn-link" title="${Link_Title.getData()}">
                                    <span class="jmcasestudy__link-text">${Link_Title.getData()}</span>
									<span class="jmcasestudy__link-icon"></span>
								</a>
							</div>
						</#if>
					</div>
				</div>
			</div>
		</div>
	</article>
</div>
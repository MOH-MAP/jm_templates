<main>
	<div class="hero jmhome--banner-hero-temp">
		<div class="hero__content">
			<h2 class="home-heading">
				<#if (Heading.getData())??>${Heading.getData()}</#if>
			</h2>
			<p class="home-para">
				<#if (Paragraph.getData())??>${Paragraph.getData()}</#if>
			</p>
			<#if LinkToPage ?has_content>
				<#list LinkToPage.getSiblings()as cur_LinkToPage>
					<#if cur_LinkToPage ?has_content && cur_LinkToPage.getFriendlyUrl() !="">
						<div class="panel__btn">
							<a class="research" href="${cur_LinkToPage.getFriendlyUrl()}">
								<#if (LinkToPage.linkName.getData())??>
									${LinkToPage.linkName.getData()}
								</#if>
								<span class="arrow__forward"></span>
							</a>
						</div>
					</#if>
				</#list>
			</#if>
		</div>
		<#if (Image1072.getData())?? && Image1072.getData() !="">
			<div class="hero__img" style="background: url(${Image1072.getData()}) center"></div>
			<!--<img alt="${Image1072.getAttribute("alt")}" 
  				data-fileentryid="${Image1072.getAttribute("fileEntryId")}" 
    			src="${Image1072.getData()}" />-->
		</#if>

	</div>
</main>
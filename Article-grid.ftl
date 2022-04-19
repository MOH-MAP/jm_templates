<#assign JSONFactoryUtil = staticUtil["com.liferay.portal.kernel.json.JSONFactoryUtil"] />
<#assign journalArticleLocalService = serviceLocator.findService("com.liferay.journal.service.JournalArticleLocalService") />
<#assign serviceContext = staticUtil["com.liferay.portal.kernel.service.ServiceContextThreadLocal"].getServiceContext()/>
<#assign AssetCategoryLocalService = serviceLocator.findService("com.liferay.asset.kernel.service.AssetCategoryLocalService") />


<#assign themeDisplay = serviceContext.getThemeDisplay() />
<#assign siteName = layout.getGroup().friendlyURL />

<#if entries?has_content>
<div class="jmarticlegrid container">
    <div class="row cards">
		<h3 class="jmarticlegrid__heading">News and Insights</h3>
		<div class="jmarticlegrid__list">
			<#list entries as curEntry>
				<#assign 
					assetRenderer = curEntry.getAssetRenderer()
					journalArticle = assetRenderer.getAssetObject()
					document = saxReaderUtil.read(journalArticle.getContent())
					rootElement = document.getRootElement()
						
					categories = AssetCategoryLocalService.getCategories("com.liferay.journal.model.JournalArticle", journalArticle.getResourcePrimKey())
					
					xPathSelector = saxReaderUtil.createXPath("dynamic-element[@name='Name']")
					heading = xPathSelector.selectSingleNode(rootElement).getStringValue()?trim
					
					xPathSelector = saxReaderUtil.createXPath("dynamic-element[@name='SubTitle']")
					subTitle = xPathSelector.selectSingleNode(rootElement).getStringValue()?trim
					
					xPathSelector = saxReaderUtil.createXPath("dynamic-element[@name='Date']")
					publishDate = xPathSelector.selectSingleNode(rootElement).getStringValue()?trim
					
					xPathSelector = saxReaderUtil.createXPath("dynamic-element[@name='Path']")
					path = xPathSelector.selectSingleNode(rootElement).getStringValue()?trim
					
					latestUrl = "/web/"+siteName+path?keep_after("/sitecore/content/johnson-matthey")
					
					formatDate = publishDate?date("yyyy-MM-dd")
					
					siteId = themeDisplay.getSiteGroupId()
					
					jsonSmallDlFileEntryAsString = document.valueOf("//dynamic-element[@name='ImageSmall']/dynamic-content/text()")
					
					imageSmallSrc = JSONFactoryUtil.createJSONObject(jsonSmallDlFileEntryAsString).getString("uuid")
					
					jsonMediumDlFileEntryAsString = document.valueOf("//dynamic-element[@name='ImageMedium']/dynamic-content/text()")
					
					imageMediumSrc = JSONFactoryUtil.createJSONObject(jsonMediumDlFileEntryAsString).getString("uuid")
					
					jsonLargeDlFileEntryAsString = document.valueOf("//dynamic-element[@name='ImageLarge']/dynamic-content/text()")
					
					imageLargeSrc = JSONFactoryUtil.createJSONObject(jsonLargeDlFileEntryAsString).getString("uuid")
					/>
					<div class="jmarticlegrid__flex-item ctaCard">
						<div class="jmarticlegrid__thumbnail">
							<img src="/documents/${siteId}/${imageSmallSrc}" alt="tabbed article item" />
							<div class="jmarticlegrid__thumbnail-title">
								<#if categories?has_content>
								<span class="jmarticlegrid__jmarticlegrid__title-text">${categories[0].getName()} </span>
								</#if>
								<span class="jmarticlegrid__jmarticlegrid__title-date">${formatDate?string["dd 'TH' MMM yyyy"]}</span>
							</div>
							<div class="jmarticlegrid__caption-heading">
								<a href=${latestUrl} title=${heading}>${heading}</a>
							</div>
						</div>
					</div>
			</#list>
		</div>
    </div>
    <div>
  		<a class="home__btn" id="loadmoreBtn">SEE MORE ARTICLES<span class="arrow__forward"></span></a>
	</div>
</div>
</#if>

<script>
	$(document).ready(function () {
		$("#loadmoreBtn").click(function(e) {
			e.preventDefault();
			// show next 6 posts
			$(".cards .ctaCard").css("display", "block");
			// if no more posts exist to load more, hide load more button
			$(this).fadeOut(300);
		});
	});
</script>
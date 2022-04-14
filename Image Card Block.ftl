<#assign JournalArticleLocalService = serviceLocator.findService("com.liferay.journal.service.JournalArticleLocalService")>
<#assign namespace = randomNamespace />

<#if ImageLarge?? && (ImageLarge.getData())?? && ImageLarge.getData() != "">
	<div class="image-card-block image-card-block-with-img" id="image-card-block-${namespace}">
<#else>
	<div class="image-card-block" id="image-card-block-${namespace}">
</#if>
	<div class="container">
		<div class="row">
			<div class="image-card-block__inner">
				<#if Title?? && Title.getData()?has_content>
					<div class="image-card-block__header">
						<h2 class="jmimage-card-block--header">${Title.getData()}</h2>
					</div>
				</#if>
				<div class="image-card-block__body">
					<div class="image-card-block__row row">
						<#if ImageCards?? && ImageCards.getSiblings()?has_content>
							<#list ImageCards.getSiblings()?chunk(2) as imgCardlist>
								<#assign tileCount = imgCardlist?size />
								<#if tileCount == 1 >
									<#assign tileColCssClass = "col-md-12" />
									<#list imgCardlist as imgCard>
										<div class="${tileColCssClass}">
											<#assign
												webContentData = jsonFactoryUtil.createJSONObject(imgCard.getData())
											/>
											<#assign
												article = JournalArticleLocalService.getLatestArticle(getterUtil.getLong(webContentData.classPK, 0))
											/>
											<@liferay_journal["journal-article"]
												articleId = article.getArticleId()
												ddmTemplateKey = "IMAGE-CARD-LONG"
												groupId = article.getGroupId()
											/>
										</div>
									</#list>
								<#else>
									<#assign tileColCssClass = "col-md-6" />
									<#list imgCardlist as imgCard>
										<div class="${tileColCssClass}">
											<#assign
												webContentData = jsonFactoryUtil.createJSONObject(imgCard.getData())
											/>
											<#assign
												article = JournalArticleLocalService.getLatestArticle(getterUtil.getLong(webContentData.classPK, 0))
											/>
											<@liferay_journal["journal-article"]
												articleId = article.getArticleId()
												ddmTemplateKey = "IMAGE-CARD"
												groupId = article.getGroupId()
											/>
										</div>
									</#list>
								</#if>
							</#list>
						</#if>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<#if ImageLarge?? && (ImageLarge.getData())?? && ImageLarge.getData() != "">
	<style>
	    #image-card-block-${namespace} {
	        background-image: url("${ImageLarge.getData()}");
	        background-position: center;
	        background-size: cover;
	    }
	</style>
</#if>
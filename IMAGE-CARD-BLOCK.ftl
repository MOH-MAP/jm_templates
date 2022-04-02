<#assign JournalArticleLocalService = serviceLocator.findService("com.liferay.journal.service.JournalArticleLocalService")>
<div class="image-card-block container">
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
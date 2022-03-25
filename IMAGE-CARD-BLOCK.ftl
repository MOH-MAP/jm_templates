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
                    <#assign tileCount = ImageCards.getSiblings()?size />
                	<#list ImageCards.getSiblings() as cur_ImageCards>
                	    <#assign tileColCssClass = "col-md-6" />
                        <#if tileCount gte 3 >
                            <#assign tileColCssClass = "col-md-4" />
                        </#if>
                	    <div class="${tileColCssClass}">
                            <#assign
                                webContentData = jsonFactoryUtil.createJSONObject(cur_ImageCards.getData())
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
            </div>
        </div>
    </div>
</div>
<#assign JournalArticleLocalService = serviceLocator.findService("com.liferay.journal.service.JournalArticleLocalService")>
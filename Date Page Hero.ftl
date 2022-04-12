<#assign JournalArticleLocalService = serviceLocator.findService("com.liferay.journal.service.JournalArticleLocalService")>

<section class="main__sec jmdate--page-hero-temp">
    <div class="hero" style="background-image: url('background.svg');">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <#if (Title.getData())??>
                        <h1 class="datepagehero__heading">
                            ${Title.getData()}
                        </h1>
                    </#if>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div>
            <#assign webContentData=jsonFactoryUtil.createJSONObject(Event.getData()) />
            <#assign
                article = JournalArticleLocalService.getLatestArticle(getterUtil.getLong(webContentData.classPK, 0))
            />
			<@liferay_journal["journal-article"]
			    articleId = article.getArticleId()
			    ddmTemplateKey = "EVENTS"
			    groupId = article.getGroupId()
			/>
        </div>
    </div>
</section>
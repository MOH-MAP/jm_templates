<#assign namespace = randomNamespace />
<#assign JournalArticleLocalService = serviceLocator.findService("com.liferay.journal.service.JournalArticleLocalService")>

<div class="panel_block jmpanelblock" id="panel_block-${namespace}">
    <div class="container">
        <header class="jmpanelblock__header">
            <h1>${Title.getData()}</h2>
        </header>
        <#if Panels?? && Panels.getSiblings()?? && Panels.getSiblings()?has_content>
            <div class="row">
                <#list Panels.getSiblings() as cur_Panels>
                    <div class="col-sm-12 col-md-6">
                        <#assign
                            webContentData = jsonFactoryUtil.createJSONObject(cur_Panels.getData())
                        />
                        <#assign
                            article = JournalArticleLocalService.getLatestArticle(getterUtil.getLong(webContentData.classPK, 0))
                        />
        				<@liferay_journal["journal-article"]
        				    articleId = article.getArticleId()
        				    ddmTemplateKey = "TEXT-PANEL"
        				    groupId = article.getGroupId()
        				/>
                    </div>
                </#list>
            </div>
        </#if>
    </div>
</div>

<style>
    #panel_block-${namespace} {
        background-image: url(${ImageLarge.getData()});
        background-position: center;
    	background-size: cover;
        padding: 7.5rem 0;
    }
</style>
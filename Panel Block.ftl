<#assign namespace = randomNamespace />
<#assign JournalArticleLocalService = serviceLocator.findService("com.liferay.journal.service.JournalArticleLocalService")>

<div class="panel_block jmpanelblock" id="panel_block-${namespace}">
    <div class="container">
        <header class="jmpanelblock__header">
            <h1>${Title.getData()}</h2>
        </header>
        <#if Panels?? && Panels.getSiblings()?? && Panels.getSiblings()?has_content>
            <div class="row jmpanelblock__row">
                <#list Panels.getSiblings() as cur_Panels>
                    <#if Panels.getSiblings()?size == 1>
                        <#assign colClass = "col-sm-12 col-md-12" />
                    <#else>
                        <#assign colClass = "col-sm-12 col-md-6" />
                    </#if>
                    <div class="${colClass}">  
                        <#assign
                            webContentData = jsonFactoryUtil.createJSONObject(cur_Panels.getData())
                        />
                        <#assign
			                article = JournalArticleLocalService.getLatestArticle(getterUtil.getLong(webContentData.classPK, 0))
			            />
			            <#assign tpl = "TEXT-PANEL" />
			            <#if article.DDMStructureKey == "STATISTIC-PANEL">
			            	<#assign tpl = "STATISTIC-PANEL" />
						<#elseif article.DDMStructureKey == "STOCK-PANEL">
							<#assign tpl = "STOCK-PANEL" />
						</#if>
						<@liferay_journal["journal-article"]
						    articleId = article.getArticleId()
						    ddmTemplateKey = tpl
						    groupId = article.getGroupId()
						/>
                    </div>
                </#list>
            </div>
        </#if>
    </div>
</div>

<#if (ImageLarge.getData())?? && ImageLarge.getData() != "">
<style>
    #panel_block-${namespace} {
        background-image: url(${ImageLarge.getData()});
        background-position: center;
    	background-size: cover;
        padding: 7.5rem 0;
    }
</style>
</#if>
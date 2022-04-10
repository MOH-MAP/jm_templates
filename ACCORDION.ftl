<#assign JournalArticleLocalService = serviceLocator.findService("com.liferay.journal.service.JournalArticleLocalService")>

<div class="container jmaccrdn">
<#if Sections?? && (Sections.getSiblings())?? && Sections.getSiblings()?has_content>
	<#if (Title.getData())?? && Title.getData()?has_content>
		<h1 class="jmaccrdn__heading">
	        ${Title.getData()}
    	</h1>
	</#if>
	<div class="accordion" id="accordion">
		<#list Sections.getSiblings() as cur_Sections>
			<#assign
			    webContentData = jsonFactoryUtil.createJSONObject(cur_Sections.getData())
			/>
            <#assign
                article = JournalArticleLocalService.getLatestArticle(getterUtil.getLong(webContentData.classPK, 0))
            />
			<@liferay_journal["journal-article"]
			    articleId = article.getArticleId()
			    ddmTemplateKey = "ACCORDION-SECTION"
			    groupId = article.getGroupId()
			/>
		</#list>
	</div>
</#if>
</div>
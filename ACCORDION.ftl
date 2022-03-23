<#assign JournalArticleLocalService = serviceLocator.findService("com.liferay.journal.service.JournalArticleLocalService")>

<div class="container jmaccrdn">
	<#if (Title.getData())??>
		<h1 class="jmaccrdn__heading">
	        ${Title.getData()}
    	</h1>
	</#if>
	<div class="accordion" id="accordion">
		<#if (Sections.getSiblings())?? && Sections.getSiblings()?has_content>
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
		</#if>
	</div>
</div>
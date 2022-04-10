<#assign JournalArticleLocalService = serviceLocator.findService("com.liferay.journal.service.JournalArticleLocalService")>
<#assign href = '#' >

<div class="container jmtwo--person-temp">
    <#if (Title.getData())??>
        <h1 class="person-heading_align">
	        ${Title.getData()}
        </h1>
    </#if>
    <#if (SubTitle.getData())??>
	    <h6 class="person-subheading_align">
	        ${SubTitle.getData()}
	    </h6>
    </#if>

    <#if Link_Title?? && Link_Title.getData()?has_content>
        <#assign title = Link_Title.getData()>
		<#if Link_Title.Link_Internal?? && Link_Title.Link_Internal.getFriendlyUrl()?has_content>
			<#assign href = Link_Title.Link_Internal.getFriendlyUrl() >
		<#elseif Link_Title.Link_Mailto?? && Link_Title.Link_Mailto.getData()?has_content>
			<#assign href = Link_Title.Link_Mailto.getData() >
		<#elseif Link_Title.Link_Media?? && Link_Title.Link_Media.getData()?has_content>
			<#assign href = Link_Title.Link_Media.getData() >
		<#elseif Link_Title.Link_External?? && Link_Title.Link_External.getData()?has_content>
			<#assign href = Link_Title.Link_External.getData() >
		<#elseif Link_Title.Link_Target?? && Link_Title.Link_Target.getData()?has_content>
			<#assign href = Link_Title.Link_Target.getData() >
		</#if>
		<div class="btn__listblock">
    		<a class="list_inner_link" href="${href}" title="${title}">
    			<span>${title}</span>
    			<span class="list__link-icon"></span>
    		</a>
	    </div>
	</#if>

    <div class="two-person-grid container">
        <#if (People.getSiblings())?? && People.getSiblings()?has_content>
            <#list People.getSiblings() as cur_People>
                <#assign
                    webContentData = jsonFactoryUtil.createJSONObject(cur_People.getData())
                />
                <#assign
                    article = JournalArticleLocalService.getLatestArticle(getterUtil.getLong(webContentData.classPK, 0))
                />
				<@liferay_journal["journal-article"]
				    articleId = article.getArticleId()
				    ddmTemplateKey = "PERSON"
				    groupId = article.getGroupId()
				/>
            </#list>
        </#if>
    </div>
</div>
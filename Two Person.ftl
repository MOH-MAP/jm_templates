<#assign href = '#' >

<div class="container mt-6 jmtwo--person-temp">
    <h1 class="person-heading_align">${Title.getData()}</h1>
    <#if (SubTitle.getData())??>
        <h6 class="person-subheading_align">
            ${SubTitle.getData()}
        </h6>
    </#if>
    
    <#if Link_Title.getData()?has_content>
        <#assign title = Link_Title.getData()>
		<#if Link_Title.Link_Internal.getFriendlyUrl()?has_content>
			<#assign href = Link_Title.Link_Internal.getFriendlyUrl() >
		<#elseif Link_Title.Link_Mailto.getData()?has_content>
			<#assign href = Link_Title.Link_Mailto.getData() >
		<#elseif Link_Title.Link_Media.getData()?has_content>
			<#assign href = Link_Title.Link_Media.getData() >
		<#elseif Link_Title.Link_External.getData()?has_content>
			<#assign href = Link_Title.Link_External.getData() >
		<#elseif Link_Title.Link_Target.getData()?has_content>
			<#assign href = Link_Title.Link_Target.getData() >
		</#if>
		<div class="btn__listblock">
    		<a class="list_inner_link" href="${href}">
    			<span>${title}</span>
    			<span class="list__link-icon"></span>
    		</a>
	    </div>
	</#if>
    
    <div class="two-person-grid container">
        <#if People.getSiblings()?has_content>
            <#list People.getSiblings() as cur_People>
                <#assign
                    webContentData = jsonFactoryUtil.createJSONObject(cur_People.getData())
                />
                <@liferay_asset["asset-display"]
                    className = webContentData.className
                    classPK = getterUtil.getLong(webContentData.classPK, 0)
                />
            </#list>
        </#if>
    </div>
</div>

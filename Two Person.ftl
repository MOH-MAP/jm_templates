<#assign href = '#' >

<div class="container mt-6">
    <h1 class="person-heading_align">${Title.getData()}</h1>
        <h6 class="person-subheading_align">
            <#if (SubTitle.getData())??>
    	        ${SubTitle.getData()}
            </#if>
        </h6>
    </h1>
    
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

<style>
.two-person-grid {
    padding : 0rem !important;
}

.person-grid .person_card {
    border: 1px solid #e5e5e5;
    padding: 1.25rem;
    width: 100%;
}

.portlet-journal-content .journal-content-article img {
    position: unset;
    height: 100%;
}

.journal-content-article[data-analytics-asset-title='Fuel-Cell-Contact'] .two-person-grid {
    margin-right: 0px;
    padding: 60px 60px 60px 0px !important;
}

.journal-content-article[data-analytics-asset-title='Fuel-Cell-Contact'] .person-heading_align {
    padding-left: 0px !important;
}
</style>
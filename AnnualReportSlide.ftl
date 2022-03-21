<#assign namespace = randomNamespace />
<#assign href = '#' >

<#assign layoutService = serviceLocator.findService("com.liferay.portal.kernel.service.LayoutLocalService") />
<#assign serviceContext = staticUtil["com.liferay.portal.kernel.service.ServiceContextThreadLocal"].getServiceContext() />
<#assign themeDisplay = serviceContext.getThemeDisplay() />

<#assign layoutname = themeDisplay.getLayout().getName(themeDisplay.getLocale()) />

<style>
    #annual-report-slide-${namespace} {
    	background-image: url("${ImageLarge.getData()}");
    	background-position: center;
    	background-size: cover;
    }
    .hero-panels {
        background-color: var(--jmEgyptianBlue-color);
    }
    .annual-result-slide-panel.white-border{
        border-left: 2px white solid;
    }
</style>

<div id="annual-report-slide-${namespace}" class="annual-report-slide">
    <div class="container banner py-6 py-md-8 text-break">
        <div class="row">
            <div class="hero-header col-md-8 mb-2">
                <h1 class="hero-title">${Title.getData()}</h1>
                <div class="hero-subtitle">${Subtitle.getData()}</div>
            </div>
        </div>
        <div class="row">
            <div class="hero-links col-md-4">
                <#if Links_Title.getSiblings()?has_content>
	                <#list Links_Title.getSiblings() as cur_Links_Title>
                			<#if cur_Links_Title.Links_Internal.getFriendlyUrl()?has_content>
                				<#assign href = cur_Links_Title.Links_Internal.getFriendlyUrl() >
                			<#elseif cur_Links_Title.Links_Mailto.getData()?has_content>
                				<#assign href = cur_Links_Title.Links_Mailto.getData() >
                			<#elseif cur_Links_Title.Links_Media.getData()?has_content>
                				<#assign href = cur_Links_Title.Links_Media.getData() >
                			<#elseif cur_Links_Title.Links_External.getData()?has_content>
                				<#assign href = cur_Links_Title.Links_External.getData() >
                			<#elseif cur_Links_Title.Links_Target.getData()?has_content>
                				<#assign href = cur_Links_Title.Links_Target.getData() >
                			</#if>
                		<a href="${href}" class="col-12 mb-2 hero-link btn btn-primary text-right">
                            ${layoutname}
                        </a>
	                </#list>
                </#if>
            </div>
        </div>
    </div>
    
    <#if !getterUtil.getBoolean(HideScrollArrow.getData())>
        <div class="hero-scroll">
            <a href="#"></a>
        </div>
    </#if>

    <#if Panels.getSiblings()?has_content>
        <div class="hero-panels text-white">
            <div class="row no-gutters">
                <#if Panels.getSiblings()?size == 1>
                    <#assign colSize = 8 />
                <#elseif Panels.getSiblings()?size == 2>
                    <#assign colSize = 4 />
                <#elseif Panels.getSiblings()?size == 3>
                    <#assign colSize = 3 />
                <#elseif Panels.getSiblings()?size == 4>
                    <#assign colSize = 2 />
                </#if>
                <div class="col-md-2"></div>
            	<#list Panels.getSiblings() as cur_Panels>
            	    <div class="col-${colSize} p-4 annual-result-slide-panel ${cur_Panels?is_first?then('','white-border')}">
                		<#assign
                			webContentData = jsonFactoryUtil.createJSONObject(cur_Panels.getData())
                		/>
                		<@liferay_asset["asset-display"]
                            className = webContentData.className
                            classPK = getterUtil.getLong(webContentData.classPK, 0)
                        />
                    </div>
            	</#list>
            	<div class="col-md-2"></div>
            </div>
        </div>
    </#if>
</div>
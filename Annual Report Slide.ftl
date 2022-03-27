<#assign namespace = randomNamespace />
<#assign href = '#' >
<#assign layoutService = serviceLocator.findService("com.liferay.portal.kernel.service.LayoutLocalService") />
<#assign serviceContext = staticUtil["com.liferay.portal.kernel.service.ServiceContextThreadLocal"].getServiceContext() />
<#assign themeDisplay = serviceContext.getThemeDisplay() />
<#assign layoutname = themeDisplay.getLayout().getName(themeDisplay.getLocale()) />

<section class="main__sec jmannual--main-container"> 
    <div id="annual-report-slide-${namespace} jmannual--rs-temp" class="annual-report-slide">
        <div class="container annual__report">
            <#if (Title.getData())??>
                <h1 class="panel__heading">${Title.getData()}</h1>
            </#if>
			<p>${Subtitle.getData()}</p>
            <#if Links_Title.getSiblings()?has_content>
                <#list Links_Title.getSiblings() as cur_Links_Title>
                    <#if cur_Links_Title.Links_Internal?? && cur_Links_Title.Links_Internal.getFriendlyUrl()?has_content>
                        <#assign href = cur_Links_Title.Links_Internal.getFriendlyUrl() >
                    <#elseif cur_Links_Title.Links_Mailto?? && cur_Links_Title.Links_Mailto.getData()?has_content>
                        <#assign href = cur_Links_Title.Links_Mailto.getData() >
                    <#elseif cur_Links_Title.Links_Media?? && cur_Links_Title.Links_Media.getData()?has_content>
                        <#assign href = cur_Links_Title.Links_Media.getData() >
                    <#elseif cur_Links_Title.Links_External?? && cur_Links_Title.Links_External.getData()?has_content>
                        <#assign href = cur_Links_Title.Links_External.getData() >
                    <#elseif cur_Links_Title.Links_Target?? && cur_Links_Title.Links_Target.getData()?has_content>
                        <#assign href = cur_Links_Title.Links_Target.getData() >
                    </#if>
                    <button class="panel__btn"> 
                        <a href="${href}" title="${layoutname}">${layoutname}</a>
                        <span class="arrow__forward"></span>
                    </button>
                </#list>
            </#if>
        </div> 
        <div class="scroll__sec">
			<#if getterUtil.getBoolean(HideScrollArrow.getData())>
				<img class="viewnext__img" src="scroll_arrow.svg" alt=""> <a href="#"></a>
			<#else>
				<img class="viewnext__img" src="scroll_arrow.svg" alt=""> <a href="#"></a>
			</#if>
		</div>
    </div>
  
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
</section>

<style>
    #annual-report-slide-${namespace} {
        background-image: url("${ImageLarge.getData()}");
    }
</style>

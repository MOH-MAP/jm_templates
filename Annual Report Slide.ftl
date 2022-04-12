<#assign namespace = randomNamespace />
<#assign href = '#' >
<#assign JournalArticleLocalService = serviceLocator.findService("com.liferay.journal.service.JournalArticleLocalService")>

<section class="main__sec jmannual--main-container"> 
    <div id="annual-report-slide-${namespace}" class="annual-report-slide jmannual--rs-temp">
        <div class="container annual__report">
            <#if (Title.getData())??>
                <h1 class="panel__heading">${Title.getData()}</h1>
            </#if>
			<#if (Subtitle.getData())??>
                <p>${Subtitle.getData()}</p>
            </#if>
            <#if Links_Title?? && Links_Title.getSiblings()?has_content>
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
			<#if HideScrollArrow?? && getterUtil.getBoolean(HideScrollArrow.getData())>
				<img class="viewnext__img" src="scroll_arrow.svg" alt=""> <a href="#"></a>
			<#else>
				<img class="viewnext__img" src="scroll_arrow.svg" alt=""> <a href="#"></a>
			</#if>
		</div>
    </div>

    <#if Panels?? && Panels.getSiblings()?has_content>
        <div class="hero-panels text-white">
        <div class="container">
            <div class="row no-gutters">
                 <#if Panels.getSiblings()?size == 1>
                    <#assign colClass = "col-12" />
                <#elseif Panels.getSiblings()?size == 2>
                    <#assign colClass = "col-sm-12 col-md-6" />
                <#elseif Panels.getSiblings()?size == 3>
                    <#assign colClass = "col-sm-12 col-md-4" />
                <#elseif Panels.getSiblings()?size == 4>
                    <#assign colClass = "col-sm-12 col-md-3" />
                </#if>
            <#list Panels.getSiblings() as cur_Panels>
           <div class="${colClass} hero-panels-panel ${cur_Panels?is_first?then('','white-border')}">
						<#assign
                            webContentData = jsonFactoryUtil.createJSONObject(cur_Panels.getData())
                        />
                       	<#assign
			                article = JournalArticleLocalService.getLatestArticle(getterUtil.getLong(webContentData.classPK, 0))
			            />
			            <#assign tpl = "TEXT-PANEL" />
			            <#if article.DDMStructureKey == "STATISTIC-PANEL">
			            	<#assign tpl = "STATISTIC-PANEL" />
						<#elseif article.DDMStructureKey == "STOCKS-PANEL">
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
            </div>
        </div>
    </#if>
</section>
<#if (ImageLarge.getData())?? && ImageLarge.getData() != "">
<style>
    #annual-report-slide-${namespace} {
        background-image: url("${ImageLarge.getData()}");
    }
</style>
</#if>
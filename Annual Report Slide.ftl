<#assign JournalArticleLocalService = serviceLocator.findService("com.liferay.journal.service.JournalArticleLocalService")>
<#assign namespace = randomNamespace />
<section class="main__sec jmannual--main-container"> 
    <div id="annual-report-slide-${namespace}" class="annual-report-slide jmannual--rs-temp">
        <video class="jmannual__video" muted="" loop="" playsinline="" autoplay="true">
            <source src="https://matthey.com/-/media/ara-21/sustainability-images/landscape-mountains-new-medium-quality.mp4" type="video/mp4">
        </video>
        <div class="container annual__report">
            <#if (Title.getData())??>
                <h1 class="panel__heading">${Title.getData()}</h1>
            </#if>
            <#if (Subtitle.getData())??>
                <p>${Subtitle.getData()}</p>
            </#if>
            <#if AdditionalLinks_Title?? && AdditionalLinks_Title.getSiblings()?? && AdditionalLinks_Title.getSiblings()?has_content>
                <#assign href = '#' >
                <#assign title = 'Explore'>
                <#assign target = '' >
                <div class="panel__btnlist">
                    <#list AdditionalLinks_Title.getSiblings() as cur_AdditionalLinks_Title>
                        <#if (cur_AdditionalLinks_Title.getData())?? && cur_AdditionalLinks_Title.getData()?has_content>
                            <#assign title = cur_AdditionalLinks_Title.getData()>
                            <#if cur_AdditionalLinks_Title.AdditionalLinks_Internal?? && 
                                cur_AdditionalLinks_Title.AdditionalLinks_Internal.getFriendlyUrl()?has_content>
                                <#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Internal.getFriendlyUrl() >
                            <#elseif cur_AdditionalLinks_Title.AdditionalLinks_Media?? &&
                                cur_AdditionalLinks_Title.AdditionalLinks_Media.getData()?has_content>
                                <#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Media.getData() >
                            <#elseif cur_AdditionalLinks_Title.AdditionalLinks_Mailto?? && 
                                cur_AdditionalLinks_Title.AdditionalLinks_Mailto.getData()?has_content>
                                <#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Mailto.getData() >
                            <#elseif cur_AdditionalLinks_Title.AdditionalLinks_External?? && 
                                cur_AdditionalLinks_Title.AdditionalLinks_External.getData()?has_content>
                                <#assign href = cur_AdditionalLinks_Title.AdditionalLinks_External.getData() >
                            </#if>
                            <#if cur_AdditionalLinks_Title.AdditionalLinks_Target?? &&
                                cur_AdditionalLinks_Title.AdditionalLinks_Target.getData()?has_content>
                                <#assign target = cur_AdditionalLinks_Title.AdditionalLinks_Target.getData() >
                            </#if>
                            <a class="panel__btn" href="${href}" title="${title}">
                                <span class='panel__btntext'>${title}</span>
                                <span class="arrow__forward"></span>
                            </a>
                        </#if>
                    </#list>
                </div>
            </#if>
        </div>
        <#if HideScrollArrow?? && getterUtil.getBoolean(HideScrollArrow.getData())>
        <#else>
            <div class="scroll__sec">
                <a href="#sectionend-${namespace}"></a>
            </div>
        </#if>
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
<div id="sectionend-${namespace}" />
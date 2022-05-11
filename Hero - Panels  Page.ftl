<#assign JournalArticleLocalService = serviceLocator.findService("com.liferay.journal.service.JournalArticleLocalService")>
<#assign namespace = randomNamespace />

<#if (ImageLarge.getData())?? && ImageLarge.getData() != "">
	<style>
	    #panels-hero-${namespace} {
	        background-image: url("${ImageLarge.getData()}");
	        background-position: center;
	        background-size: cover;
            background-attachment: fixed;
	    }
	</style>
</#if>

<div id="panels-hero-${namespace}" class="panels-hero jmpanels--hero-temp">
    <div class="banner container py-6 py-md-8">
        <#if (Title.getData())??>
            <div class="row">
                <div class="col-12">
                    <div class="panels-hero-header">
                        <h1> ${Title.getData()}</h1>
                    </div>
                </div>
            </div>
        </#if>
        <div class="row">
            <#if (Summary.getData())??>
                <div class="col-12">
                    <div class="panels-hero-para">
                        ${Summary.getData()}
                    </div>
                </div>
            </#if>
            <div class="col-12 panel__btnlist">
                <#if AdditionalLinks_Title?? && AdditionalLinks_Title.getSiblings()?has_content>
                    <#assign href = '#' >
                    <#assign title = 'Explore'>
                    <#list AdditionalLinks_Title.getSiblings() as cur_AdditionalLinks_Title>
                        <#if cur_AdditionalLinks_Title?? && cur_AdditionalLinks_Title.getData()?has_content>
                            <#assign title = cur_AdditionalLinks_Title.getData()>
                            <#if cur_AdditionalLinks_Title.AdditionalLinks_Internal?? && cur_AdditionalLinks_Title.AdditionalLinks_Internal.getFriendlyUrl()?has_content>
                                <#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Internal.getFriendlyUrl() >
                            <#elseif cur_AdditionalLinks_Title.AdditionalLinks_Media?? && cur_AdditionalLinks_Title.AdditionalLinks_Media.getData()?has_content>
                                <#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Media.getData() >
                            <#elseif cur_AdditionalLinks_Title.AdditionalLinks_Mailto?? && cur_AdditionalLinks_Title.AdditionalLinks_Mailto.getData()?has_content>
                                <#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Mailto.getData() >
                            <#elseif cur_AdditionalLinks_Title.AdditionalLinks_External?? && cur_AdditionalLinks_Title.AdditionalLinks_External.getData()?has_content>
                                <#assign href = cur_AdditionalLinks_Title.AdditionalLinks_External.getData() >
                            <#elseif cur_AdditionalLinks_Title.AdditionalLinks_Target?? && cur_AdditionalLinks_Title.AdditionalLinks_Target.getData()?has_content>
                                <#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Target.getData() >
                            </#if>
                                <a class="panel__btn" href="${href}" title="${title}">
                                    <span class='panel__btntext'>${title}</span>
                                    <span class="arrow__forward"></span>
                                </a>
                        </#if>
                    </#list>
                </#if>
            </div>
        </div>
    </div>

    <#if Panels?? && Panels.getSiblings()?? && Panels.getSiblings()?has_content>
        <div class="panels-hero-panels">
            <div class="container">
                <div class="row">
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
            </div>
        </div>
    </#if>
</div>
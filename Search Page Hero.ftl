<#assign namespace = randomNamespace />

<#if (ImageLarge.getData())?? && ImageLarge.getData() != "">
<style>
    #search-hero-${namespace} {
        background: url("${ImageLarge.getData()}") no-repeat transparent;
        background-position: center;
	    background-size: cover;
    }
</style>
</#if>

<div class="banner text-break search-hero" id="search-hero-${namespace}">
	<div class="container py-6 py-md-8">
		<div class="row">
			<div class="col-12">
				<div class="service__sec banner">
					<#if (Summary.getData())??>
                    	<p class="service__pretitle">${Summary.getData()}</p>
                    </#if>
                    <h1 class="service__heading">${Title.getData()}</h1>

                    <div class="service__input__sec">
                        <div class="service__input">

	                        <#assign searchTargetPage = layout.getFriendlyURL() />
	
	                        <#if SearchTargetPage?? && SearchTargetPage.getData()?has_content 
	                        	&& SearchTargetPage.getFriendlyUrl()?has_content >
	
	                        	<#assign LayoutLocalService = 
	                        		serviceLocator.findService("com.liferay.portal.kernel.service.LayoutLocalService") >
								<#assign layoutData = jsonFactoryUtil.createJSONObject(SearchTargetPage.getData()) />
	
								<#assign searchTargetPage = 
									LayoutLocalService.getLayout(layoutData.groupId, 
										layoutData.privateLayout,
										getterUtil.getLong(layoutData.layoutId)).getFriendlyURL()
								/>
	                        </#if>
	
							<#assign searchBarPreferencesMap = 
								{
									"portletSetupPortletDecoratorId": "barebone", 
									"destination": searchTargetPage
								}
							/>
	
							<@liferay_portlet["runtime"]
								defaultPreferences = freeMarkerPortletPreferences.getPreferences(searchBarPreferencesMap)
								instanceId = namespace
								portletProviderAction = portletProviderAction.VIEW
								portletProviderClassName = "com_liferay_portal_search_web_search_bar_portlet_SearchBarPortlet"
							/>
	
	                        <div class="button__sec">
	                            <button class="submit__btn" id="submit-btn-${namespace}">
		                            ${SearchButtonText.getData()}
	                                <span class="arrow__forward"></span>
	                            </button>
	                        </div>
                        </div>
                    </div>
                </div>
			</div>
		</div>
	</div>
</div>

<script>
$(document).ready(function () {
    var searchBar = $(".service__input .search-bar-keywords-input");
    searchBar.attr("placeholder", "${SearchInputPlaceholder.getData()}");
    searchBar.attr("autocomplete", "off");

    $('#submit-btn-${namespace}').click(function() {
        searchBar.parent().find('.btn').click();
    });
});
</script>
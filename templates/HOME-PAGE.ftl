<#assign namespace = randomNamespace />
<#assign layoutService = serviceLocator.findService("com.liferay.portal.kernel.service.LayoutLocalService") />
<#assign serviceContext = staticUtil["com.liferay.portal.kernel.service.ServiceContextThreadLocal"].getServiceContext() />
<#assign themeDisplay = serviceContext.getThemeDisplay() />

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js" ></script>

<#assign x=3>
<div class="owl-carousel owl-theme matthey--carousel " id="owl-demo">
<#list 1..x as i>
<div class="slide slide-1 ">
<div class="slide-content ">
<h1 class="homehero__heading">
<#if (Title.getData())??>
	${Title.getData()}
</#if></h1>
<p class="homehero__para">
<#if (SubTitle.getData())??>
	${SubTitle.getData()}
</#if></p>
<#if SearchPage_Title?? && SearchPage_Title.getData()?has_content>
               <#assign linkHref = "#" />
               <#assign title = SearchPage_Title.getData()>
                    <#if SearchPage_Title.SearchPage_Internal.getFriendlyUrl()?has_content>
                        <#assign linkHref = SearchPage_Title.SearchPage_Internal.getFriendlyUrl() />
                        <#elseif SearchPage_Title.SearchPage_Media.getData()?has_content>
                            <#assign linkHref = SearchPage_Title.SearchPage_Media.getData() />
                        <#elseif SearchPage_Title.SearchPage_Mailto.getData()?has_content>
                            <#assign linkHref = "mailto:" + SearchPage_Title.SearchPage_Mailto.getData() />
                        <#elseif SearchPage_Title.SearchPage_External.getData()?has_content>
                            <#assign linkHref = SearchPage_Title.SearchPage_External.getData() />
                         <#elseif SearchPage_Title.SearchPage_Target.getData()?has_content>
                            <#assign linkHref = SearchPage_Title.SearchPage_Target.getData() />
                        </#if>
                           <div class="panel__btn">
                                <a class="home__btn" href="${linkHref}">${title}
                                <span class="arrow__forward"></span></a>
                          </div>
                </#if>
</div>
</div>
</#list>
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
<div class="col-${colSize} p-4 hero-panels-panel ${cur_Panels?is_first?then('','white-border')}">
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
<script>
$(document).ready(function($) {
var autoPlaySpeed = 7000;
$("#owl-demo").owlCarousel({
loop: true,
items: 1,
nav: true,
autoplay: true,
autoplayTimeout: autoPlaySpeed
});
});
</script>
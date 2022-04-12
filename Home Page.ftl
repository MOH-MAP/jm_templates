<#assign JournalArticleLocalService = serviceLocator.findService("com.liferay.journal.service.JournalArticleLocalService")>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js" ></script>

<#assign namespace = randomNamespace />
<#assign x=3>

<#if (ImageLarge.getData())?? && ImageLarge.getData() != "">
<style>
   #home-hero-${namespace} {
	   background-image: url("${ImageLarge.getData()}");
	   background-position: center;
	   background-size: cover;
   }
</style>
</#if>

<div class="owl-carousel owl-theme matthey--carousel "  id="home-hero-${namespace}">
	<#list 1..x as i>
		<div class="slide slide-1">
			<div class="slide-content">
				<#if (Title.getData())??>
					<h1 class="homehero__heading">${Title.getData()}</h1>
				</#if>
				<#if (SubTitle.getData())??>
					<p class="homehero__para">
						${SubTitle.getData()}
					</p>
				</#if>
				<#if SearchPage_Title?? && SearchPage_Title.getData()?has_content>
					<#assign linkHref = "#" />
					<#assign title = SearchPage_Title.getData() />
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
                        <div>
							<a class="home__btn" href="${linkHref}">${title}
								<span class="arrow__forward"></span>
							</a>
			            </div>
                   </#if>
            </div>
        </div>
	</#list>
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

<script>
$(document).ready(function($) {
    var autoPlaySpeed = 7000;
    $(".owl-carousel").owlCarousel({
        loop: true,
        items: 1,
        nav: true,
        autoplay: true,
        autoplayTimeout: autoPlaySpeed
    });
});
</script>
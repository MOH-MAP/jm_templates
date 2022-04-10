<#assign JournalArticleLocalService = serviceLocator.findService("com.liferay.journal.service.JournalArticleLocalService")>
<#assign namespace = randomNamespace />

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js" ></script>

<div class="container jm__slideshow jmslide--show-temp">
    <div class="owl-carousel owl-theme " id="owl-slideshow-${namespace}">
        <#if Slides.getSiblings()?has_content>
            <#list Slides.getSiblings() as cur_Slides>
                <div class="item" data-dot="<button class='pagination__value'>${cur_Slides?index + 1}</button>">
                	<#assign webContentData = jsonFactoryUtil.createJSONObject(cur_Slides.getData())/>
                    <#assign
		                article = JournalArticleLocalService.getLatestArticle(getterUtil.getLong(webContentData.classPK, 0))
		            />
					<@liferay_journal["journal-article"]
					    articleId = article.getArticleId()
					    ddmTemplateKey = "SLIDE"
					    groupId = article.getGroupId()
					/>
                </div>
        	</#list>
        </#if>
    </div>
    <div id='carousel-custom-dots-${namespace}' class='owl-dots'>
    </div>
</div>

<script>
    $(document).ready(function($) {
        var autoPlaySpeed = 7000;
        $("#owl-slideshow-${namespace}").owlCarousel({
            loop: false,
            items: 1,
            autoplay: false,
            autoplayTimeout: autoPlaySpeed,

            dots: true,
            dotsData: true,
            nav: true,
            dotsContainer: '#carousel-custom-dots-${namespace}',
            navText: ["<span class='previous__icon'></span>","<span class='next__icon'></span>"]
        });
    });
</script>
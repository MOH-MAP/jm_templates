<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js" ></script>

<div class="container jm__slideshow jmslide--show-temp">
    <div class="owl-carousel owl-theme " id="owl-slideshow">
        <#if Slides.getSiblings()?has_content>
            <#list Slides.getSiblings() as cur_Slides>
                <div class="item" data-dot="<button class='pagination__value'>${cur_Slides?index + 1}</button>">
                	<#assign webContentData = jsonFactoryUtil.createJSONObject(cur_Slides.getData())/>
                    <@liferay_asset["asset-display"]
                        className = webContentData.className
                        classPK = getterUtil.getLong(webContentData.classPK, 0)
                    />
                </div>
        	</#list>
        </#if>
    </div>
    <div id='carousel-custom-dots' class='owl-dots'>
    </div>
</div>
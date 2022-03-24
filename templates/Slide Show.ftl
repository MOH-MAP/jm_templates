<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js" ></script>

<div class="container jm__slideshow">
    <div class="owl-carousel owl-theme " id="owl-slideshow">
        <#if Slides.getSiblings()?has_content>
            <#list Slides.getSiblings() as cur_Slides>
                <div class="item" data-dot="<button class='pagination__value active'>${cur_Slides?index + 1}</button>">
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

<style>
#carousel-custom-dots {
    display : flex;
}

.jm__slideshow .owl-dot {
    margin: 20px;
    border: none !important;
    background: transparent !important;
}
.jm__slideshow{
    margin-top: 50px;
    margin-bottom: 50px;
}
.jm__slideshow button{
    outline: none;
    border: none;
    position: absolute;
    top: 4rem;
}
}
.previous__icon{ 
        background: url("/o/jm-platinum-theme/images/new__jm__images/keyboard_arrow_left-black-48dp.svg") 0 0 no-repeat transparent;
        display: block;
        width: 24px;
        height: 24px;
        margin-right: 28px;
        top: 50%;
        margin-top: 5px;
}
.next__icon{
    background: url("/o/jm-platinum-theme/images/new__jm__images/keyboard_arrow_right-black-48dp.svg") 0 0 no-repeat transparent;
    display: block;
    width: 24px;
    height: 24px;
    margin-left: 28px;
    top: 50%;
    margin-top: 5px; 
}
.pagination {
    display: flex;
}

.pagination__value.active{
    text-align: left;
    font-size: 18px;
    line-height: 26px;
    font-family: JMSansMedium;
letter-spacing: 0px;
color: #FFFFFF;
opacity: 0.9;
background-color: #1E22AA;
padding: 11px 15px;
}
.pagination__value{
    text-align: left;
    font-size: 18px;
    line-height: 26px;
    font-family: JMSansRegular; 
    letter-spacing: 0px;
color: #666666;
opacity: 0.9;
background-color: #FAFAFA;
padding: 11px 15px;
}


</style>

<script>
    $(document).ready(function($) {
        var autoPlaySpeed = 7000;
        $("#owl-slideshow").owlCarousel({
            loop: false,
            items: 1,
            autoplay: false,
            autoplayTimeout: autoPlaySpeed,
            
            dots: true,
            dotsData: true,
            nav: true,
            dotsContainer: '#carousel-custom-dots',
            navText: ["<span class='previous__icon'></span>","<span class='next__icon'>
            </span>"]
        });
    });
</script>
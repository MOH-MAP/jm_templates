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

<style>
.jm__slideshow.jmslide--show-temp #carousel-custom-dots {
    display : flex;
    justify-content: center;
}

.jm__slideshow.jmslide--show-temp .owl-dot {
    margin: 0px;
    border: none;
    background: #FAFAFA 0% 0% no-repeat padding-box;
    opacity: 1;
    border-right: 0.1px solid transparent;
}
.jm__slideshow.jmslide--show-temp .owl-dot.active>.pagination__value {
    text-align: left;
    font-size: 18px;
    font-family: JMSansMedium;
    letter-spacing: 0px;
    color: #1E22AA;
    opacity: 0.9;
    background: #FAFAFA 0% 0% no-repeat padding-box;
    opacity: 1;
    border: none;
    padding: 5px 20px 5px 20px;
}
.jm__slideshow.jmslide--show-temp .owl-dot>.pagination__value {
    text-align: left;
    letter-spacing: 0px;
    font-size: 18px;
    font-family: JMSansMedium;
    color: #666666;
    opacity: 0.9;
    background: #FAFAFA 0% 0% no-repeat padding-box;
    opacity: 1;
    border: none;
    padding: 5px 20px 5px 20px;
}
.jm__slideshow.jmslide--show-temp{
    margin-top: 50px;
    margin-bottom: 50px;
}

.jm__slideshow.jmslide--show-temp .previous__icon{
        background: url("/o/jm-platinum-theme/images/new__jm__images/chevron-left-blue.svg") 0 0 no-repeat transparent;
        display: block;
        width: 24px;
        height: 24px;
        margin-right: 28px;
        top: 50%;
        margin-top: 5px;
}
.jm__slideshow.jmslide--show-temp .next__icon{
    background: url("/o/jm-platinum-theme/images/new__jm__images/chevron-right-blue.svg") 0 0 no-repeat transparent;
    display: block;
    width: 24px;
    height: 24px;
    margin-left: 28px;
    top: 50%;
    margin-top: 5px;
}
.jm__slideshow.jmslide--show-temp .pagination {
    display: flex;
}

.jm__slideshow.jmslide--show-temp .pagination__value.active{
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
.jm__slideshow.jmslide--show-temp .pagination__value{
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
.jm__slideshow.jmslide--show-temp .owl-carousel .owl-nav {
    position: relative;
    bottom: 4px;
    padding-right: 36%;
    padding-left: 36%;
}
.jm__slideshow.jmslide--show-temp .owl-carousel .owl-nav button {
    border: solid 1px;
}
.jm__slideshow.jmslide--show-temp .owl-carousel .owl-nav button.owl-prev {
    float: left;
}
.jm__slideshow.jmslide--show-temp .owl-carousel .owl-nav button.owl-next {
    float: right;
}
@media (max-width: 599px) {
  .jm__slideshow.jmslide--show-temp .owl-carousel .owl-nav {
    position: relative;
    bottom: 4px;
    padding-right: 15%;
    padding-left: 15%;
  }
}
@media (min-width: 600px) and (max-width: 768px) {
  .jm__slideshow.jmslide--show-temp .owl-carousel .owl-nav {
    position: relative;
    bottom: 4px;
    padding-right: 22%;
    padding-left: 22%;
  }
}
@media (min-width: 769px) and (max-width: 1000px) {
  .jm__slideshow.jmslide--show-temp .owl-carousel .owl-nav {
    position: relative;
    bottom: 4px;
    padding-right: 28%;
    padding-left: 28%;
  }
}
@media (min-width: 1001px) and (max-width: 1099px) {
  .jm__slideshow.jmslide--show-temp .owl-carousel .owl-nav {
    position: relative;
    bottom: 4px;
    padding-right: 34%;
    padding-left: 34%;
  }
}
@media (min-width: 1099px) and (max-width: 1199px) {
  .jm__slideshow.jmslide--show-temp .owl-carousel .owl-nav {
    position: relative;
    bottom: 4px;
    padding-right: 33%;
    padding-left: 33%;
  }
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
            navText: ["<span class='previous__icon'></span>","<span class='next__icon'></span>"]
        });
    });
</script>
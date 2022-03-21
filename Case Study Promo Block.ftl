<style>
    .casestudy_slide{
        width: 100%;
    height: auto;
    position: relative;
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
}

 .case-study__img{
          width: 275px;
    height: 250px;
    }
.carousel-control-prev, .carousel-control-next {
    align-items: center;
    bottom: 0;
    color: #fff;
    display: flex;
    justify-content: center;
    opacity: 1;
    position: absolute;
    text-align: center;
    top: 0;
    transition: opacity 0.15s ease;
    width: 3%;
    z-index: 1;
    margin: -25px;
}

.case-study__promo-block {
    float: left;
    width: 100%;
    display: flex;
    padding: 2rem 8rem;
    /* margin: 4rem; */
    justify-content: center;
}

    
     .carousel-control-next-icon {
    background-image: url("../images/new__jm__images/right-move-arrow.svg");
}
.carousel-control-prev-icon {
    background-image: url("../images/new__jm__images/left-move-arrow.svg");
}

@media (min-width: 992px) and (max-width: 1199.98px) {
.case-study__promo-block {
    float: left;
    width: 100%;
    display: flex;
    padding: 2rem 4rem;
    /* margin: 4rem; */
    justify-content: center;
}
.case-study__img {
    width: 90%;
    height: 250px;
}
}
@media (min-width: 768px) and (max-width: 991.98px) {
.case-study__promo-block {
    float: left;
    width: 100%;
    display: flex;
    padding: 2rem 2rem;
    /* margin: 4rem; */
    justify-content: center;
}
.carousel-control-prev, .carousel-control-next {
    align-items: center;
    bottom: 0;
    color: #fff;
    display: flex;
    justify-content: center;
    opacity: 1;
    position: absolute;
    text-align: center;
    top: 0;
    transition: opacity 0.15s ease;
    width: 3%;
    z-index: 1;
    margin: 0px;
}
.case-study__img {
    width: 100%;
    height: 235px;
}
.case-study__title {
    font-size: 36px;
}
.case-study__main {
    padding-left: 40px;
}
.case-study__copy p {
    font-size: 16px;
}
.case-study__subtitle {
    font-size: 16px;
}
}
@media (min-width: 576px) and (max-width: 767.98px) {
.case-study__promo-block {
    float: left;
    width: 100%;
    display: flex;
    padding: 2rem 2rem;
    /* margin: 4rem; */
    justify-content: center;
}
}
@media (max-width: 575.98px) {
.case-study__promo-block {
    float: left;
    width: 100%;
    display: flex;
   padding: 1rem 1rem 1rem 1.5rem;
    /* margin: 4rem; */
    justify-content: center;
}
.case-study__img {
    width: 30%;
    height: 75px;
}
.case-study__title {
    font-size: 22px;
    margin-top: -14px;
}
.case-study__subtitle {
    padding-bottom: 10px;
    font-size: 14px;
}
.case-study__btn-link {
       position: relative;
    bottom: 0;
    right: 0;
    display:flex;
    justify-content: flex-end;
    width: 95%;
    float: right;
    background: #1E22AA;
}
span.case-study_link-text {
    float: right;
    padding: 15px 5px 0px 0px;
    font-size: 16px;
    float: left;
    font-family: 'JMSansRegular';
}
.case-study__copy p {
    font-size: 14px;
    line-height: 1.5;
        padding-left: 15px;
    padding-top: 15px;
    padding-bottom: 20px;
}
.case-study__header {
    position: absolute;
    margin-top: -70px;
    margin-left: 135px;
}
.carousel-control-prev, .carousel-control-next {
    align-items: center;
    bottom: 0;
    color: #fff;
    display: flex;
    justify-content: center;
    opacity: 1;
    position: absolute;
    text-align: center;
    top: 0;
    transition: opacity 0.15s ease;
    width: 10%;
    z-index: 1;
    margin: -20px -15px 0px -25px;
    }

}
</style>

<#assign namespace = randomNamespace />
<div class="case-study__promo-block ">
<div id="caseStudyCarousel-${namespace}" class=" carousel casestudy_slide" data-ride="${getterUtil.getBoolean(AutoRotate.getData())?then('carousel','false')}">
<div class="carousel-inner">
<#if CaseStudy.getSiblings()?has_content>
<#list CaseStudy.getSiblings() as cur_CaseStudy>
<div class="carousel-item ${(cur_CaseStudy?is_first)?then('active','')}">
<#assign
webContentData = jsonFactoryUtil.createJSONObject(cur_CaseStudy.getData())
/>
<@liferay_asset["asset-display"]
className = webContentData.className
classPK = getterUtil.getLong(webContentData.classPK, 0)
/>
</div>
</#list>
</#if>
</div>
<a class="carousel-control-prev" href="#caseStudyCarousel-${namespace}" role="button" data-slide="prev">
<span class="carousel-control-prev-icon" aria-hidden="true"></span>
<span class="sr-only"><#if (PreviousSlideLabel.getData())??>${PreviousSlideLabel.getData()}</#if></span>
</a>
<a class="carousel-control-next" href="#caseStudyCarousel-${namespace}" role="button" data-slide="next">
<span class="carousel-control-next-icon" aria-hidden="true"></span>
<span class="sr-only"><#if (NextSlideLabel.getData())??>${NextSlideLabel.getData()}</#if></span>
</a>
</div>
</div>
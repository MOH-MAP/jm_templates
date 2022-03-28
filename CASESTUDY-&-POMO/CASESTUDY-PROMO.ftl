<#assign namespace = randomNamespace />

<div class="container ">
    <div id="caseStudyCarousel-${namespace}" class="carousel jmcasestudy--slide" data-ride="${getterUtil.getBoolean(AutoRotate.getData())?then('carousel','false')}">
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
<div class="container">
    <div class="row">
    <div class="panel-flex-container">
        <div class="second-flex-item-left">
            <div class="article-image-container">
                <picture>
        			<#if (ImageLarge.getData())?? && ImageLarge.getData() != "">
        				<source media="(min-width: 1480px)" srcset="${ImageLarge.getData()}">
        			</#if>
        			<#if (ImageLarge.getData())?? && ImageLarge.getData() != "">
        				<source media="(min-width: 1024px)" srcset="${ImageMedium.getData()}">
        			</#if>
        			<#if (ImageSmall.getData())?? && ImageSmall.getData() != "">
        				<img class="img-fluid" alt="${ImageSmall.getAttribute("alt")}" data-fileentryid="${ImageSmall.getAttribute("fileEntryId")}" src="${ImageSmall.getData()}" />
        			</#if>
        		</picture>
            </div>
        </div>
        <div class="second-flex-item-right">
            <div class="second-article-heading-right">
              ${Name.getData()}
            </div>
            <div class="second-article-content-right">
                ${Body.getData()}
            </div>
                <#if ButtonTitle.getData()?has_content>
                    <#if ButtonTitle.LinkToPage.getFriendlyUrl()?has_content>
                        <div class="panel-button-block">
            	            <button class="btn btn-primary">
            	                <a href="${ButtonTitle.LinkToPage.getFriendlyUrl()}">
                                    ${ButtonTitle.getData()}
                                    <span>
                                        <img src="/o/jm-platinum-theme/images/new__jm__images/arrow_forward-white.svg"
                                            alt="right arrow"
                                        />
                                    </span>
                                </a>
                            </button>
                        </div>
                    </#if>
                </#if>
            </div>
        </div>
    </div>
</div>
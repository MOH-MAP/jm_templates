<#assign Img_containerId = randomNamespace />
<#assign panelflexContainerSecond = "panel-flex-image-container-secon" + Img_containerId />
<div class="${panelflexContainerSecond}">
<div class="flex-heading-item">
<p>${Name.getData()}</p>
</div>
<div class="flex-image-item-left-second">
<div class="article-image-container-seven">
<picture>
<#if (ImageLarge.getData())?? && ImageLarge.getData() != "">
<source media="(min-width: 1480px)" srcset="${ImageLarge.getData()}">
</#if>
<#if (ImageLarge.getData())?? && ImageLarge.getData() != "">
<source media="(min-width: 1024px)" srcset="${ImageMedium.getData()}">
</#if>
<#if (ImageSmall.getData())?? && ImageSmall.getData() != "">
<img class="img-fluid img-right" alt="${ImageSmall.getAttribute("alt")}" data-fileentryid="${ImageSmall.getAttribute("fileEntryId")}" src="${ImageSmall.getData()}" />
</#if>
</picture>
</div>
</div>
<div class="flex-image-item-right-second">
<div class="article-content-right">
<p>${Body.getData()}</p>
<#if ButtonTitle.getData()?has_content> 
    <#if ButtonTitle.LinkToPage.getFriendlyUrl()?has_content>
        <div class="custom-btn-block">
            <a href="${ButtonTitle.LinkToPage.getFriendlyUrl()}">
                <button class="btn btn-primary">
                <span class="mobile-text">${ButtonTitle.getData()}</span>
                <span class="desktop-text">${ButtonTitle.ButtonSubtitle.getData()}</span>
                <span> 
                    <img src="/o/jm-platinum-theme/images/new__jm__images/arrow_forward-white.svg" al="button-right-forward" />
                </span>
                </button>
            </a>
        </div>
    </#if>
</#if>
</div>
</div>
</div>

<style>
.${panelflexContainerSecond} {
    display: flex;
    flex-wrap: wrap;
    margin-bottom: 4%;
    padding: 3% 5% 10% 10%;
    background-image: url("${BackgroundImage.getData()}");
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    background-attachment: fixed;
}
</style>
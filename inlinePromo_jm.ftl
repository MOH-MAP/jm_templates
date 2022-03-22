<div class="container">
    <div class="jm-inline-promo">
        <div class="row promo__sec">
            <div class="col-md-7 promo__block">
                <#if (PreTitle.getData())??>
                	<p class="promo__signup">${PreTitle.getData()}</p>
                </#if>
                <#if (Title.getData())??>
                	<h2 class="promo__heading">${Title.getData()}</h2>
                </#if>
                <a class="promo__btn" href="${Path.getData()}">
                    ${PreTitle.getData()}
                    <span class="arrow__forward"></span>
                </a>
            </div>
            <div class="col-md-5">
                <#if (ImageLarge.getData())?? && ImageLarge.getData() != "">
                	<img alt="${ImageLarge.getAttribute("alt")}" data-fileentryid="${ImageLarge.getAttribute("fileEntryId")}" src="${ImageLarge.getData()}" />
                </#if>
            </div>
        </div>
    </div>
</div>
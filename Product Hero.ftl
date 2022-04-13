<#assign namespace=randomNamespace />

<div id="product-hero-${namespace}" class="jmproduct--hero-temp">
    <div class="container">
        <div class="row">
            <#assign imgPresent = ((ImageLarge.getData())?? && ImageLarge.getData() != "")>
            <div class="${(imgPresent)?then('col-md-7','col-md-12')}">
                <#if (Title.getData())??>
                    <h1 class="product_hero__heading">
                        ${Title.getData()}
                    </h1>
                </#if>
                <#if (Summary.getData())??>
                    <div class="product_hero__para">
                        ${Summary.getData()}
                    </div>
                </#if>
                <div class="mt-4">
                    <#if Link_Title?? && Link_Title.getData()?has_content>
                        <#assign linkHref = "#" />
                        <#if Link_Title.Link_Internal?? && Link_Title.Link_Internal.getFriendlyUrl()?has_content>
                            <#assign linkHref = Link_Title.Link_Internal.getFriendlyUrl() />
                        <#elseif Link_Title.Link_Media?? && Link_Title.Link_Media.getData()?has_content>
                            <#assign linkHref = Link_Title.Link_Media.getData() />
                        <#elseif Link_Title.Link_Mailto?? && Link_Title.Link_Mailto.getData()?has_content>
                            <#assign linkHref = "mailto:" + Link_Title.Link_Mailto.getData() />
                        <#elseif Link_Title.Link_External?? && Link_Title.Link_External.getData()?has_content>
                            <#assign linkHref = Link_Title.Link_External.getData() />
                        </#if>
                        <a href="${linkHref}" class="panel__btn" title="${Link_Title.getData()}">
                            ${Link_Title.getData()} 
                            <span class="arrow__forward"></span>
                        </a>
                    </#if>
                    <#if AdditionalLinks_Title?? && AdditionalLinks_Title.getSiblings()?? && AdditionalLinks_Title.getSiblings()?has_content>
                        <#assign href = '#' >
                        <#assign title = 'Explore'>
                        <#assign target = '' >
                        <#list AdditionalLinks_Title.getSiblings() as cur_AdditionalLinks_Title>
                            <#if (cur_AdditionalLinks_Title.getData())?? && cur_AdditionalLinks_Title.getData()?has_content>
                                <#assign title = cur_AdditionalLinks_Title.getData()>
                                <#if cur_AdditionalLinks_Title.AdditionalLinks_Internal?? && 
                                    cur_AdditionalLinks_Title.AdditionalLinks_Internal.getFriendlyUrl()?has_content>
                                    <#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Internal.getFriendlyUrl() >
                                <#elseif cur_AdditionalLinks_Title.AdditionalLinks_Media?? &&
                                    cur_AdditionalLinks_Title.AdditionalLinks_Media.getData()?has_content>
                                    <#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Media.getData() >
                                <#elseif cur_AdditionalLinks_Title.AdditionalLinks_Mailto?? && 
                                    cur_AdditionalLinks_Title.AdditionalLinks_Mailto.getData()?has_content>
                                    <#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Mailto.getData() >
                                <#elseif cur_AdditionalLinks_Title.AdditionalLinks_External?? && 
                                    cur_AdditionalLinks_Title.AdditionalLinks_External.getData()?has_content>
                                    <#assign href = cur_AdditionalLinks_Title.AdditionalLinks_External.getData() >
                                </#if>
                                <#if cur_AdditionalLinks_Title.AdditionalLinks_Target?? &&
                                    cur_AdditionalLinks_Title.AdditionalLinks_Target.getData()?has_content>
                                    <#assign target = cur_AdditionalLinks_Title.AdditionalLinks_Target.getData() >
                                </#if>
                                <a href="${href}" class="panel__btn" title="${title}" target="${target}">
                                    ${title}
                                    <span class="arrow__forward"></span>
                                </a>
                            </#if>
                        </#list>
                    </#if>
                </div>
            </div>
            <#if imgPresent >
	            <div class="col-md-5">
                    <#if SpecificationTitle.getData()?has_content>
					    <img class="product_hero_img product--heroimgspecification" alt="${ImageLarge.getAttribute("alt")!}" data-fileentryid="${ImageLarge.getAttribute("fileEntryId")!}" src="${ImageLarge.getData()}" />
	                    <div class="jm-richtext-item-image">
						    <div class="jm-rt-image-block">
							    <div class="jm-text-slider">
								    <div class="jm-rxtx-slider-btn-block">
									    <div class="jm-button-block-rctx">
										    <span>${SpecificationTitle.getData()}</span></span>
									    </div>
									    <div class="jm-product-info-container">
										    ${Specification.getData()}
									    </div>
								    </div>
							    </div>
						    </div>
					    </div>
                        <#else>
                        <img class="product_hero_img" alt="${ImageLarge.getAttribute("alt")!}" data-fileentryid="${ImageLarge.getAttribute("fileEntryId")!}" src="${ImageLarge.getData()}" />
                    </#if>
	            </div>
            </#if>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $(".jm-rt-image-block").click(function () {
            if ($(this).hasClass("specifications--in")) {
                $(this).removeClass("specifications--in");
            } else {
                $(this).addClass("specifications--in");
            }
        });
    });
</script>
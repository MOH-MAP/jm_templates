<#assign namespace=randomNamespace />
<style>
    .product_hero .product_hero__para {
        font-size: 18px;
        line-height: 28px;
        font-family: JMSansRegular;
    }
    
    .product_hero .product_hero__para p {
        margin-bottom: 1rem;
    }
    
    table td {
        border: 0.125rem solid #fff;
        padding: 0.5rem;
        background: #ccc;
    }
    
    .product_hero .product_hero__para p {
        font-size: 20px;
    }
    
    .product_hero .product_hero__heading {
        font-size: 52px;
    }
    
    .product_col_alignment_bottom {
        margin-bottom: 30%;
        padding-right: 10%;
    }
    
    .product_hero .row {
        margin-right: 135px;
    }
    
    .panel__btn {
        width: 425px;
        padding: 20px 10px 17px 24px;
    }
    
    .product_hero .product_hero__heading {
        font-size: 52px;
        line-height: 68px;
    }
</style>

<div id="product-hero-${namespace}" class="product_hero">
    <div class="container">
        <div class="row">
            <#assign imgPresent=( (ImageLarge.getData())?? && ImageLarge.getData() !="" )>
                <div class="${(imgPresent)?then('col-md-7 product_col_alignment_bottom','col-md-12')}">
                    <h1 class="product_hero__heading">
                        <#if (Title.getData())??>${Title.getData()}</#if>
                    </h1>
                    <div class="product_hero__para">
                        <#if (Summary.getData())??>${Summary.getData()}</#if>
                    </div>
                    <#if Link_Title?? && Link_Title.getData()?has_content>
                        <#assign linkHref="#" />

                        <#if Link_Title.Link_Internal.getFriendlyUrl()?has_content>
                            <#assign linkHref=L ink_Title.Link_Internal.getFriendlyUrl() />
                            <#elseif Link_Title.Link_Media.getData()?has_content>
                                <#assign linkHref=L ink_Title.Link_Media.getData() />
                                <#elseif Link_Title.Link_Mailto.getData()?has_content>
                                    <#assign linkHref="mailto:" + Link_Title.Link_Mailto.getData() />
                                    <#elseif Link_Title.Link_External.getData()?has_content>
                                        <#assign linkHref=L ink_Title.Link_External.getData() />
                        </#if>
                        <div class="">
                            <div class="">
                                <a href="${linkHref}" class="panel__btn">${Link_Title.getData()} <span class="arrow__forward"></span></a>
                            </div>
                        </div>
                    </#if>

                    <#if AdditionalLinks_Title?? && AdditionalLinks_Title.getSiblings()?? && AdditionalLinks_Title.getSiblings()?has_content>
                        <#assign href='#'>
                            <#assign title='Explore'>
                                <#list AdditionalLinks_Title.getSiblings() as cur_AdditionalLinks_Title>
                                    <#if (cur_AdditionalLinks_Title.getData())?? && cur_AdditionalLinks_Title.getData()?has_content>
                                        <#assign title=c ur_AdditionalLinks_Title.getData()>
                                            <#if cur_AdditionalLinks_Title.AdditionalLinks_Internal.getFriendlyUrl()?has_content>
                                                <#assign href=c ur_AdditionalLinks_Title.AdditionalLinks_Internal.getFriendlyUrl()>
                                                    <#elseif cur_AdditionalLinks_Title.AdditionalLinks_Media.getData()?has_content>
                                                        <#assign href=c ur_AdditionalLinks_Title.AdditionalLinks_Media.getData()>
                                                            <#elseif cur_AdditionalLinks_Title.AdditionalLinks_Mailto.getData()?has_content>
                                                                <#assign href=c ur_AdditionalLinks_Title.AdditionalLinks_Mailto.getData()>
                                                                    <#elseif cur_AdditionalLinks_Title.AdditionalLinks_External.getData()?has_content>
                                                                        <#assign href=c ur_AdditionalLinks_Title.AdditionalLinks_External.getData()>
                                                                            <#elseif cur_AdditionalLinks_Title.AdditionalLinks_Target.getData()?has_content>
                                                                                <#assign href=c ur_AdditionalLinks_Title.AdditionalLinks_Target.getData()>
                                            </#if>
                                            <div class="panel__btn">
                                                <a href="${href}">${title}
						   <span class="arrow__forward"></span></a>
                                            </div>
                                    </#if>

                                </#list>
                    </#if>
                </div>
                <#if imgPresent>
                    <div class="col-md-5">
                        <img class="product_hero_img" alt="${ImageLarge.getAttribute(" alt ")!}" data-fileentryid="${ImageLarge.getAttribute(" fileEntryId ")!}" src="${ImageLarge.getData()}" />
                    </div>
                </#if>
        </div>
    </div>
</div>
<div class="list-block_container">
    <h1 class="list-block_title">${Name.getData()}</h1>
    <div class="row">
        <div class="col-md-4">
            <div class="list-block-css">
                <div class="product-align">
                    <p class="product-css"><#if (SummaryTitle.getData())??>
                    	${SummaryTitle.getData()}
                    </#if></p>    
                    <h3 class="product-heading"><#if (SummaryText.getData())??>
                	${SummaryText.getData()}
                    </#if></h3>
                <#if Link_Title?? && Link_Title.getData()?has_content>
                     <#assign linkHref = "#" />
                    <#if Link_Title.Link_Internal.getFriendlyUrl()?has_content>
                        <#assign linkHref = Link_Title.Link_Internal.getFriendlyUrl() />
                        </#if>
                        <#if Link_Title.Link_Media.getData()?has_content>
                            <#assign linkHref = Link_Title.Link_Media.getData() />
                        </#if>
                        <#if Link_Title.Link_Mailto.getData()?has_content>
                            <#assign linkHref = "mailto:" + Link_Title.Link_Mailto.getData() />
                        </#if>    
                        <#if Link_Title.Link_External.getData()?has_content>
                            <#assign linkHref = Link_Title.Link_External.getData() />
                        </#if>
                           <p class="read-more">
                                <a href="${linkHref}">${Link_Title.getData()}
                           </p> <span class="readmore-icon"></span>
                </#if>
                </div>
            </div>
        </div>
    </div>
</div>
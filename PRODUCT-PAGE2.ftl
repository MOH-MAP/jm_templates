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
            </div>
            <#if imgPresent >
                <div class="col-md-5">
                	<img class="product_hero_img" alt="${ImageLarge.getAttribute("alt")!}" data-fileentryid="${ImageLarge.getAttribute("fileEntryId")!}" src="${ImageLarge.getData()}" />
                </div>
            </#if>
            
            <#if Link_Title?? && Link_Title.getData()?has_content>
                <#assign linkHref = "#" />
        
                <#if Link_Title.Link_Internal.getFriendlyUrl()?has_content>
                    <#assign linkHref = Link_Title.Link_Internal.getFriendlyUrl() />
                <#elseif Link_Title.Link_Media.getData()?has_content>
                    <#assign linkHref = Link_Title.Link_Media.getData() />
                <#elseif Link_Title.Link_Mailto.getData()?has_content>
                    <#assign linkHref = "mailto:" + Link_Title.Link_Mailto.getData() />
                <#elseif Link_Title.Link_External.getData()?has_content>
                    <#assign linkHref = Link_Title.Link_External.getData() />
                </#if>
                <div class="jmcol-for-alignment">
                    <div class="">
                        <a href="${linkHref}" class="panel__btn" title="${Link_Title.getData()}">
                            <span class="panel__btntext">${Link_Title.getData()} </span>
                            <span class="arrow__forward"></span>
                        </a>
                    </div>
                </div>
            </#if>
            
             <#if AdditionalLinks_Title?? && AdditionalLinks_Title.getSiblings()?? && AdditionalLinks_Title.getSiblings()?has_content>
				<#assign href = '#' >
                <#assign title = 'Explore'>
				<#list AdditionalLinks_Title.getSiblings() as cur_AdditionalLinks_Title>
					<#if (cur_AdditionalLinks_Title.getData())?? && cur_AdditionalLinks_Title.getData()?has_content>
						<#assign title = cur_AdditionalLinks_Title.getData()>
						<#if cur_AdditionalLinks_Title.AdditionalLinks_Internal.getFriendlyUrl()?has_content>
							<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Internal.getFriendlyUrl() >
						<#elseif cur_AdditionalLinks_Title.AdditionalLinks_Media.getData()?has_content>
							<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Media.getData() >
						<#elseif cur_AdditionalLinks_Title.AdditionalLinks_Mailto.getData()?has_content>
							<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Mailto.getData() >
						<#elseif cur_AdditionalLinks_Title.AdditionalLinks_External.getData()?has_content>
							<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_External.getData() >
						<#elseif cur_AdditionalLinks_Title.AdditionalLinks_Target.getData()?has_content>
							<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Target.getData() >
						</#if>
						<div>
                            <a class="panel__btn" href="${href}" title="${title}">
                                <span class="panel__btntext">${title}</span>
                                <span class="arrow__forward"></span>
                            </a>
                        </div>
					</#if>
				</#list>
            </#if>
        </div>
    </div>
</div>
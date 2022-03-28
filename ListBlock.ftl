<#assign href = '#' >
<#assign title = 'Explore'>

<div class="list-block_container">
    <h1 class="list-block_title">${Name.getData()}</h1>
    <div class="row">
        <div class="list-block-css">
            <div class="product-align">
                <p class="product-css">${SummaryTitle.getData()}</p>    
                <h3 class="product-heading">${SummaryText.getData()}</h3>
                <#if Link_Title?? && Link_Title.getData()?has_content>
					<#assign title = Link_Title.getData()>
					<#if Link_Title.Link_Internal?? && Link_Title.Link_Internal.getFriendlyUrl()?has_content>
						<#assign href = Link_Title.Link_Internal.getFriendlyUrl() >
					<#elseif Link_Title.Link_Mailto?? && Link_Title.Link_Mailto.getData()?has_content>
						<#assign href = Link_Title.Link_Mailto.getData() >
					<#elseif Link_Title.Link_Media?? && Link_Title.Link_Media.getData()?has_content>
						<#assign href = Link_Title.Link_Media.getData() >
					<#elseif Link_Title.Link_External?? && Link_Title.Link_External.getData()?has_content>
						<#assign href = Link_Title.Link_External.getData() >
					<#elseif Link_Title.Link_Target?? && Link_Title.Link_Target.getData()?has_content>
						<#assign href = Link_Title.Link_Target.getData() >
					</#if>
					<p class="read-more">
                        <a title="${title}" href="${href}">
							${title}
						</a>
                    </p> 
					<span class="readmore-icon"></span>
				</#if>
            </div>
        </div>
    </div>
</div>
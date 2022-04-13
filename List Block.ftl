<#assign namespace = randomNamespace />

<div class="jmlist-block" id="jmlist-block-${namespace}">
    <div class="container">
        <div class="row">
            <div class="col-md-6 jmlist-block-link">
                <#if (SummaryTitle.getData())??>
                    <h1 class="jmlist-block-title">${SummaryTitle.getData()}</h1>
                </#if>
                <#if (SummaryText.getData())??>
                    <h6 class="jmlist-block-summary">${SummaryText.getData()}</h6>
                </#if>

                <#if Link_Title?? && Link_Title.getData()?has_content>
                    <div class="jmlist-block-link">
                        <#assign title = 'Explore'>
                        <#assign href = '#' >
                        <#assign target = ''>
						<#if Link_Title.getData()?has_content>
						    <#assign title = Link_Title.getData()>
						</#if>
						<#if Link_Title.Link_Internal?? && Link_Title.Link_Internal.getFriendlyUrl()?has_content>
							<#assign href = Link_Title.Link_Internal.getFriendlyUrl() >
						<#elseif Link_Title.Link_Mailto?? && Link_Title.Link_Mailto.getData()?has_content>
							<#assign href = Link_Title.Link_Mailto.getData() >
						<#elseif Link_Title.Link_Media?? && Link_Title.Link_Media.getData()?has_content>
							<#assign href = Link_Title.Link_Media.getData() >
						<#elseif Link_Title.Link_External?? && Link_Title.Link_External.getData()?has_content>
							<#assign href = Link_Title.Link_External.getData() >
						</#if>
						<#if Link_Title.Link_Target?? && Link_Title.Link_Target.getData()?has_content>
							<#assign target = Link_Title.Link_Target.getData() >
						</#if>
						<div>
                            <a class="panel__btn" href="${href}" title="${title}">
                                <span class='panel__btntext'>${title}</span>
                                <span class="arrow__forward"></span>
                            </a>
                        </div>
                    </div>
				</#if>
            </div>

            <div class="col-md-6 jmlist-block-list">
                <#if (ListTitle.getData())??>
                    <h1 class="jmlist-block-list-title">${ListTitle.getData()}</h1>
                </#if>

                <#if List_Link_Title?? && List_Link_Title.getSiblings()?has_content>
                    <div class="jmlist-block-list-links">
                    	<#list List_Link_Title.getSiblings() as cur_List_Link_Title>
                    		<#assign title = 'Explore'>
                            <#assign href = '#' >
                            <#assign target = ''>
    						<#if cur_List_Link_Title.getData()?has_content>
    						    <#assign title = cur_List_Link_Title.getData()>
    						</#if>
    						<#if cur_List_Link_Title.Link_Internal?? && cur_List_Link_Title.Link_Internal.getFriendlyUrl()?has_content>
    							<#assign href = cur_List_Link_Title.Link_Internal.getFriendlyUrl() >
    						<#elseif cur_List_Link_Title.Link_Mailto?? && cur_List_Link_Title.Link_Mailto.getData()?has_content>
    							<#assign href = cur_List_Link_Title.Link_Mailto.getData() >
    						<#elseif cur_List_Link_Title.Link_Media?? && cur_List_Link_Title.Link_Media.getData()?has_content>
    							<#assign href = cur_List_Link_Title.Link_Media.getData() >
    						<#elseif cur_List_Link_Title.Link_External?? && cur_List_Link_Title.Link_External.getData()?has_content>
    							<#assign href = cur_List_Link_Title.Link_External.getData() >
    						</#if>
    						<#if cur_List_Link_Title.Link_Target?? && cur_List_Link_Title.Link_Target.getData()?has_content>
    							<#assign target = cur_List_Link_Title.Link_Target.getData() >
    						</#if>
    						<div>
                                <a class="panel__btn" href="${href}" title="${title}">
                                    <span class='panel__btntext'>${title}</span>
                                    <span class="arrow__forward"></span>
                                </a>
                            </div>
            	        </#list>
                    </div>
                </#if>
            </div>
        </div>
    </div>
</div>
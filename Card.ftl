<#assign title="Read More" />
<#assign linkHref="#" />
<div class="jmcard--main-container">
    <div class="card bg-light rounded-0">
        <div class="card-body">
            <h6 class="card-title">${Name.getData()}</h6>
            <h2 class="card-text wrap-three">${Title.getData()}</h2>
            <#if Link_Title?? && Link_Title.getData()?has_content>
                <#assign title=Link_Title.getData() />
                <#if Link_Title.Link_Internal?? && Link_Title.Link_Internal.getFriendlyUrl()?has_content>
                    <#assign linkHref=Link_Title.Link_Internal.getFriendlyUrl() />
                    <#elseif Link_Title.Link_Media?? && Link_Title.Link_Media.getData()?has_content>
                        <#assign linkHref=Link_Title.Link_Media.getData() />
                        <#elseif Link_Title.Link_Mailto?? && Link_Title.Link_Mailto.getData()?has_content>
                            <#assign linkHref="mailto:" + Link_Title.Link_Mailto.getData() />
                            <#elseif Link_Title.Link_External?? && Link_Title.Link_External.getData()?has_content>
                                <#assign linkHref=Link_Title.Link_External.getData() />
                </#if>
            </#if>
            <a class="list-link" title="${title}" href="${linkHref}" target="_blank">
                <span class="link-text">${title}</span>
                <span class="link-icon"></span>
            </a>
        </div>
    </div>
</div>
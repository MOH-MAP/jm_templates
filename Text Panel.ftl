<div class="jm-panel jmtext--panel-temp">
    <div class="row">
        <#if (Image.getData())?? && Image.getData() != "">
            <div class="text-panel-img col">
            	<img alt="${Image.getAttribute("alt")}" data-fileentryid="${Image.getAttribute("fileEntryId")}" src="${Image.getData()}" />
            </div>
        </#if>

        <#if (Body.getData())?? && Body.getData() !="">
            <div class="text-panel-matter col">
                <div class="container">
                 <a href="#" class="jmtext-panel-tag"></a>
                    <#if (Title.getData())??>
                        <div class="text-panel-title">${Title.getData()}</div>
                    </#if>
                    <#if (Body.getData())??>
                        <div class="text-panel-body">${Body.getData()}</div>
                    </#if>

                    <#if Link_Title??&& Link_Title.getData()?has_content>
                        <#assign linkHref="#" />
                        <#if Link_Title.Link_Internal?? && Link_Title.Link_Internal.getFriendlyUrl()?has_content>
                            <#assign linkHref=Link_Title.Link_Internal.getFriendlyUrl() />
                        <#elseif Link_Title.Link_Media.getData()?has_content>
                            <#assign linkHref=Link_Title.Link_Media.getData() />
                        <#elseif Link_Title.Link_Mailto.getData()?has_content>
                            <#assign linkHref="mailto:" + Link_Title.Link_Mailto.getData() />
                        <#elseif Link_Title.Link_External.getData()?has_content>
                            <#assign linkHref=Link_Title.Link_External.getData() />
                        </#if>
                        <div class="text-panel-link">
                            <a href="${linkHref}">
                                <span class="arrow__forward" />
                            </a>
                        </div>
                    </#if>
                </div>
            </div>
        </#if>
    </div>
</div>
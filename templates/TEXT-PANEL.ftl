<div class="jm-panel text-panel">
<div class="row">
<#if (Image.getData())?? && Image.getData() != "">
<div class="text-panel-img col">
<img alt="${Image.getAttribute("alt")}" data-fileentryid="${Image.getAttribute("fileEntryId")}" src="${Image.getData()}" />
</div>
</#if>

<#if (Body.getData())?? && Body.getData() != "" >
<div class="text-panel-matter col">
<#if (Title.getData())??>
<div class="text-panel-title">${Title.getData()}</div>
</#if>
<#if (Body.getData())??>
<div class="text-panel-body">${Body.getData()}</div>
</#if>

<#if Link_Title??&& Link_Title.getData()?has_content>
<#assign linkHref = "#" />

<#if Link_Title.Link_Internal?? && Link_Title.Link_Internal.getFriendlyUrl()?has_content>
<#assign linkHref = Link_Title.Link_Internal.getFriendlyUrl() />
<#elseif Link_Title.Link_Media.getData()?has_content>
<#assign linkHref = Link_Title.Link_Media.getData() />
<#elseif Link_Title.Link_Mailto.getData()?has_content>
<#assign linkHref = "mailto:" + Link_Title.Link_Mailto.getData() />
<#elseif Link_Title.Link_External.getData()?has_content>
<#assign linkHref = Link_Title.Link_External.getData() />
</#if>

<div class="text-panel-link">
<a href="${linkHref}">
<span class="arrow__forward" />
</a>
</div>

</#if>
</div>
</#if>
</div>
</div>



<style>
.jm-panel .text-panel-matter {
background-color: #1E22AA;
color: white;
padding: 20px;
}
.text-panel-link {
    float: right;
    position: absolute;
    right: 40px;
    bottom: 37px;
}
.text-panel .text-panel-title {
margin-bottom: 10px;
}

.text-panel .text-panel-body .title-style-a {
font-size: 34px;
font-family: JMSansMedium;
line-height: 32px;
color: #FFFFFF;
}

.text-panel .text-panel-body p {
margin-top: 10px;
}
</style>
<#--
Web content templates are used to lay out the fields defined in a web
content structure.

Please use the left panel to quickly add commonly used variables.
Autocomplete is also available and can be invoked by typing "${".
-->
<#assign title = 'Explore'>
<#assign href = '#'>

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
</#if>

<div class="card__contentlink">
    <a class="card__montlink" href="${href}" title="${Title.getData()}"></a>
    <div class="card__container">
        <div class="card__content">
            <h2 class="card__heading">${Title.getData()}</h2>
            <p class="card__description">${Summary.getData()}</p>
            <p class="card__subtext">
                ${title}
                <span class="arrow__forward"></span>
            </p>
        </div>
        <div class="card__img">
            <#if (ImageLarge.getData())?? && ImageLarge.getData() != "">
                <img alt="${ImageLarge.getAttribute("alt")}" data-fileentryid="${ImageLarge.getAttribute("fileEntryId")}" src="${ImageLarge.getData()}" />
            </#if>
        </div>
    </div>
</div>
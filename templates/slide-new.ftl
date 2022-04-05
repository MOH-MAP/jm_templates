
<#if (ImageLarge.getData())?? && ImageLarge.getData() != "">
<img alt="${ImageLarge.getAttribute("alt")}" data-fileentryid="${ImageLarge.getAttribute("fileEntryId")}" src="${ImageLarge.getData()}" />
</#if>
<div class="container-fluid">
<a href="${Link_Title.Link_Internal.getFriendlyUrl()}">
<h1>${Title.getData()}<span>${SubTitle.getData()}</span></h1>
</a>

<div class="row">
<#if Cards.getSiblings()?has_content>
<#list Cards.getSiblings() as cur_cards>
<div class="col-md-4">
<div class="test">
<#assign
webContentData = jsonFactoryUtil.createJSONObject(cur_cards.getData())
/>
<@liferay_asset["asset-display"]
className = webContentData.className
classPK = getterUtil.getLong(webContentData.classPK, 0)
/>
</div>
</div>
</#list>
</#if>
</div>
</div>



<style>
h1 {
color: black;
}



a:hover {
text-decoration: none;
}



h2.portlet-title-text.portlet-title-editable {
display : none;
}
</style>
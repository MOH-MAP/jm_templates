<div class="container-fluid">

<a href="${Link_Title.Link_Internal.getFriendlyUrl()}">
<h1>${Title.getData()} <span class="highlight">${SubTitle.getData()}</span></h1>
</a>

<div class="row">
<#if Cards.getSiblings()?has_content>
<#list Cards.getSiblings() as cur_cards>
<div class="col-md-12">
<div class="test1">
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
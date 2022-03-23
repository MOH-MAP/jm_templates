<div class="container">
	<h1 class="card__title">${Name.getData()}</h1>
	<div class="row">
		<#if Cards?? && Cards.getSiblings()?has_content>
			<#list Cards.getSiblings() as cur_Cards>
				<div class="col-md-6 montage__data">
					<#assign
					webContentData = jsonFactoryUtil.createJSONObject(cur_Cards.getData())
					/>
					<@liferay_asset["asset-display"]
					className = webContentData.className
					classPK = getterUtil.getLong(webContentData.classPK, 0)
					/>
				</div>
			</#list>
		</#if>
	</div>
</div>


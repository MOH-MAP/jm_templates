<div class="container">
	<#if (Title.getData())??>
		<h1 class="card__title">
			${Title.getData()}
		</h1>
	</#if>
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
<#--
Widget templates can be used to modify the look of a
specific application.

<a href="${categoryURL}">${category.getName()}</a>
${entry.getUnambiguousTitle(entries, themeDisplay.getSiteGroupId(), themeDisplay.getLocale())}
Please use the left panel to quickly add commonly used variables.
Autocomplete is also available and can be invoked by typing "${".
-->

<#assign categoryNames = { "Clean-mobility-and-future-cities": "Clean air for all", "Clean-and-sustainable-energy": "Clean and sustainable energy", "Natural-resources": "Using natural resources efficiently","Heath-and-wellbeing" : "Health and quality of life" }>



<#assign current_home = themeDisplay.getURLPortal()   

    all_URL = current_home + "/science-and-innovation/expert-insights" />

<#if renderRequest.getParameter("categoryId")??>
    <#assign currentCategoryId = renderRequest.getParameter("categoryId")/>
</#if>

<#assign hasCategories = false />
	<div aria-orientation="vertical" class="panel-group" role="tablist">
		<h3 class='jmtabbed__filterheading'>Filters</h3>
		<#if entries?has_content>
			<#list entries as entry>
				<#assign categories = entry.getCategories() />
				<#if categories?has_content>
					<#assign hasCategories = true />
					<@liferay_aui.row>
						<div class="panel container" role="tablist">
							<button
								aria-controls="section${entry?index}"
								aria-expanded="false"
								aria-default-expanded="true"
								class="btn btn-unstyled panel-header panel-header-link collapse-icon collapse-icon-middle collapsed"
								data-target="#section${entry?index}"
								data-toggle="collapse"
							>
								<span class="panel-title">Categories</span>
								<span class="collapse-icon-closed">
									<svg
										class="lexicon-icon lexicon-icon-angle-right"
										role="presentation"
									>
										<use xlink:href="/images/icons/icons.svg#angle-right"></use>
									</svg>
								</span>
								<span class="collapse-icon-open">
									<svg
										class="lexicon-icon lexicon-icon-angle-down"
										role="presentation"
									>
										<use xlink:href="/images/icons/icons.svg#angle-down"></use>
									</svg>
								</span>
							</button>
							<div
								class="panel-collapse collapse show"
								id="section${entry?index}"
								role="tabpanel"
							>
								<div class="panel-body">
									<@displayCategories categories=categories />
								</div>
							</div>
						</div>
					</@liferay_aui.row>
				</#if>
			</#list>

			<#if !hasCategories>
				${renderRequest.setAttribute("PORTLET_CONFIGURATOR_VISIBILITY", true)}
				<div class="alert alert-info w-100">
					<@liferay_ui.message key="there-are-no-categories" />
				</div>
			</#if>
		</#if>
    </div>

	<#macro displayCategories categories>
		<#if categories?has_content>
			<ul class="categories">
				<#list categories as category>
					<li>
					    <#if category.getName() != "Climate-action">
						<#assign categoryURL = renderResponse.createRenderURL() />
						${categoryURL.setParameter("resetCur", "true")}
						${categoryURL.setParameter("categoryId", category.getCategoryId()?string)}
						<#--<input type="radio" name="category" value="${categoryURL}">${category.getName()}</input>-->
						<#--<a href="${categoryURL}">${category.getName()}</a>-->
						<div class="radio-ctn">
							<label class="btn-filter active">
							    <#if category.getName() == "Thoughts-1" && !currentCategoryId??>
							        <input type="radio" name="${category.getName()}" id="${category.getCategoryId()}" checked >
							    <#else>
							        <input type="radio" name="${category.getName()}" id="${category.getCategoryId()}"
								    <#if currentCategoryId??>
    								    <#if currentCategoryId == "${category.getCategoryId()}">
    								        checked
    								    </#if>
								    </#if>
								    >
							    </#if>

								<#if category.getName() == "Thoughts-1">
								    <a href="${all_URL}" id="${category.getCategoryId()}"><span>All</span>
								    </a>
								<#else>
								<a href="${categoryURL}" id="${category.getCategoryId()}">
								    <span>
								        <#if categoryNames[category.getName()]??>
								            ${categoryNames[category.getName()]}
								        </#if>
								    </span>
								  </a>
								</#if>

								<#if category.getName() == "Thoughts-1">
								    <a class='jmtabbed__radiofull' href="${all_URL}" id="${category.getCategoryId()}"></a>
								<#else>
								<a class='jmtabbed__radiofull' href="${categoryURL}" id="${category.getCategoryId()}"></a>
								</#if>
							</label>
						</div>
						
						<#if serviceLocator??>
							<#assign
							assetCategoryService = serviceLocator.findService("com.liferay.asset.kernel.service.AssetCategoryService")

							childCategories = assetCategoryService.getChildCategories(category.getCategoryId())
							/>

							<@displayCategories categories=childCategories />
						</#if>
					</li>
					</#if>
				</#list>
			</ul>
		</#if>
	</#macro>
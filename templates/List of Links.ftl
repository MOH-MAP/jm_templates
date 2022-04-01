
<div class="container jmlist-of--links-container">
	<h1 class="jmlist-of--links-heading"><#if (Title.getData())??>${Title.getData()}</#if></h1>
	<#if AdditionalLinks_Title.getSiblings()?has_content>
		<#assign href = '#' >
        <#assign title = 'Explore'>
        <ul> 
			<#list  AdditionalLinks_Title.getSiblings() as cur_AdditionalLinks_Title>
				<#if cur_AdditionalLinks_Title?? && cur_AdditionalLinks_Title.getData()?has_content>
					<#assign title = cur_AdditionalLinks_Title.getData()>
					<#if cur_AdditionalLinks_Title.AdditionalLinks_Internal?? && cur_AdditionalLinks_Title.AdditionalLinks_Internal.getFriendlyUrl()?has_content>
						<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Internal.getFriendlyUrl() >
					<#elseif cur_AdditionalLinks_Title.AdditionalLinks_Media?? && cur_AdditionalLinks_Title.AdditionalLinks_Media.getData()?has_content>
						<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Media.getData() >
					<#elseif cur_AdditionalLinks_Title.AdditionalLinks_Mailto?? && cur_AdditionalLinks_Title.AdditionalLinks_Mailto.getData()?has_content>
						<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Mailto.getData() >
					<#elseif cur_AdditionalLinks_Title.AdditionalLinks_External?? && cur_AdditionalLinks_Title.AdditionalLinks_External.getData()?has_content>
						<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_External.getData() >
					<#elseif cur_AdditionalLinks_Title.AdditionalLinks_Target?? && cur_AdditionalLinks_Title.AdditionalLinks_Target.getData()?has_content>
						<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Target.getData() >
					</#if>
				</#if>
				<li class="jmlist-of--item">${title}
					<a class="jmlist-of--link" href="${href}">
						<p class="jmlist-of--text">Explore</p><span class="jmlist-of--icon"></span>
					</a>
				</li>
			</#list>
		</ul>
    </#if>
</div>
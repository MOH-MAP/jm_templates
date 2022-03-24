<div class="container">
	<div class="jmcta-block_inner">
		<div class="jmcta_inner_body">
			<header>
				<h3 class="jmcta-inner-header">${Title.getData()}</h3>
			</header>
			<p class="jmcta-inner-text">${SubTitle.getData()}</p>
			<#if AdditionalLinks_Title.getSiblings()?has_content>
				<#assign href = '#' >
                <#assign title = 'Explore'>
				<#list AdditionalLinks_Title.getSiblings() as cur_AdditionalLinks_Title>
					<#if cur_AdditionalLinks_Title?? && cur_AdditionalLinks_Title.getData()?has_content>
						<#assign title = cur_AdditionalLinks_Title.getData()>
						<#if cur_AdditionalLinks_Title.AdditionalLinks_Internal?? && cur_AdditionalLinks_Title.AdditionalLinks_Internal.getFriendlyUrl()?has_content>
							<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Internal.getFriendlyUrl() >
						<#elseif cur_AdditionalLinks_Title.AdditionalLinks_Media?? && cur_AdditionalLinks_Title.AdditionalLinks_Media.getData()?has_content>
							<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Media.getData() >
						<#elseif cur_AdditionalLinks_Title.AdditionalLinks_Mailto?? && bcur_AdditionalLinks_Title.AdditionalLinks_Mailto.getData()?has_content>
							<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Mailto.getData() >
						<#elseif cur_AdditionalLinks_Title.AdditionalLinks_External?? && cur_AdditionalLinks_Title.AdditionalLinks_External.getData()?has_content>
							<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_External.getData() >
						<#elseif cur_AdditionalLinks_Title.AdditionalLinks_Target?? && cur_AdditionalLinks_Title.AdditionalLinks_Target.getData()?has_content>
							<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Target.getData() >
						</#if>
					</#if>
					<div class="jmbtn--cta">
						<a class="jmcta-inner-link" href="${href}">
							<span>${title}</span>
							<span class="jmcta--link-icon"></span>
						</a>
					</div>
				</#list>
            </#if>
		</div>
	</div>
</div>

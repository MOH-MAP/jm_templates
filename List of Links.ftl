<div class="list-of-links__container mar-btm-60">
<h1 class="list-of-links__heading"><#if (Title.getData())??>${Title.getData()}</#if></h1>
	<#if AdditionalLinks_Title.getSiblings()?has_content>
				<#assign href = '#' >
                <#assign title = 'Explore'>
                <ul>
				<#list  AdditionalLinks_Title.getSiblings() as cur_AdditionalLinks_Title>
				
					<#if cur_AdditionalLinks_Title.getData()?has_content>
						<#assign title = cur_AdditionalLinks_Title.getData()>
						<#if cur_AdditionalLinks_Title.AdditionalLinks_Internal.getFriendlyUrl()?has_content>
							<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Internal.getFriendlyUrl() >
						<#elseif cur_AdditionalLinks_Title.AdditionalLinks_Media.getData()?has_content>
							<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Media.getData() >
						<#elseif cur_AdditionalLinks_Title.AdditionalLinks_Mailto.getData()?has_content>
							<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Mailto.getData() >
						<#elseif cur_AdditionalLinks_Title.AdditionalLinks_External.getData()?has_content>
							<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_External.getData() >
						<#elseif cur_AdditionalLinks_Title.AdditionalLinks_Target.getData()?has_content>
							<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Target.getData() >
						</#if>
					</#if>
					<li class="list-of-item"><span class="list-of-text">${title}</span>
						<a class="list-of-link" href="${href}">
							<p class="list-of-text">Explore</p><span class="list-of-icon"></span>
						</a>
					
					</li>
				</#list>
				</ul>
            </#if>

</div>
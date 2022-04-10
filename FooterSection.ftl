<div class="footer-list-heading"> 
	<#if Title.getData()?has_content>
	    ${Title.getData()}
	<#else>
	    <span class="hidden-text">HiddenText</span>
	</#if>
	<span class="down-arrow-img">
		<img src="/documents/101039/101203/chevron-down.svg/4963e8a0-389d-8f1b-e1c3-5b4a71a969af?t=1647440001258" alt="dropdown"/>
	</span>
	<ul class="footer-list-properties">
	    <#if Links_Title.getSiblings()?has_content>
			<#list Links_Title.getSiblings() as cur_Links_Title>
				<li class="footer-list-item">
					<#if cur_Links_Title?? && cur_Links_Title.getData()?has_content>
						<#assign linkHref = "#" />
						<#if cur_Links_Title.Link_Internal?? && cur_Links_Title.Link_Internal.getFriendlyUrl()?has_content>
							<#assign linkHref = cur_Links_Title.Link_Internal.getFriendlyUrl() />
						<#elseif cur_Links_Title.Link_Media?? && cur_Links_Title.Link_Media.getData()?has_content>
							<#assign linkHref = cur_Links_Title.Link_Media.getData() />
						<#elseif cur_Links_Title.Link_Mailto?? && cur_Links_Title.Link_Mailto.getData()?has_content>
							<#assign linkHref = "mailto:" + cur_Links_Title.Link_Mailto.getData() />
						<#elseif cur_Links_Title.Link_External?? && cur_Links_Title.Link_External.getData()?has_content>
							<#assign linkHref = cur_Links_Title.Link_External.getData() />
						</#if>
						<a class="jmfooter__listlink" href="${linkHref}">
							${cur_Links_Title.getData()}
						</a>
					</#if>
				</li>
			</#list>
		</#if>
	</ul>
</div>

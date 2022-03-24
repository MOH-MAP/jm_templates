<div class="container mar-btm-60">
<h1 class="list__heading">${Name.getData()}</h1>
<ul>
<#if AdditionalLinks_Title?? && AdditionalLinks_Title.getSiblings??>
	<#list AdditionalLinks_Title.getSiblings() as cur_Links>
    	<li class="list-item">${cur_Links.getData()}
		    <#if cur_Links.AdditionalLinks_Internal?has_content>
                <a class="list-link data" href="${cur_Links.AdditionalLinks_Internal.getFriendlyUrl()}"
                    <#if cur_Links.AdditionalLinks_Target?? && cur_Links.AdditionalLinks_Target.getData()??>
                    target="${cur_Links.AdditionalLinks_Target.getData()}"
                    </#if>>
	                <p class="link-text">Explore</p>
			        <span class="link-icon"></span>
                </a>
            <#elseif cur_Links.AdditionalLinks_Media?has_content>
                <a class="list-link data" href="${cur_Links.AdditionalLinks_Media.getData()}" target="${cur_Links.AdditionalLinks_Target.getData()}">
	                <p class="link-text">Explore</p>
			        <span class="link-icon"></span>
                </a>
            <#elseif cur_Links.AdditionalLinks_Mailto?has_content>
                <a class="list-link data" href="${cur_Links.AdditionalLinks_Mailto.getData()}" target="${cur_Links.AdditionalLinks_Target.getData()}">
	                <p class="link-text">Explore</p>
			        <span class="link-icon"></span>
                </a>
            <#elseif cur_Links.AdditionalLinks_External?has_content>
                <a class="list-link data" href="${cur_Links.AdditionalLinks_External.getData()}" target="${cur_Links.AdditionalLinks_Target.getData()}">
	                <p class="link-text">Explore</p>
			        <span class="link-icon"></span>
                </a>

            </#if>
        </li>

	</#list>
</#if>
<ul>
</div>
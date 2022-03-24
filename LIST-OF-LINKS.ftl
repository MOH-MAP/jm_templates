<div class="container mar-btm-60 list-of--links-container">
    <h1 class="list-of--links__heading">${Name.getData()}</h1>
    <ul>
        <#if AdditionalLinks_Title?? && AdditionalLinks_Title.getSiblings??>
	        <#list AdditionalLinks_Title.getSiblings() as cur_Links>
    	        <li class="list-of--item">
                    ${cur_Links.getData()}
                    <#if cur_Links.AdditionalLinks_Internal?has_content>
                        <a title="Explore" class="list-of--link data" href="${cur_Links.AdditionalLinks_Internal.getFriendlyUrl()}"
                            <#if cur_Links.AdditionalLinks_Target?? && cur_Links.AdditionalLinks_Target.getData()??>
                            target="${cur_Links.AdditionalLinks_Target.getData()}"
                            </#if>>
                            <span class="list-of--text">Explore</span>
                            <span class="list-of--icon"></span>
                        </a>
                    <#elseif cur_Links.AdditionalLinks_Media?has_content>
                        <a title="Explore" title="Explore" class="list-of--link data" href="${cur_Links.AdditionalLinks_Media.getData()}" target="${cur_Links.AdditionalLinks_Target.getData()}">
                            <span class="list-of--text">Explore</span>
                            <span class="list-of--icon"></span>
                        </a>
                    <#elseif cur_Links.AdditionalLinks_Mailto?has_content>
                        <a title="Explore" title="Explore" class="list-of--link data" href="${cur_Links.AdditionalLinks_Mailto.getData()}" target="${cur_Links.AdditionalLinks_Target.getData()}">
                            <span class="list-of--text">Explore</span>
                            <span class="list-of--icon"></span>
                        </a>
                    <#elseif cur_Links.AdditionalLinks_External?has_content>
                        <a title="Explore" title="Explore" class="list-of--link data" href="${cur_Links.AdditionalLinks_External.getData()}" target="${cur_Links.AdditionalLinks_Target.getData()}">
                            <span class="list-of--text">Explore</span>
                            <span class="list-of--icon"></span>
                        </a>
                    </#if>
                </li>
	        </#list>
        </#if>
    <ul>
</div>
<div class="container mar-btm-60 jmlist">
    <h1 class="jmlist__links-heading">${Name.getData()}</h1>
    <ul>
        <#if AdditionalLinks_Title?? && AdditionalLinks_Title.getSiblings??>
	        <#list AdditionalLinks_Title.getSiblings() as cur_Links>
    	        <li class="jmlist__item">
                    ${cur_Links.getData()}
                    <#if cur_Links.AdditionalLinks_Internal?has_content>
                        <a title="Explore" class="jmlist__link data" href="${cur_Links.AdditionalLinks_Internal.getFriendlyUrl()}"
                            <#if cur_Links.AdditionalLinks_Target?? && cur_Links.AdditionalLinks_Target.getData()??>
                            target="${cur_Links.AdditionalLinks_Target.getData()}"
                            </#if>>
                            <span class="jmlist__text">Explore</span>
                            <span class="jmlist__icon"></span>
                        </a>
                    <#elseif cur_Links.AdditionalLinks_Media?has_content>
                        <a title="Explore" title="Explore" class="jmlist__link data" href="${cur_Links.AdditionalLinks_Media.getData()}" target="${cur_Links.AdditionalLinks_Target.getData()}">
                            <span class="jmlist__text">Explore</span>
                            <span class="jmlist__icon"></span>
                        </a>
                    <#elseif cur_Links.AdditionalLinks_Mailto?has_content>
                        <a title="Explore" title="Explore" class="jmlist__link data" href="${cur_Links.AdditionalLinks_Mailto.getData()}" target="${cur_Links.AdditionalLinks_Target.getData()}">
                            <span class="jmlist__text">Explore</span>
                            <span class="jmlist__icon"></span>
                        </a>
                    <#elseif cur_Links.AdditionalLinks_External?has_content>
                        <a title="Explore" title="Explore" class="jmlist__link data" href="${cur_Links.AdditionalLinks_External.getData()}" target="${cur_Links.AdditionalLinks_Target.getData()}">
                            <span class="jmlist__text">Explore</span>
                            <span class="jmlist__icon"></span>
                        </a>
                    </#if>
                </li>
	        </#list>
        </#if>
    <ul>
</div>
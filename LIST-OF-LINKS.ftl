<#assign layoutLocalService = serviceLocator.findService("com.liferay.portal.kernel.service.LayoutLocalService")>

<div class="container mar-btm-60 jmlist">
	<#if (Title.getData())??>
    	<h1 class="jmlist__links-heading">${Title.getData()}</h1>
    </#if>
    <ul>
        <#if AdditionalLinks_Title.getSiblings??>
	        <#list AdditionalLinks_Title.getSiblings() as cur_AdditionalLinks_Title>
	        	<#assign
	        		title = 'Explore'
	        		linkHref = '#'
	        		target = ''
	        	/>
    	        <li class="jmlist__item">
    	        	<#if cur_AdditionalLinks_Title?? && cur_AdditionalLinks_Title.getData()?has_content >
    	        		<#assign title = cur_AdditionalLinks_Title.getData() />
    	        	</#if>
    	        	<#if cur_AdditionalLinks_Title.AdditionalLinks_Target?? && cur_AdditionalLinks_Title.AdditionalLinks_Target.getData()?has_content>
						<#assign target = cur_AdditionalLinks_Title.AdditionalLinks_Target.getData() />
					</#if>

                    <#if cur_AdditionalLinks_Title.AdditionalLinks_Internal?? && cur_AdditionalLinks_Title.AdditionalLinks_Internal.getFriendlyUrl()?has_content>
                    	<#assign linkHref = cur_AdditionalLinks_Title.AdditionalLinks_Internal.getFriendlyUrl() />
                    	<#if title == 'Explore' >
                    	    <#attempt>
                    	    <#assign layoutData = jsonFactoryUtil.createJSONObject(cur_AdditionalLinks_Title.AdditionalLinks_Internal.getData()) />
                        	<#assign title = layoutData.name />
                        	<#recover>
                        	</#attempt>
                    	</#if>
                    <#elseif cur_AdditionalLinks_Title.AdditionalLinks_Media?? && cur_AdditionalLinks_Title.AdditionalLinks_Media.getData()?has_content>
                        <#assign linkHref = cur_AdditionalLinks_Title.AdditionalLinks_Media.getData() />
                    <#elseif cur_AdditionalLinks_Title.AdditionalLinks_Mailto?? && cur_AdditionalLinks_Title.AdditionalLinks_Mailto.getData()?has_content>
                    	<#assign linkHref = cur_AdditionalLinks_Title.AdditionalLinks_Mailto.getData() />
                    <#elseif cur_AdditionalLinks_Title.AdditionalLinks_External?? && cur_AdditionalLinks_Title.AdditionalLinks_External.getData()?has_content>
                    	<#assign linkHref = cur_AdditionalLinks_Title.AdditionalLinks_External.getData() />
                    </#if>
                    <a title="${title}" class="jmlist__link data" href="${linkHref}" target="${target}" >
                        <span class="jmlist__title-text">${title}</span>
                        <span class="jmlist__text">Explore</span>
                        <span class="jmlist__icon"></span>
                    </a>
                </li>
	        </#list>
        </#if>
    <ul>
</div>
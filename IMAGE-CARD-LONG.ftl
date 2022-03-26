<div class="container">
	<h2 class="jmimage-card-block--header">${imageBlockTitle.getData()}</h2>
    <div class="jmimage--cardb-lock jmimg--main--cardblock bg-light">
    	<div class="row no-gutters">
    		<div class="col-4">
    			<div class="jmimg--cardblock--body body">
    				<h6 class="jmimg--cardblock--title">${PreTitle.getData()}</h6>
    				<h3 class="jmimg--cardblock--text">${Title.getData()}</h3>

    				<#assign linkHref = "" />

    				<#if Link_Title?? && Link_Title.getData()?has_content>
    				    <#if Link_Title.Link_Internal.getFriendlyUrl()?has_content>
                		    <#assign linkHref = Link_Title.Link_Internal.getFriendlyUrl() />
                        <#elseif Link_Title.Link_Media.getData()?has_content>
                            <#assign linkHref = Link_Title.Link_Media.getData() />
                        <#elseif Link_Title.Link_Mailto.getData()?has_content>
                            <#assign linkHref = "mailto:" + Link_Title.Link_Mailto.getData() />
                        <#elseif Link_Title.Link_External.getData()?has_content>
                            <#assign linkHref = Link_Title.Link_External.getData() />
                        </#if>
    				</#if>

    				<#if linkHref?has_content>
						<a class="jmimg--cardblock-list--ilnk" title="${Link_Title.getData()}" href="${linkHref}" target="${Link_Title.Link_Target.getData()}">
							<span class="jmimg--cardblock-link--text">${Link_Title.getData()}</span>
							<span class="jmimg--cardblock-link--icon"></span>
						</a>
    				</#if>
    			</div>
    		</div>
    		<div class="col-8 jmimg--cardblock--longcol">
                <#if (ImageLarge.getData())?? && ImageLarge.getData() != "">
                	<img class="jmimg--cardblock-img rounded-0" alt="${ImageLarge.getAttribute("alt")}" data-fileentryid="${ImageLarge.getAttribute("fileEntryId")}" src="${ImageLarge.getData()}" />
                </#if>
    		</div>
    	</div>
    </div>
</div>
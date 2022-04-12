<#assign namespace = randomNamespace />

<#if (ImageLarge.getData())?? && ImageLarge.getData() != "">
	<style>
	    #industry-hero-${namespace} {
	        background-image: url("${ImageLarge.getData()}");
	        background-position: center;
	        background-size: cover;
	    }
	</style>
</#if>

<div class="full__widthcontainer jmhero--industry-main-container-temp">
	<div class="container industry__sec row">
		<div class="col-md-6 industry__text">
    		<h1 class="industry__heading">${Title.getData()}</h1>
    		<#if (Summary.getData())??>
				<p class="industry__para">
					${Summary.getData()}
				</p>
			</#if>

			<#if Link_Title?? && Link_Title.getData()?has_content>
                <#assign linkHref = "#" />
                <#if Link_Title.Link_Internal?? && Link_Title.Link_Internal.getFriendlyUrl()?has_content>
                    <#assign linkHref = Link_Title.Link_Internal.getFriendlyUrl() />
                <#elseif Link_Title.Link_Media?? && Link_Title.Link_Media.getData()?has_content>
                    <#assign linkHref = Link_Title.Link_Media.getData() />
                <#elseif Link_Title.Link_Mailto?? && Link_Title.Link_Mailto.getData()?has_content>
                    <#assign linkHref = "mailto:" + Link_Title.Link_Mailto.getData() />
                <#elseif Link_Title.Link_External?? && Link_Title.Link_External.getData()?has_content>
                    <#assign linkHref = Link_Title.Link_External.getData() />
                </#if>
                <a class="industry__btn" href="${linkHref}" title="${Link_Title.getData()}">
					${Link_Title.getData()}
					<span class="arrow__forward"></span>
				</a>
            </#if>
            
            <#if AdditionalLinks_Title?? && AdditionalLinks_Title.getSiblings()?has_content>
				<#assign href = '#' >
                <#assign title = 'Explore'>
				<#list AdditionalLinks_Title.getSiblings() as cur_AdditionalLinks_Title>
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
						<div>
							<a class="industry__btn" href="${href}" title="${title}">
								${title}
								<span class="arrow__forward"></span>
							</a>
						</div>
					</#if>
				</#list>
            </#if>

            <#if ShowScrollLink?? && ShowScrollLink.getData()?has_content>
				<#if getterUtil.getBoolean(ShowScrollLink.getData())>
					<div class="hero-links hero-scroll-link">
					    <#assign scrollLinkTitle = "Read More" />
					    <#if (ScrollLinkText.getData())??>
                        	<assign scrollLinkTitle = ScrollLinkText.getData() />
                        </#if>
						<a class="industry__btn" href="#industry-details" title="${scrollLinkTitle}">
							${scrollLinkTitle}
						 	<span class="arrow__forward"></span>
						</a>
					</div>
				</#if>
            </#if>

		</div>
		<div class="col-md-6 industry-blck jmhero--industry-temp" id="industry-hero-${namespace}"></div>
	</div>
</div>
<div id="industry-details" />
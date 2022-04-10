<#assign namespace = randomNamespace />

<style>
   	#industry-hero-${namespace}{
    	background:  url("${ImageLarge.getData()}") no-repeat center center transparent;
    }
    #industry-img-${namespace}{
    	display: none;
    }
    
    @media(min-width: 320px) and (max-width: 539px){
       	#industry-hero-${namespace}{
       		display: none;
       	}
       	#industry-img-${namespace}{
          	background:  url("${ImageLarge.getData()}") no-repeat center center transparent;
       	}
    }
    @media(min-width: 540px) and (max-width: 834px){
    	#industry-hero-${namespace}{
       		display: none !important;
       	}
       	#industry-img-${namespace}{
         	background:  url("${ImageLarge.getData()}") no-repeat center center transparent;
       	}
    }
</style>

<div class="full__widthcontainer jmhero--industry-main-container-temp">
	<div class="container industry__sec">
		<div class=" col-md-6 industry__text">
    		<h1 class="industry__heading">${Title.getData()}</h1>
    		<#if (Summary.getData())??>
				<p class="industry__para">
					${Summary.getData()}
				</p>
			</#if>
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
            <#if ShowScrollLink.getSiblings()?has_content>
				<#list ShowScrollLink.getSiblings() as cur_ShowScrollLink>
					<#if getterUtil.getBoolean(cur_ShowScrollLink.getData())>
						<div class="hero-links hero-scroll-link">
							<a class="industry__btn" href="#industry-details" title="${ScrollLinkText.getData()}">
								<#if (ScrollLinkText.getData())??>${ScrollLinkText.getData()}</#if>
							 	<span class="arrow__forward"></span>
							</a>
						</div>
					<#else>
						${languageUtil.get(locale, "no")}
					</#if>
				</#list>
            </#if>
		</div>
		<div class="col-md-6 industry-blck" id="industry-hero-${namespace} jmhero--industry-temp"></div>
		<div class="col-md-6 mb__img" id="industry-img-${namespace} jmhero--industry-img-temp" ></div>
	</div>
</div>
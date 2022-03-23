<#assign namespace = randomNamespace />
<#assign layoutService = serviceLocator.findService("com.liferay.portal.kernel.service.LayoutLocalService") />
<#assign serviceContext = staticUtil["com.liferay.portal.kernel.service.ServiceContextThreadLocal"].getServiceContext() />
<#assign themeDisplay = serviceContext.getThemeDisplay() />
<style>
   #industry-hero-${namespace}{
    	
    	background:  url("${ImageLarge.getData()}") no-repeat center center transparent;
    	background-size: cover;
    	position: absolute!important;
        height: 100%;
        right: 0;
        top: 0;
        width: 100%;
    }
    .full__widthcontainer{
    position: relative !important;
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
    	background-size: cover;
    	display: block;
    	height: 300px;  
       }
        .industry-blck,
        .mb__img{
          flex:  0 0 0;
          max-width: 100%;
       }
       }
    
    }
    @media(min-width: 540px) and (max-width: 834px){
    #industry-hero-${namespace}{
       display: none !important;
       }
       #industry-img-${namespace}{
         background:  url("${ImageLarge.getData()}") no-repeat center center transparent;
    	background-size: cover;
    	display: block;
    	height: 300px;
       }
       .industry-blck,
       .mb__img{
          flex:  0 0 0;
          max-width: 100%;
         
       }
    }
</style>

<div class="full__widthcontainer">
	<div class="container industry__sec">
		<div class=" col-md-6 industry__text">
    		<h1 class="industry__heading">${Name.getData()}</h1>
    		<p class="industry__para"><#if (Summary.getData())??>${Summary.getData()}</#if></p>
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
                        <a class="industry__btn" href="${href}">${title}
							<span class="arrow__forward"></span></a>
						</div>
					</#if>
				</#list>
            </#if>
            <#if ShowScrollLink.getSiblings()?has_content>
				<#list ShowScrollLink.getSiblings() as cur_ShowScrollLink>
					<#if getterUtil.getBoolean(cur_ShowScrollLink.getData())>
						<div class="hero-links hero-scroll-link">
						<a class="industry__btn" href="#industry-details">
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
		<div class="col-md-6 industry-blck" id="industry-hero-${namespace}"></div>
		<div class="col-md-6 mb__img" id="industry-img-${namespace}" ></div>
	</div>
</div>
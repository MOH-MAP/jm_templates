<#assign namespace = randomNamespace />
<#assign layoutService = serviceLocator.findService("com.liferay.portal.kernel.service.LayoutLocalService") />
<#assign serviceContext = staticUtil["com.liferay.portal.kernel.service.ServiceContextThreadLocal"].getServiceContext() />
<#assign themeDisplay = serviceContext.getThemeDisplay() />

<style>
#product-page-${namespace} {
background-image: url("${ImageLarge.getData()}");
background-position: center center;
background-size: cover;
height: 630px;
}
</style>
 
<div id="product-page-${namespace}" class="annual-repor-slide">
<div class="container">
	<div class="row">
	<div class="col-md-6 product__cont">
	<h1 class="product__heading">
	<#if (Title.getData())??>${Title.getData()}</#if></h1>
    <#if Link_Title?? && Link_Title.getData()?has_content>
               <#assign linkHref = "#" />
                    <#if Link_Title.Link_Internal.getFriendlyUrl()?has_content>
                        <#assign linkHref = Link_Title.Link_Internal.getFriendlyUrl() />
                        </#if>
                        <#if Link_Title.Link_Media.getData()?has_content>
                            <#assign linkHref = Link_Title.Link_Media.getData() />
                        </#if>
                        <#if Link_Title.Link_Mailto.getData()?has_content>
                            <#assign linkHref = "mailto:" + Link_Title.Link_Mailto.getData() />
                        </#if>    
                        <#if Link_Title.Link_External.getData()?has_content>
                            <#assign linkHref = Link_Title.Link_External.getData() />
                        </#if>
                           <div class="panel__btn">
                                <a href="${linkHref}">${Link_Title.getData()}
                                <span class="arrow__forward"></span></a>
                          </div>
                </#if>
        <#if AdditionalLinks_Title.getSiblings()?has_content>
				<#assign href = '#' >
                <#assign title = 'Explore'>
				<#list AdditionalLinks_Title.getSiblings() as cur_AdditionalLinks_Title>
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
						<div class="panel__btn">
                        <a href="${href}">${title}
                       <span class="arrow__forward"></span></a>
                    </div>
					</#if>
					 
				</#list>
            </#if>
	</div>
</div>
</div>
</div>
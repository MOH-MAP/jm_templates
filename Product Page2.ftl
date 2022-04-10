<#assign namespace = randomNamespace />

<#if (ImageLarge.getData())?? && ImageLarge.getData() != "">
<style>
	#product-page-${namespace} {
    	background-image: url("${ImageData}");
    	background-position: center center;
        background-size: cover;
        height: 630px;
    }
</style>
</#if>

<div id="product-page-${namespace}" class="annual-repor-slide">
	<div class="container">
		<div class="row">
			<div class="col-md-6 product__cont">
				<#if (Title.getData())??>
					<h1 class="product__heading">
						${Title.getData()}
					</h1>
				</#if>
    			<#if Link_Title?? && Link_Title.getData()??>
               		<#assign linkHref = "#" />
                    <#if Link_Title.Link_Internal?? && Link_Title.Link_Internal.getFriendlyUrl()??>
                        <#assign linkHref = Link_Title.Link_Internal.getFriendlyUrl() />
                        </#if>
                        <#if Link_Title.Link_Media?? && Link_Title.Link_Media.getData()??>
                            <#assign linkHref = Link_Title.Link_Media.getData() />
                        </#if>
                        <#if Link_Title.Link_Mailto?? && Link_Title.Link_Mailto.getData()??>
                            <#assign linkHref = "mailto:" + Link_Title.Link_Mailto.getData() />
                        </#if>
                        <#if Link_Title.Link_External?? && Link_Title.Link_External.getData()??>
                            <#assign linkHref = Link_Title.Link_External.getData() />
                        </#if>
						<div class="panel__btn">
							<a href="${linkHref}" title="${Link_Title.getData()}">
								<span class='panel__btntext'>${Link_Title.getData()}</span>
								<span class="arrow__forward"></span>
							</a>
						</div>
                	</#if>
        			<#if AdditionalLinks_Title?? && AdditionalLinks_Title.getSiblings()??>
						<#assign href = '#' >
                		<#assign title = 'Explore'>
						<#list AdditionalLinks_Title.getSiblings() as cur_AdditionalLinks_Title>
						<#if cur_AdditionalLinks_Title.getData()?has_content>
							<#assign title = cur_AdditionalLinks_Title.getData()>
							<#if cur_AdditionalLinks_Title??
								&& cur_AdditionalLinks_Title.AdditionalLinks_Internal??
								&& cur_AdditionalLinks_Title.AdditionalLinks_Internal.getFriendlyUrl()??>
								<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Internal.getFriendlyUrl() >
							<#elseif cur_AdditionalLinks_Title.AdditionalLinks_Media??
								&& cur_AdditionalLinks_Title.AdditionalLinks_Media.getData()??>
								<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Media.getData() >
							<#elseif cur_AdditionalLinks_Title.AdditionalLinks_Mailto??
									&& cur_AdditionalLinks_Title.AdditionalLinks_Mailto.getData()??>
								<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Mailto.getData() >
							<#elseif cur_AdditionalLinks_Title.AdditionalLinks_External??
								&& cur_AdditionalLinks_Title.AdditionalLinks_External.getData()?has_content>
								<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_External.getData() >
							<#elseif cur_AdditionalLinks_Title.AdditionalLinks_Target??
								&&cur_AdditionalLinks_Title.AdditionalLinks_Target.getData()?has_content>
								<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Target.getData() >
							</#if>
							<div class="panel__btn">
								<a href="${href}" title="${title}">
									<span class='panel__btntext'>${title}</span>
									<span class="arrow__forward"></span>
								</a>
							</div>
						</#if>
					</#list>
            	</#if>
			</div>
		</div>
	</div>
</div>
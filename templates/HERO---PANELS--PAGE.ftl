<#assign namespace = randomNamespace />
<style>
    #panels-hero-${namespace} {
    background-image: url("${ImageLarge.getData()}");
    	background-position: center;
    	background-size: cover;
    }
    .panels-hero-panels {
        background-color: var(--jmEgyptianBlue-color);
    }
    .hero-panels-panel.white-border {
        border-left: 1.5px white solid;
    }
    .panels-hero .panels-hero-header h1 {
        font-size: 46px;
        line-height: 60px;
        font-family: JMSansMedium;
        color: #FFFFFF;
        text-shadow: 0px 0px 6px #000000;
    }
    .panels-hero .panels-hero-para {
        font-size: 18px;
        line-height: 28px;
        font-family: JMSansMedium;
        color: #FFFFFF;
        text-shadow: 0px 0px 8px #000000;
        opacity: 0.8;
    }
</style>

<div id="panels-hero-${namespace}" class="panels-hero">
	<div class="banner container py-6 py-md-8">
		<div class="row">
			<div class="col-12">
				<div class="panels-hero-header">
    				<h1>${Name.getData()}</h1>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="panels-hero-para">
                    <#if (Summary.getData())??>${Summary.getData()}</#if>
				</div>
			</div>
			<div class="col-12">
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
						<div class="mt-4">
                        <a class="panel__btn" href="${href}">${title}
                       <span class="arrow__forward"></span></a>
                    </div>
					</#if>
					 
				</#list>
            </#if>
		
            </div>
        </div>
	</div>

	<#if Panels?? && Panels.getSiblings()?? && Panels.getSiblings()?has_content>
        <div class="panels-hero-panels">
            <div class="container">
                <div class="row">
                    <#if Panels.getSiblings()?size == 1>
                        <#assign colClass = "col-12" />
                    <#elseif Panels.getSiblings()?size == 2>
                        <#assign colClass = "col-sm-12 col-md-6" />
                    <#elseif Panels.getSiblings()?size == 3>
                        <#assign colClass = "col-sm-12 col-md-4" />
                    <#elseif Panels.getSiblings()?size == 4>
                        <#assign colClass = "col-sm-12 col-md-3" />
                    </#if>
                    <#list Panels.getSiblings() as cur_Panels>
                        <div class="${colClass} hero-panels-panel ${cur_Panels?is_first?then('','white-border')}">
                            <#assign
                                webContentData = jsonFactoryUtil.createJSONObject(cur_Panels.getData())
                            />
                            <@liferay_asset["asset-display"]
                                className = webContentData.className
                                classPK = getterUtil.getLong(webContentData.classPK, 0)
                            />
                        </div>
                    </#list>
                </div>
            </div>
        </div>
    </#if>
</div>

<script>
$(function() {
    var imgPath = $(".journal-content-article[data-analytics-asset-title='Panel-Block-energy-revolution'] .text-panel-img img").attr("src")
    
    $(".journal-content-article[data-analytics-asset-title='Panel-Block-energy-revolution'] .text-panel-img picture").css({'background-image': 'url('+imgPath+')'});
    
    var panelBlockImgPath = $(".journal-content-article[data-analytics-asset-title='Panel-Block-2'] .text-panel-img img").attr("src")
    
    $(".journal-content-article[data-analytics-asset-title='Panel-Block-2'] .text-panel-img picture").css({'background-image': 'url('+panelBlockImgPath+')'});
    
    $(".journal-content-article[data-analytics-asset-title='Image-Card-Block'] .img__cardblock picture").each(function(){
        var imgPath = $(this).find('img').attr("src");
        $(this).css({'background-image': 'url('+imgPath+')'});
    });
});
</script>
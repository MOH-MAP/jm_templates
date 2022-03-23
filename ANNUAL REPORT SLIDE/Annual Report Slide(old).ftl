<#assign namespace = randomNamespace />
<#assign href = '#' >
<#assign layoutService = serviceLocator.findService("com.liferay.portal.kernel.service.LayoutLocalService") />
<#assign serviceContext = staticUtil["com.liferay.portal.kernel.service.ServiceContextThreadLocal"].getServiceContext() />
<#assign themeDisplay = serviceContext.getThemeDisplay() />
<#assign layoutname = themeDisplay.getLayout().getName(themeDisplay.getLocale()) />

<section class="main__sec"> 
    <div id="annual-report-slide-${namespace}" class="annual-report-slide">
        <div class="container annual__report">
            <h1 class="panel__heading"><#if (Title.getData())??>${Title.getData()}</#if></h1>
			<p >${Subtitle.getData()}</p>
            <#if Links_Title.getSiblings()?has_content>
                <#list Links_Title.getSiblings() as cur_Links_Title>
                    <#if cur_Links_Title.Links_Internal?? && cur_Links_Title.Links_Internal.getFriendlyUrl()?has_content>
                        <#assign href = cur_Links_Title.Links_Internal.getFriendlyUrl() >
                    <#elseif cur_Links_Title.Links_Mailto?? && cur_Links_Title.Links_Mailto.getData()?has_content>
                        <#assign href = cur_Links_Title.Links_Mailto.getData() >
                    <#elseif cur_Links_Title.Links_Media?? && cur_Links_Title.Links_Media.getData()?has_content>
                        <#assign href = cur_Links_Title.Links_Media.getData() >
                    <#elseif cur_Links_Title.Links_External?? && cur_Links_Title.Links_External.getData()?has_content>
                        <#assign href = cur_Links_Title.Links_External.getData() >
                    <#elseif cur_Links_Title.Links_Target?? && cur_Links_Title.Links_Target.getData()?has_content>
                        <#assign href = cur_Links_Title.Links_Target.getData() >
                    </#if>
                    <button class="panel__btn"> <a href="${href}">${layoutname}</a>
                    <span class="arrow__forward"></span></button>
                </#list>
            </#if>
        </div> 
        <div class="scroll__sec">
			<#if getterUtil.getBoolean(HideScrollArrow.getData())>
				<img class="viewnext__img"src="scroll_arrow.svg" alt=""> <a href="#"></a>
			<#else>
				<img class="viewnext__img"src="scroll_arrow.svg" alt=""> <a href="#"></a>
			</#if>
		</div>
    </div>
  
    <#if Panels.getSiblings()?has_content>
        <div class="hero-panels text-white">
            <div class="row no-gutters">
                <#if Panels.getSiblings()?size == 1>
                    <#assign colSize = 8 />
                <#elseif Panels.getSiblings()?size == 2>
                    <#assign colSize = 4 />
                <#elseif Panels.getSiblings()?size == 3>
                    <#assign colSize = 3 />
                <#elseif Panels.getSiblings()?size == 4>
                    <#assign colSize = 2 />
                </#if>
                <div class="col-md-2"></div>
                    <#list Panels.getSiblings() as cur_Panels>
                        <div class="col-${colSize} p-4 annual-result-slide-panel ${cur_Panels?is_first?then('','white-border')}">
                            <#assign
                               webContentData = jsonFactoryUtil.createJSONObject(cur_Panels.getData())
                            />
                            <@liferay_asset["asset-display"]
                               className = webContentData.className
                               classPK = getterUtil.getLong(webContentData.classPK, 0)
                            />
                       </div>
                   </#list>
					<div class="col-md-2">
				</div>
            </div>
        </div>
    </#if>
</section>



<style>
#annual-report-slide-${namespace} {
  background-image: url("${ImageLarge.getData()}");
  background-position: center;
  background-size: cover;
  width: 100%;
  height: 477px;
  position: relative;
}
.panel__heading {
  font-size: 47px;
  line-height: 56px;
  font-family: JMSansRegular;
  color: #ffffff;
  text-shadow: 0px 0px 8px #000000;
  opacity: 1;
  padding-top: 65px;
  max-width: 770px;
}
.annual__report p{
  text-align: left;
  font-size: 18px;
  line-height: 28px;
  font-family: JMSansRegular;
  letter-spacing: 0px;
  color: #fff;
  text-shadow: 0px 0px 8px #000000;
  opacity: 1;
}
.panel__btn {
  display: flex;
  background-color: #1e22aa;
  color: #fff;
  width: 321px;
  border: none;
  outline: none;
  padding: 20px 10px 17px 0px;
  margin-top: 44px;
  justify-content: flex-end;
  text-align: right;
  font-size: 18px;
  font-family: JMSansMedium;
  line-height: 22px;
  letter-spacing: 0px;
  text-transform: uppercase;
}
.arrow__forward {
  background: url(" arrow_forward-white.svg") 0 0 no-repeat transparent;
  display: block;
  width: 24px;
  height: 24px;
  margin-left: 8px;
  top: 50%;
  margin-top: -2px;
}
.scroll__sec {
  position: absolute;
  bottom: 0;
  margin-bottom: 56px;
  display: flex;
  justify-content: center;
  align-items: center;
  cursor: pointer;
  right: 50%;
  padding: 10px;
  border: 1px solid #fff;
}

@media (min-width: 320px) and (max-width: 539px) {
  .panel__heading {
    font-size: 32px;
    line-height: 48px;
  }
  .panel__btn {
    width: 221px;
    font-size: 16px;
    padding: 15px 10px 15px 0px;
  }
  .scroll__sec {
    display: none;
  }
}
@media (min-width: 540px) and (max-width: 834px) {
  .panel__heading {
    font-size: 44px;
  }
  .scroll__sec {
    margin-bottom: 30px;
  }
  .viewnext__img {
    padding: 7px;
  }
}
</style>
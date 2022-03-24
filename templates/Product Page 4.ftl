<#assign namespace = randomNamespace />
<#assign layoutService = serviceLocator.findService("com.liferay.portal.kernel.service.LayoutLocalService") />
<#assign serviceContext = staticUtil["com.liferay.portal.kernel.service.ServiceContextThreadLocal"].getServiceContext() />
<#assign themeDisplay = serviceContext.getThemeDisplay() />

<div id="product-page-${namespace}">
	<div class="container">
		<div class="row">
			<div class=" col-md-6 productvar__one" >
				<h1 >${Name.getData()}</h1>
				<p>
					<#if (Specification.getData())??>${Specification.getData()}</#if>
				</p>
			</div>
			<div class="col-md-6 sndpanel__cont">
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
					<div class="sndpanel__btn">
						<a href="${linkHref}">${Link_Title.getData()}
						<span class="arrow__forward"></span></a>
					</div>
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
							<div class="sndpanel__btn">
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

<style>
#product-page-${namespace} {
background-image: url("${ImageLarge.getData()}");
background-position: center center;
background-size: cover;
height: 430px;
}
.sndpanel__cont a {
  background-color: $jmEgyptianBlueColor;
  color: $jmWhiteColor;
  text-decoration: none;

  &:hover {
    background-color: $jmEgyptianBlueColor;
    color: $jmWhiteColor;
    text-decoration: none;
  }
}
.sndpanel__btn a {
  display: flex;
  background-color: $jmEgyptianBlueColor;
  color: #fff;
  width: 409px;
  border: none;
  outline: none;
  justify-content: flex-end;
  text-align: right;
  font-size: 18px;
  font-family: JMSansMedium;
  line-height: 22px;
  letter-spacing: 0px;
  text-transform: uppercase;
  margin: 0 auto;
 
}
.productvar__one h1{
  text-align: left;
  font-size: 52px;
  line-height: 60px;
  font-family: JMSansMedium;
  letter-spacing: 0px;
  color: #fff;
  text-shadow: 0px 0px 8px #000000;
  opacity: 1;
  margin-top: 75px;
  margin-bottom: 34px;
}
.productvar__one p{
  text-align: left;
  font-size: 18px;
  line-height: 28px;
  font-family: JMSansRegular;
  letter-spacing: 0px;
  color: #fff;
  text-shadow: 0px 0px 8px #000000;
  opacity: 1;
}
</style>
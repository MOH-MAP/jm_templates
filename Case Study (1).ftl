<div class="container">
	<article class="case__study-main">
		<div class="case-study_inner-container">
			<div class="row">
				<div class="col-md-4">
					<#if (Image.getData())?? && Image.getData() != "">
						<img class="case-study__img" alt="${Image.getAttribute("alt")}" src="${Image.getData()}"
							data-fileentryid="${Image.getAttribute("fileEntryId")}" />
					</#if>
				</div>
				<div class="col-md-8">
					<div class="case-study__main">
						<div class="case-study__header">
							<div class="case-study__title"><#if (Title.getData())??>${Title.getData()}</#if></div>
								<div class="case-study__subtitle"><#if (Subtitle.getData())??>${Subtitle.getData()}</#if></div>
							</div>
						<div class="case-study__copy">
							<div><#if (Summary.getData())??>${Summary.getData()}</#if></div>
						</div>
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
							<div class="case-study__link">
								<a href="${linkHref}" class="case-study__btn-link"><span class="case-study_link-text">${Link_Title.getData()}</span>
								<span class="case-study_link-icon"></span>
							</div>
						</#if>
					</div>
				</div>
			</div>
		</div>
	</article>
</div>

<style>
.case-study__container{
    float: left;
    width: 100%;
    display: flex;
    justify-content: center;
}
.case-study_inner-container{
     float: left;
    width: 100%;
    padding: 2rem 0rem;
    display: flex;
    justify-content: center;
}

.case-study__main {
    padding-left: 0px;
        margin-left: -20px;
}
.case-study__title {
    font-size: 40px;
    text-align: left;
    font: normal normal medium 40px/48px JMSans;
    letter-spacing: 0px;
    color: #333333;
    opacity: 1;
    line-height: 1.7;
    margin-top: -14px;
    font-family: 'JMSansMedium';
}
.case-study__subtitle {
    text-align: left;
    letter-spacing: 0px;
    color: #333333;
    opacity: 0.8;
    padding-bottom: 10px;
    font-family: 'JMSansMedium';
    font-size: 18px;
}
.case-study__copy p {
    text-align: left;
    letter-spacing: 0px;
    color: #333333;
    opacity: 1;
    font-size: 18px;
    font-family: 'JMSansMedium';
}
.case-study__btn-link{
    position:absolute;
    bottom:0;
    right:0;
    background: #1E22AA;
}
span.case-study_link-text {
    float: right;
    /* padding-left: 12px; */
    padding: 15px 10px 0px 200px;
    color: white;
    letter-spacing: 0px;
    color: #FFFFFF;
    text-transform: uppercase;
    opacity: 1;
    font-size: 16px;
    float: left;
    font-family: 'JMSansRegular';
}


.case-study_link-icon {
    background: url("../images/new__jm__images/arrow_forward-white.svg") 0 0 no-repeat transparent;
    display: block;
    width: 24px;
    height: 24px;
    float: right;
    margin-left: 0rem;
    margin-top: 14px;
    padding: 23px 15px 15px 20px;
}
</style>
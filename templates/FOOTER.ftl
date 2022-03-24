<#--
Web content templates are used to lay out the fields defined in a web
content structure.

Please use the left panel to quickly add commonly used variables.
Autocomplete is also available and can be invoked by typing "${".
-->
<footer>
    <div class="footer__container">
        <div class="jmfooter__logo">
            <a href="javascript:void(0);" class="jmlogo">
               <#if (Logo.getData())?? && Logo.getData() != "">
	<img alt="${Logo.getAttribute("alt")}" data-fileentryid="${Logo.getAttribute("fileEntryId")}" src="${Logo.getData()}" />
</#if>
            </a>
        </div>
        <#if FooterSections.getSiblings()?has_content>
        	<#list FooterSections.getSiblings() as cur_FooterSections>
        		<#assign
        			webContentData = jsonFactoryUtil.createJSONObject(cur_FooterSections.getData())
        		/>
        		<@liferay_asset["asset-display"]
                                className = webContentData.className
                                classPK = getterUtil.getLong(webContentData.classPK, 0)
                                />
        	</#list>
        </#if>
        </div>
    <div class="footer__info bg-dark text-white">
		<p>${FooterText.getData()}</p>
	</div>
</footer>

<!-- Footer CSS -->

<style>
.footer__container{
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    justify-content: space-evenly;
    margin: 0 auto;
    background-color: var(--jmEgyptianBlue-color);
    color: var(--jmWhite-color);
    padding: 48px 0px 15px 0px;
    align-items: flex-end;
}

.jmfooter__heading {
    line-height: 21px;
    font-family: JMSansMedium;
    margin: 0px;
    padding-bottom: 27px;
    font-family: jmsansextended,Verdana,sans-serif;
    font-weight: 500;
    font-size: 1rem;
}

.jmfooter__list{
    padding: 0px 0px 20px 0px;
}

.jmfooter__links{
   padding: 0px !important;
   list-style: none;
}

.jmfooter__listlink{
   font-family: JMSansRegular;
   color: var(--jmCrayola-color);
   font-size: 16px;
   line-height: 21px;
   text-decoration: none;
   opacity: 0.65;
}

footer {
   background-color: #1e22aa;
   color: white;
}

a.jmfooter__listlink:hover {
    color: #fff;
}

.footer__info {
  display: flex;
  flex-wrap: wrap;
  color: #999;
}

.footer__addr h2 {
  margin-top: 1.3em;
  font-size: 15px;
  font-weight: 400;
}

.jmlogo {
    display: inline-block;
    line-height: 1;
    margin-bottom: 166px;
    color:#fff;
}
</style>
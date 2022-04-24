<#assign namespace = renderResponse.getNamespace()>
<#assign journalService = serviceLocator.findService('com.liferay.journal.service.JournalArticleService')/>
<#assign hits = searchResultsPortletDisplayContext.getDocuments()>

<div class="search__results search--locresults" id="search__results-${namespace}">
    <div class="explore__right">
        <div class="explore__rightinner">
            <h1 class="explore__heading">
                <span>Global locations</span>
				<span class="explore__filtericon"></span>
            </h1>
            <div class="explore__results">
                <div class="accordion" id="accordion-${namespace}">
                <#if entries?has_content>

                    <#assign locationDetails = [] />
                    <#assign renderingCountry = "--NULL--" />

                	<#list entries as entry>
                	    <#if !entry.isTemporarilyUnavailable()>
                	        <#assign
                	            hit = hits[entry?index]
                	            journalArticle = journalService.getArticle(getterUtil.getLong(hit.groupId), hit.articleId)
                                document = saxReaderUtil.read(journalArticle.getContentByLocale(locale.toString()))
                                rootElement = document.getRootElement()

                                xPathSelector = saxReaderUtil.createXPath("dynamic-element[@name='Country']")
                                country = xPathSelector.selectSingleNode(rootElement).getStringValue()?trim

                                xPathSelector = saxReaderUtil.createXPath("dynamic-element[@name='City']")
                                city = xPathSelector.selectSingleNode(rootElement).getStringValue()?trim

                                xPathSelector = saxReaderUtil.createXPath("dynamic-element[@name='Address']")
                                address = xPathSelector.selectSingleNode(rootElement).getStringValue()?trim?replace("\n", "<br/>")

                                xPathSelector = saxReaderUtil.createXPath("dynamic-element[@name='ContactDetails']")
                                contactDetails = xPathSelector.selectSingleNode(rootElement).getStringValue()?trim?replace("\n", "<br/>")

                                xPathSelector = saxReaderUtil.createXPath("dynamic-element[@name='MapLink_Title']//dynamic-element[@name='MapLink_External']")
                                mapLink = xPathSelector.selectSingleNode(rootElement).getStringValue()?trim

                                locationDetail = {'country': country, 'city': city, 'address': address, 'contactDetails': contactDetails, 'mapLink': mapLink}
                            />
                            <#if entry?is_last>
                                <#assign
                                    locationDetails = locationDetails + [locationDetail]
                                />
                                <@renderCountryLocations countryName=country locationDetails=locationDetails index=entry?index />
                            <#elseif (country != renderingCountry && renderingCountry != '--NULL--')>
                                <@renderCountryLocations countryName=renderingCountry locationDetails=locationDetails index=entry?index />
                                <#assign
                                    renderingCountry = country
                                    locationDetails = [locationDetail]
                                />
                            <#else>
                                <#assign
                                    renderingCountry = country
                                    locationDetails = locationDetails + [locationDetail]
                                />
                            </#if>
    					</#if>
                	</#list>
                </#if>
                </div>
            </div>
        </div>
    </div>
</div>

<#macro renderCountryLocations countryName locationDetails index>
    <div class="jmaccrdn__section">
        <div class="jmaccrdn__title" data-toggle="collapse" data-target="#section${namespace}${index}"
            aria-expanded="true" aria-controls="section${namespace}">
        	<p>
        	    ${countryName}
        	    <span class="jmaccrdn__arrow"></span>
        	</p>
        </div>
        <div id="section${namespace}${index}" class="jmaccrdn__body collapse" data-parent="#accordion-${namespace}">
            <div class="jmaccrdn__answer-sec">
                <#list locationDetails as locationDetail>
                    <div class="row country-locations">
                        <div class="col-md-4">
                            <div class="jmcountry-title">City</div>
                            <div>${locationDetail.city}</div>
                        </div>
                        <div class="col-md-4">
                            <div class="jmcountry-title">Address</div>
                            <div>${locationDetail.address}</div>
                        </div>
                        <div class="col-md-4">
                            <div class="jmcountry-title">Contact Details</div>
                            <div>${locationDetail.contactDetails}</div>
                            <div class="map-link-cont">
                                <a class="map-link" href="${locationDetail.mapLink}" target="_blank">Map Link</a>
                            </div>
                        </div>
                    </div>
                </#list>
            </div>
        </div>
    </div>
</#macro>

<script>
$(function() {
    $("#search__results-${namespace}").parent().find(".pagination-bar").hide();
});
</script>
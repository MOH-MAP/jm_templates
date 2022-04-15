<#assign namespace = randomNamespace />

<div class="event__container event--templ" id="event-${namespace}">
    <div class="row">
        <div class="col-md-12">
            <div class="event__card mb-3">
                <div class="row event__row">
                    <div class="col-md-6 event__align-left">
                        <#assign Date_Data=getterUtil.getString(Date.getData())>
                        <#if validator.isNotNull(Date_Data)>
                            <#assign Date_DateObj=dateUtil.parseDate("yyyy-MM-dd", Date_Data, locale)>
                                ${dateUtil.getDate(Date_DateObj, "dd MMM yyyy", locale)}
                        </#if>
                    </div>
                    <div class="col-md-6 event__align-right">
                        <select id="select_${namespace}" class="event__select">
                        	<option value="Google Calendar">Google Calendar</option>
                        	<option value="Apple Calendar">Apple Calendar</option>
                        	<option value="Outlook Calendar">Outlook Calendar</option>
                        </select>
                    </div>
                </div>
                <div class="event__card-body">
                    <h2 class="event__card-heading">${Title.getData()}</h2>
                    <#if (PreTitle.getData())??>
                        <h5 class="event__card-title">${PreTitle.getData()}</h5>
                    </#if>
                    <h6 class="event__card-location">${Location.getData()}</h6>
                    <p class="event__card-text">${Body.getData()}</p>

                    <#assign linkHref = "#" />
    				<#assign linkTitle = "Read More" />
                    <#assign linkTarget = "" />
    				<#if EventUrl_Title?? && EventUrl_Title.getData()?has_content>
    					<#assign linkTitle = EventUrl_Title.getData()/>
    				</#if>
    
    				<#if EventUrl_Title.EventURL_Internal?? && EventUrl_Title.EventURL_Internal.getFriendlyUrl()?has_content>
    					<#assign linkHref = EventUrl_Title.EventURL_Internal.getFriendlyUrl() />
    				<#elseif EventUrl_Title.EventURL_Media?? && EventUrl_Title.EventURL_Media.getData()?has_content>
    					<#assign linkHref = EventUrl_Title.EventURL_Media.getData() />
    				<#elseif EventUrl_Title.EventURL_Mailto?? && EventUrl_Title.EventURL_Mailto.getData()?has_content>
    					<#assign linkHref = "mailto:" + EventUrl_Title.EventURL_Mailto.getData() />
    				<#elseif EventUrl_Title.EventURL_External?? && EventUrl_Title.EventURL_External.getData()?has_content>
    					<#assign linkHref = EventUrl_Title.EventURL_External.getData() />
    				</#if>
    
    				<#if linkHref?has_content>
    					<#if EventUrl_Title.EventURL_Target??>
    				        <#assign linkTarget = EventUrl_Title.EventURL_Target.getData()>
    				    </#if>
                        <a class="event__list-link" href="${linkHref}" target="${linkTarget}">
                            <span class="event__link-text">${linkTitle}</span>
                            <span class="event__link-icon"></span>
                        </a>
    				</#if>
                </div>
            </div>
        </div>
    </div>
</div>
 

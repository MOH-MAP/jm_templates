<div class="container">
    <div class="row person__container personpage__templ">
        <div class="col-md-7">
            <div>
                <#if (PersonName.getData())??>
                    <h1 class="person__name">${PersonName.getData()}</h1>
                </#if>
                <#if (Role.getData())??>
                    <h4 class="person__title">${Role.getData()}</h4>
                </#if>
                <div>
                    <#if (ImageLarge.getData())?? && ImageLarge.getData() != "">
                    	<img alt="${ImageLarge.getAttribute("alt")}" data-fileentryid="${ImageLarge.getAttribute("fileEntryId")}" src="${ImageLarge.getData()}" />
                    </#if>
                </div>
                <div>
                    <#if (DetailTitle.getData())??>
                        <h3 class="person__subtitle">
                            ${DetailTitle.getData()}
                        </h3>
                    </#if>
                    <#if (DetailSummary.getData())??>
                        <div class="person__details">${DetailSummary.getData()}</div>
                    </#if>
                </div>
            </div>
        </div>
        <div class="col-md-5 personpage__right-section">
            <#if (SubHeadingTitle.getData())??>
                <h1 class="person__key">
            	    ${SubHeadingTitle.getData()}
            	</h1>
            </#if>
            <#if (SubHeadingSummary.getData())??>
                <div class="person__keycontainer">
                	${SubHeadingSummary.getData()}
            	</div>
            </#if>
        </div>
	</div>
</div>
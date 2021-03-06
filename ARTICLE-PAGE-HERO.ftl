<div class="jmarticel--hero-temp">
    <div class="container">
		<div class="row">
            <div class="jmarticle-hero-content">
				<h1 class="jmarticle--hero-heading">${Name.getData()}</h1>
                <#if (SubTitle.getData())??>
				    <p class="jmarticle--hero-para">${SubTitle.getData()}</p>
                </#if>
				<div> 
                    <#assign Date_Data = getterUtil.getString(Date.getData())>
					<#if validator.isNotNull(Date_Data)>
						<#assign Date_DateObj = dateUtil.parseDate("yyyy-MM-dd", Date_Data, locale)>
						${dateUtil.getDate(Date_DateObj, "dd MMM yyyy - HH:mm:ss", locale)}
					</#if>
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
                    <div>
                        <a class="jmarticle--hero-btn" href="${linkHref}" title="${Link_Title.getData()}">
                            <span>${Link_Title.getData()}</span>
                            <span class="jmarticle--hero-arrow_icon"></span>
                        </a>
                    </div>
                </#if>
            </div>
        </div>
    </div>
</div>
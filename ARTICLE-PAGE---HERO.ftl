<#assign namespace = randomNamespace />
<div class="hero jmarticle__hero-main-container" id="jmarticle__hero-${namespace}">
    <div class="container">
        <div class="row">
            <div class="article__cont">
                <h1 class="article__heading">${Title.getData()}</h1>
                <#if (SubTitle.getData())??>
                    <p class="article__para">
                        ${SubTitle.getData()}
                    </p>
                </#if>
                <#assign Date_Data=getterUtil.getString(Date.getData())>
                <#if validator.isNotNull(Date_Data)>
                    <p class="article__date">
                        <#assign Date_DateObj=dateUtil.parseDate("yyyy-MM-dd", Date_Data, locale)>
                        ${dateUtil.getDate(Date_DateObj, "dd MMMM yyyy", locale)}
                    </p>
                </#if>
                <#if Link_Title?? && Link_Title.getData()?has_content>
                    <#assign linkHref="#" />
                    <#if Link_Title.Link_Internal?? && Link_Title.Link_Internal.getFriendlyUrl()?has_content>
                        <#assign linkHref=Link_Title.Link_Internal.getFriendlyUrl() />
                    <#elseif Link_Title.Link_Media?? && Link_Title.Link_Media.getData()?has_content>
                        <#assign linkHref=Link_Title.Link_Media.getData() />
                    <#elseif Link_Title.Link_Mailto?? && Link_Title.Link_Mailto.getData()?has_content>
                        <#assign linkHref="mailto:" + Link_Title.Link_Mailto.getData() />
                    <#elseif Link_Title.Link_External?? && Link_Title.Link_External.getData()?has_content>
                        <#assign linkHref=Link_Title.Link_External.getData() />
                    </#if>
                    <div>
                        <div class="jmarticle__hero-btn-list">
                            <a class="article__btn" href="${linkHref}" title="${Link_Title.getData()}">
                                <span class="btn__text">${Link_Title.getData()}</span>
                                <span class="arrow__forward"></span>
                            </a>
                        </div>
                    </div>
                </#if>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="article__intro">
            <#if (Introduction.getData())??>
                ${Introduction.getData()}
            </#if>
        </div>
    </div>
</div>

<#if (ImageLarge.getData())?? && ImageLarge.getData() != "">
    <style>
        #jmarticle__hero-${namespace} {
            background-image: url("${ImageLarge.getData()}");
            background-position: center;
            background-size: cover;
        }
    </style>
</#if>
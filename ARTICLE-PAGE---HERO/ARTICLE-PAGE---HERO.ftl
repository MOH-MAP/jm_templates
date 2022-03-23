<div class="hero jmarticle--hero-main-container"
 style="background-image: url(" ${ImageLarge.getData()}");">
  <div class="container">
    <div class="row">
      <div class=" article__cont">
        <h1 class="article__heading">${Name.getData()}</h1>
        <p class="article__para">
          <#if (SubTitle.getData())??>${SubTitle.getData()}</#if>
        </p>
        <div>
          <#assign Date_Data=getterUtil.getString(Date.getData())>
            <#if validator.isNotNull(Date_Data)>
              <#assign Date_DateObj=dateUtil.parseDate("yyyy-MM-dd", Date_Data, locale)>
                ${dateUtil.getDate(Date_DateObj, "dd MMM yyyy - HH:mm:ss", locale)}
            </#if>
        </div>
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
            <div class="jmarticle-hero-btn-desktop">
              <a class="article__btn" href="${linkHref}">${Link_Title.getData()}
                <span class="arrow__forward"></span>
              </a>
            </div>
          </div>
        </#if>
      </div>
    </div>
  </div>
</div>
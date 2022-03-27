<section class="main__sec jmdate--page-hero-temp">
  <div class="hero" style="background-image: url('background.svg');">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <h1 class="datepagehero__heading">
            <#if (Title.getData())??>${Title.getData()}</#if>
          </h1>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div>
      <#assign webContentData=jsonFactoryUtil.createJSONObject(Event.getData()) />
      <@liferay_asset["asset-display"] className=webContentData.className
        classPK=getterUtil.getLong(webContentData.classPK, 0) />
    </div>
  </div>
</section>
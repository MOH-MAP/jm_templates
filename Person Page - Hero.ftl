<div class="container jmperson--temp">
  <div class="row person__container">
    <div class="col-md-6">
      <div>
        <#if (PersonName.getData())??>
          <p class="person__name">${PersonName.getData()}</p>
        </#if>
        <#if (Role.getData())??>
          <h4 class="person__title">${Role.getData()}</h4>
        </#if>
        <div>
          <#if (ImageSmall.getData())?? && ImageSmall.getData() != "">
              <img  class="person_mbimg"  alt="${ImageSmall.getAttribute("alt")}" data-fileentryid="${ImageSmall.getAttribute("fileEntryId")}" src="${ImageSmall.getData()}" />
          </#if>
        </div>
      <div>
      <#if (DetailTitle.getData())??>
        <h5 class="person__subtitle">
          ${DetailTitle.getData()}
        </h5>
      </#if>
      <#if (DetailSummary.getData())??>
        <p>${DetailSummary.getData()}</p>
      </#if>
    </div>
    <div class="col-md-6 person__img--sec">
      <#if (ImageLarge.getData())?? && ImageLarge.getData() != "">
      <img class="person_dsktpimg" alt="${ImageLarge.getAttribute("alt")}" data-fileentryid="${ImageLarge.getAttribute("fileEntryId")}" src="${ImageLarge.getData()}" />
      </#if>
    </div>
  </div>
</div>

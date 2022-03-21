<div class="container">
    <div class="row person__container">
    <div class="col-md-6">
    <div>
      <p class="person__name"><#if (PersonName.getData())??>${PersonName.getData()}</#if></p>
      <h4 class="person__title"><#if (Role.getData())??>${Role.getData()}</#if></h4>
        <div >
        <#if (ImageSmall.getData())?? && ImageSmall.getData() != "">
            <img  class="person_mbimg"  alt="${ImageSmall.getAttribute("alt")}" data-fileentryid="${ImageSmall.getAttribute("fileEntryId")}" src="${ImageSmall.getData()}" />
        </#if>
        </div>
     <div>  
    <h5 class="person__subtitle"><#if (DetailTitle.getData())??>${DetailTitle.getData()}</#if></h5>
    <p><#if (DetailSummary.getData())??>${DetailSummary.getData()}</#if></p>
    </div> 
    </div>
    </div>
    <div class="col-md-6 person__img--sec">
    <#if (ImageLarge.getData())?? && ImageLarge.getData() != "">
    <img class="person_dsktpimg" alt="${ImageLarge.getAttribute("alt")}" data-fileentryid="${ImageLarge.getAttribute("fileEntryId")}" src="${ImageLarge.getData()}" />
    </#if>
    </div>
    </div>
</div>
<style>
    .person__container{
    margin-bottom: 100px;
    }
    @media(min-width: 320px) and (max-width: 834px){
   .person__container{
     margin-bottom: 50px;
    }
   }

</style>
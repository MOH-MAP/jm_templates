<div class="container">
      <div class="row">
        <div class="panel-flex-container">
          <div class="flex-item-left">
            <div class="article-heading-left">
              ${Name.getData()}
            </div>
            <div class="article-content-left">
              ${Body.getData()}
            </div>
          </div>
          <div class="flex-item-right">
            <div class="article-image-container">
               <picture>
        			<#if (ImageLarge.getData())?? && ImageLarge.getData() != "">
        				<source media="(min-width: 1480px)" srcset="${ImageLarge.getData()}">
        			</#if>
        			<#if (ImageLarge.getData())?? && ImageLarge.getData() != "">
        				<source media="(min-width: 1024px)" srcset="${ImageMedium.getData()}">
        			</#if>
        			<#if (ImageSmall.getData())?? && ImageSmall.getData() != "">
        				<img class="img-fluid" alt="${ImageSmall.getAttribute("alt")}" data-fileentryid="${ImageSmall.getAttribute("fileEntryId")}" src="${ImageSmall.getData()}" />
        			</#if>
        		</picture>
             </div>
          </div>
        </div>
    </div>
</div>
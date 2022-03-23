<#assign namespace = randomNamespace >
<div class="accordion-section">
    <div class="jmaccrdn__title" data-toggle="collapse" data-target="#section${namespace}"
        aria-expanded="true" aria-controls="section${namespace}">
        <#if (Title.getData())??>
        	<p>
        	   ${Title.getData()}
        	    <span class="jmaccrdn__arrow"></span>
        	</p>
        </#if>
    </div>

    <div id="section${namespace}" class="jmaccrdn__body collapse" data-parent="#accordion">
        <#if (Body.getData())??>
            <div class="jmaccrdn__answer--sec">
            	<p>${Body.getData()}</p>
            </div>
        </#if>
    </div>
</div>
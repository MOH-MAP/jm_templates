<#assign namespace=randomNamespace />

<div id="general-hero-${namespace}" class="jmgeneral--hero">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <#if (Title.getData())??>
                    <h1 class="general_hero__heading">
                        ${Title.getData()}
                    </h1>
                </#if>
            </div>
        </div>
    </div>
</div>
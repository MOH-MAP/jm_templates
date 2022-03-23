<div class=" jm-statistic-panel">
    <div class="jm-panel-title">
        <#if (CurrencyPrefix.getData())??>
            ${CurrencyPrefix.getData()}
        </#if>
        <#if (Amount.getData())??>
            ${Amount.getData()}
        </#if>
        <#if (PostFixSymbol.getData())??>
            ${PostFixSymbol.getData()}
        </#if>
    </div>
    <#if (Title.getData())??>
        <div class="jm-panel-subtitle">
            ${Title.getData()}
        </div>
    </#if>
</div>
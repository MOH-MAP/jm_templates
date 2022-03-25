<div class="jm-panel jmstatistic--panel-temp">
    <div class="container">
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
        <div class="jm-panel-subtitle">
            <#if (Title.getData())??>
                ${Title.getData()}
            </#if>
        </div>
    </div>
</div>
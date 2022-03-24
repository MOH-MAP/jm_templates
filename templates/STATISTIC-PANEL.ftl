<div class="jm-panel jm-statistic-panel">
<div class="jm-panel-title">
<#if (CurrencyPrefix.getData())??>
	${CurrencyPrefix.getData()}
</#if><#if (Amount.getData())??>
	${Amount.getData()}
</#if><#if (PostFixSymbol.getData())??>
	${PostFixSymbol.getData()}
</#if>
</div>
<div class="jm-panel-subtitle">
<#if (Title.getData())??>
	${Title.getData()}
</#if>
</div>
</div>

<style>
    .jm-panel1 {
        background-color: #1E22AA;
        color: white;
        padding: 20px;
    }

    .jm-panel .jm-panel-title {
        font-size: 34px;
        font-family: JMSansMedium;
        line-height: 32px;
        text-align: left;
        letter-spacing: 0px;
        color: #FFFFFF;
        text-transform: lowercase;
        opacity: 1;
    }

    .jm-panel .jm-panel-subtitle {
        font-size: 17px;
        font-family: JMSansRegular;
        line-height: 32px;
        margin: 0;
        margin-top: 8px;
    }
</style>
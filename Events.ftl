<#assign containerId = randomNamespace />
<div class="event__container">
<#assign rowId = containerId />
<div class="row" id="${rowId}">
<div class="col-md-12">
<div class="event__card mb-3" >
<div class="row event__row">
<div class="col-md-6 event__align-left">
<#assign Date_Data = getterUtil.getString(Date.getData())>
<#if validator.isNotNull(Date_Data)>
<#assign Date_DateObj = dateUtil.parseDate("yyyy-MM-dd", Date_Data, locale)>
${dateUtil.getDate(Date_DateObj, "dd MMM yyyy", locale)}
</#if>
</div>
<div class="col-md-6 event__align-right">
<select id="select_${rowId}" class="event__select">
<#if addToCalendar.getSiblings()?has_content>
<#list addToCalendar.getSiblings() as cur_addToCalendar>
<option value='${cur_addToCalendar.getData()}'>
${cur_addToCalendar.getData()}
</option>
</#list>
</#if>
</select>
</div>
</div>
<div class="event__card-body">
<h5 class="event__card-title"><h2>${Title.getData()}</h2>
<h6 class="">${Location.getData()}</h6>
<p class="event__card-text">${Body.getData()}</p>
<#if EventUrl_Title.getSiblings()?has_content>
	<#list EventUrl_Title.getSiblings() as cur_EventUrl_Title>
<a class="event__list-link" href="${EventUrl_Title.EventURL_Internal.getFriendlyUrl()}">
<span class="event__link-text">${cur_EventUrl_Title.getData()}</span>
<span class="event__link-icon"></span>
</a>
</#list>
</#if>
</div>
</div>
</div>
</div>
</div>

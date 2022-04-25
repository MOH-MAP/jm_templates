<#assign namespace = renderResponse.getNamespace()>
<#assign journalService = serviceLocator.findService('com.liferay.journal.service.JournalArticleService')/>
<#assign hits = searchResultsPortletDisplayContext.getDocuments()>

<div class="search__results search--downloadsresults" id="search__results-${namespace}">
    <div class="explore__right">
        <div class="explore__rightinner">
            <h1 class="explore__heading">
                <span>Downloads</span>
				<span class="explore__filtericon"></span>
            </h1>
            <div class="explore__results">
                <#if entries?has_content>
                	<#list entries?chunk(3) as row>
                	    <div class="row explore__download-list-cont">
                            <#list row as entry>
                                <div class="explore__download-list">
                                <#assign
                                    hit = hits[entry?index]
                                    journalArticle = journalService.getArticle(getterUtil.getLong(hit.groupId), hit.articleId)
                                    document = saxReaderUtil.read(journalArticle.getContentByLocale(locale.toString()))
                                    rootElement = document.getRootElement()

                                    xPathSelector = saxReaderUtil.createXPath("dynamic-element[@name='Title']")
                                    title = xPathSelector.selectSingleNode(rootElement).getStringValue()?trim

                                    xPathSelector = saxReaderUtil.createXPath("dynamic-element[@name='File']")
                                    file = xPathSelector.selectSingleNode(rootElement).getStringValue()?trim
                                    
                                    dlFileEntryId = file?eval.fileEntryId?number
                                />
                                    <#assign dlFileEntryLocalService = serviceLocator.findService("com.liferay.document.library.kernel.service.DLFileEntryLocalService")>
                                    <#assign dlFileEntry = dlFileEntryLocalService.getDLFileEntry(dlFileEntryId) />
                                    <#assign 
                                        textFormatter = staticUtil["com.liferay.portal.kernel.util.TextFormatter"]
                                        sizeFormatted = textFormatter.formatStorageSize(dlFileEntry.size, locale) 
                                    />

                                    <div class="download-title">${title}</div>
                                    <div class="download-detail">
                                        ${dlFileEntry.extension?upper_case}, ${sizeFormatted}
                                    </div>
                                </div>
                            </#list>
                        </div>
                	</#list>
                </#if>
            </div>
        </div>
    </div>
</div>

<script>
$(function() {
    $("#search__results-${namespace}").parent().addClass('jm_pagination');
    $("#search__results-${namespace}").parent().find(".pagination-bar .pagination-results").html("${searchContainer.getStart()+1}-${searchContainer.getResultEnd()} of  ${searchContainer.getTotal()}");
});
</script>
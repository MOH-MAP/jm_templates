<div class="container">
    <div class="jmdownload-inner-container">
        <div class="row">
            <div class="col-md-9 jmdownload-left-side">
                <#if (Title.getData())??>
                    <h1>
                        ${Title.getData()}
                    </h1>
                </#if>
                <#if (File.getData())?? && File.getData() != "">
                    <a href="${File.getData()}" target="_blank" title="${FileType.getData()}" class="jmdownload-list-link">
                        <span class="jmdownload-list-item">
                            ${languageUtil.format(locale, "download-x", "File", false)}
                            <span>${FileType.getData()}</span>
                        </span>
                        <span class="jmdownload-link-icon"></span>
                    </a>
                </#if>
            </div>
            <div class="col-md-3 jmdownload-right-side">
                <#if (Image.getData())?? && Image.getData() != "">
                    <img class="jmdownload-right-img" alt="${Image.getAttribute("alt")}" data-fileentryid="${Image.getAttribute("fileEntryId")}" src="${Image.getData()}" />
                </#if>
            </div>
        </div>
    </div>
</div>
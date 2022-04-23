<#assign JSONFactoryUtil = staticUtil["com.liferay.portal.kernel.json.JSONFactoryUtil"] />
<#assign journalArticleLocalService = serviceLocator.findService("com.liferay.journal.service.JournalArticleLocalService") />
<#assign serviceContext = staticUtil["com.liferay.portal.kernel.service.ServiceContextThreadLocal"].getServiceContext()/>
<#assign themeDisplay = serviceContext.getThemeDisplay() />
<#assign siteName = layout.getGroup().friendlyURL />


<#if entries?has_content>
<div class="container-fluid">
    <div class="row">
        <div class="tabbed-article-heading">Expert Insight</div>
        <div class="tabbed-article-flex-container">
        <#list entries as curEntry>
            <#assign 
                assetRenderer = curEntry.getAssetRenderer()
                journalArticle = assetRenderer.getAssetObject()
                document = saxReaderUtil.read(journalArticle.getContent())
                rootElement = document.getRootElement()
                    
                xPathSelector = saxReaderUtil.createXPath("dynamic-element[@name='Name']")
                heading = xPathSelector.selectSingleNode(rootElement).getStringValue()?trim
                
                xPathSelector = saxReaderUtil.createXPath("dynamic-element[@name='SubTitle']")
                subTitle = xPathSelector.selectSingleNode(rootElement).getStringValue()?trim
                
                xPathSelector = saxReaderUtil.createXPath("dynamic-element[@name='Date']")
                publishDate = xPathSelector.selectSingleNode(rootElement).getStringValue()?trim
				
				xPathSelectorAuthor = saxReaderUtil.createXPath("dynamic-element[@name='Author']")
				
				xPathSelector = saxReaderUtil.createXPath("dynamic-element[@name='Path']")
				path = xPathSelector.selectSingleNode(rootElement).getStringValue()?trim
					
				latestUrl = "/web"+siteName+path?keep_after("/sitecore/content/johnson-matthey")
                
                formatDate = publishDate?date("yyyy-MM-dd")
                
                siteId = themeDisplay.getSiteGroupId()
                
                jsonSmallDlFileEntryAsString = document.valueOf("//dynamic-element[@name='ImageSmall']/dynamic-content/text()")
                
                imageSmallSrc = JSONFactoryUtil.createJSONObject(jsonSmallDlFileEntryAsString).getString("uuid")
                
                jsonMediumDlFileEntryAsString = document.valueOf("//dynamic-element[@name='ImageMedium']/dynamic-content/text()")
                
                imageMediumSrc = JSONFactoryUtil.createJSONObject(jsonMediumDlFileEntryAsString).getString("uuid")
                
                jsonLargeDlFileEntryAsString = document.valueOf("//dynamic-element[@name='ImageLarge']/dynamic-content/text()")
                
                imageLargeSrc = JSONFactoryUtil.createJSONObject(jsonLargeDlFileEntryAsString).getString("uuid")
            />
			
			<#if xPathSelectorAuthor.selectSingleNode(rootElement)??>
			    <#assign 
					authDetails = xPathSelectorAuthor.selectSingleNode(rootElement).getStringValue()?trim 
			
					authJSON = jsonFactoryUtil.createJSONObject(authDetails)
	            
					personJournal = journalArticleLocalService.getArticleByUrlTitle(themeDisplay.getScopeGroupId(),authJSON.title)
	            
					docXML = saxReaderUtil.read(personJournal.getContent())
                
					fullName = docXML.valueOf("//dynamic-element[@name='FullName']/dynamic-content/text()")
                
					authorImageXML = docXML.valueOf("//dynamic-element[@name='Photo']/dynamic-content/text()")
                
					authImageSrc = JSONFactoryUtil.createJSONObject(authorImageXML).getString("uuid")
				/>
			</#if>
			
            <div class="tabbed-article-flex-item">
                <div class="tabbed-article-thumbnail">
                    <img src="/documents/${siteId}/${imageSmallSrc}" alt="tabbed article item" />
                    <div class="tabbed-thumbnail-title">
                        <span class="tabbed-profile-pic">
							<#if authImageSrc?has_content>
								<img src="/documents/${siteId}/${authImageSrc}" alt="profile pic">
							</#if>
                        </span>
                        <span class="title-text">
							<#if fullName?has_content>
								${fullName}
							</#if>
						</span>
                        <span class="title-date">${formatDate?string["dd 'TH' MMM yyyy"]}</span>
                    </div>
                    <div class="tumbnail-caption-heading">
                        ${heading}
                    </div>
                    <div class="thumbnail-caption-text">
                        <p>
                            ${subTitle?replace('<[^>]+>','','r')}
                            <a href=${latestUrl}><span class="caption-read-more">..Read more</span></a>
                            <i class="tabbed-right-arrow-block">
                                <img src="./assets/arrow_forward-blue.svg" alt="" />
                            </i>
                        </p>
                    </div>
                </div>
            </div>
        </#list>
        </div>
    </div>
</div>
</#if>

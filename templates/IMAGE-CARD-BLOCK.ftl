<#assign JournalArticleLocalService = serviceLocator.findService("com.liferay.journal.service.JournalArticleLocalService")>

<style>
	.image-card {
	    background-color: #f2f2f2;
	}   
	.card {
		border: 0;
		border-radius: 0;
		border-bottom: 15px solid #1E22AA;
	}
	.list-link {
		text-decoration: none;
		text-decoration-color: #1E22AA;
		color: #1E22AA;
		font: 18px/22px JMSansMedium;
		display: flex;
	}

	.list-item .list-link {
		text-decoration: none;
		text-decoration-color: #1E22AA;
		color: #1E22AA;
		font: 18px/22px JMSansMedium;
		display: flex;
	}
    .link-icon {
		background: url('https://webserver-jmliferay-test.lfr.cloud/o/platinum-standalone-theme/images/new_platinum_images/arrow_forward-blue.svg') 0 0 no-repeat transparent;
		display: block;
		width: 24px;
		height: 24px;
		margin-left: 8px;
	}
	.card-img {
	    height: 212px;
	}
</style>

<div class="image-card-block container">
    <div class="image-card-block__inner">
        <#if Title?? && Title.getData()?has_content>
        <div class="image-card-block__header mt-5 mb-5">
            <h2 class="image-card-block__title">${Title.getData()}</h2>
        </div>
        </#if>
        <div class="image-card-block__body">
            <div class="image-card-block__row row">
                <#if ImageCards?? && ImageCards.getSiblings()?has_content>
                    <#assign tileCount = ImageCards.getSiblings()?size />
                	<#list ImageCards.getSiblings() as cur_ImageCards>
                	    <#assign tileColCssClass = "col-md-6" />
                        <#if tileCount gte 3 >
                            <#assign tileColCssClass = "col-md-4" />
                        </#if>
                	    <div class="${tileColCssClass}">
                		<#assign
                			webContentData = jsonFactoryUtil.createJSONObject(cur_ImageCards.getData())
                		/>
                		<#assign
                            article = JournalArticleLocalService.getLatestArticle(getterUtil.getLong(webContentData.classPK, 0))
                        />
        				<@liferay_journal["journal-article"]
        				    articleId = article.getArticleId()
        				    ddmTemplateKey = "IMAGE-CARD"
        				    groupId = article.getGroupId()
        				/>
                        </div>
                	</#list>
                </#if>
            </div>
        </div>
    </div>
</div>
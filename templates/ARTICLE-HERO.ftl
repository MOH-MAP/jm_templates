<#if ArticleName.getSiblings()?has_content>
	<#list ArticleName.getSiblings() as cur_ArticleName>
	<#if ArticleName.ArticleDescription.getSiblings()?has_content>
	<#list ArticleName.ArticleDescription.getSiblings() as cur_ArticleName_ArticleDescription>
		
	
	<h1>	${cur_ArticleName.getData()}</h1>
	<div>	${cur_ArticleName_ArticleDescription.getData()} </div>
		</#list>
</#if>
	</#list>
</#if>
<div class="container">
<div class="faqblck__sec">
<h1 class="faqblck__heading">
   <#if (Title.getData())??>${Title.getData()}</#if>
</h1>
<div class="faqblck__list">
<#if (SubTitle.getData())??>
<p>	${SubTitle.getData()}</p>
</#if>
<#if AdditionalLinks_Title.getSiblings()?has_content>
				<#assign href = '#' >
                <#assign title = 'Explore'>
				<#list AdditionalLinks_Title.getSiblings() as cur_AdditionalLinks_Title>
					<#if cur_AdditionalLinks_Title.getData()?has_content>
						<#assign title = cur_AdditionalLinks_Title.getData()>
						<#if cur_AdditionalLinks_Title.AdditionalLinks_Internal.getFriendlyUrl()?has_content>
							<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Internal.getFriendlyUrl() >
						<#elseif cur_AdditionalLinks_Title.AdditionalLinks_Media.getData()?has_content>
							<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Media.getData() >
						<#elseif cur_AdditionalLinks_Title.AdditionalLinks_Mailto.getData()?has_content>
							<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Mailto.getData() >
						<#elseif cur_AdditionalLinks_Title.AdditionalLinks_External.getData()?has_content>
							<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_External.getData() >
						<#elseif cur_AdditionalLinks_Title.AdditionalLinks_Target.getData()?has_content>
							<#assign href = cur_AdditionalLinks_Title.AdditionalLinks_Target.getData() >
						</#if>
						<div class="">
						<a href="${href}">
							<span class="faqblck__arrow"></span>
						</a>
					</div>
					</#if>
					
				</#list>
            </#if>
</div>
</div>
</div>
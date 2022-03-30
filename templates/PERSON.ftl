<div class="person__container">
	<div class="person-grid">
		<div class="person_card">
			<#if (Photo.getData())?? && Photo.getData() != "">
				<img alt='${Photo.getAttribute("alt")!}' data-fileentryid='${Photo.getAttribute("fileEntryId")}' src="${Photo.getData()}" alt="Card image" style="width:100%" 
				class="card-img-top person_img"/>
			</#if>
			<div class="person_card-body">
				<h4 class="person_card-title">${FullName.getData()}</h4>
				<h6 class="person_card-text">${ContactInfo.getData()}</h6>
				<#if TelephoneNumbers?? && TelephoneNumbers.getSiblings()?has_content>
					<#list TelephoneNumbers.getSiblings() as cur_TelephoneNumbers>
						<h6 class="person_card-number">${cur_TelephoneNumbers.getData()}</h6>
					</#list>
				</#if>
				<button class="btn__person">
					<a href="#" class="btn-person_link">SEND A MESSAGE
						<span class="person_explore-icon"></span>
					</a>
				</button>
			</div>
		</div>
	</div>
</div>

<style>
.journal-content-article[data-analytics-asset-title='Person'] .person_card{
    width: 33.3% !important;
}
</style>
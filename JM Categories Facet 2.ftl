<#assign assetVocabLocalService = serviceLocator.findService('com.liferay.asset.kernel.service.AssetVocabularyLocalService')/>
<#assign assetCatLocalService = serviceLocator.findService('com.liferay.asset.kernel.service.AssetCategoryLocalService')/>

<#assign vocabName = "matthey" />
<#assign vocab = assetVocabLocalService.fetchGroupVocabulary(themeDisplay.getScopeGroupId(), vocabName) />
<#assign catNames = ["Region|L1|Locations Sort By Option", "Sector|L1|Locations Sort By Option"] />

<#assign catMap = {} />
<#if entries?has_content>
	<#list entries as entry>
		<#assign catMap = catMap + {entry.getAssetCategoryId(): entry} /> 
	</#list>
</#if>

<div class="search__filters search--locations">
    <div class="explore__left">
        <div class="explore__leftinner">
            <div class="explore__filteroptions">
                <h1 class="explore__filtertext">
                    <span class="explore__filterback"></span>
                    <span> Filters </span>
                    <span class="explore__filterclear">Clear All</span>
                </h1>
            </div>
            <div class="explore__selectedfilter"></div>

            <#list catNames as catName>
                <#assign catNameWithoutLevel = catName?split("|")[0] />
                <#assign catLevel = catName?split("|")[1] />
                <#assign parentCatId = 0 />
                <#if (catName?split("|")[2])?? >
                    <#assign parentCat = assetCatLocalService.fetchCategory(themeDisplay.getScopeGroupId(), 0, catName?split("|")[2], vocab.getVocabularyId()) />
                    <#assign parentCatId = parentCat.getCategoryId() />
                </#if>
                <#assign parentCatName = (catName?split("|")[2])!"" />

                <#assign currentCat = assetCatLocalService.fetchCategory(themeDisplay.getScopeGroupId(), 
                    parentCatId, catNameWithoutLevel, vocab.getVocabularyId()) />

                <@renderFilters category=currentCat catMap=catMap level=catLevel />
            </#list>

        </div>
    </div>
</div>

<#macro renderFilters category catMap level>

    <#assign catsL2 = [] />

    <#if level == "L2">
        <h4 class="my-2">${category.getName()}</h4>
        <#assign catsL2 = assetCatLocalService.getChildCategories(category.getCategoryId()?number) />
    <#else>
        <#assign catsL2 = [category] />
    </#if>

    <div class="explore__categoryfilter">
        <#list catsL2 as l2>
            <div class="explore__applications ${(l2?is_first)?then('explore__expanded','')}">
                <h1 class="explore__apptext">
                    <span class="explore__filtercategory">${l2.getName()}</span>
                    <span class="explore__arrowicon"></span>
                </h1>
                <div class="explore__accordian">
                    <#assign catsL3 = assetCatLocalService.getChildCategories(l2.getCategoryId()?number) />
                    <#list catsL3 as l3>
                        <#if catMap[l3.getCategoryId()?string]??>
                            <#assign termContext = catMap[l3.getCategoryId()?string] />
                            <#assign index = random.nextInt() />
                            <div class="explore__checkboxcont">
                                <input type="checkbox" ${(termContext.isSelected())?then('checked','')}
                                    id="appCat1" class="facet-term explore__checkbox"
                                    data-term-id="${l3.getCategoryId()}" 
                                    onChange="Liferay.Search.FacetUtil.changeSelection(event);"
                                    name="${renderResponse.getNamespace()}term_${index}"
                                    id="${renderResponse.getNamespace()}term_${index}">
                                <label class="explore__checkboxlabel"></label>
                                    <label class="explore__label" for="appCat1">${l3.getName()}</label>
                            </div>
                        </#if>
                    </#list>
                </div>
            </div>
        </#list>
    </div>

</#macro>

<script>
$( document ).ready(function() {
    $('.explore__accordian').each((index, ele) => { 
        if($(ele).html().trim() == '') {
            $(ele).parent().hide();
        }
    });

	$('.search--locations .explore__apptext').on('click', function(){
        if (window.innerWidth > 834) {
            if (!$(this).parents('.explore__applications').hasClass('explore__expanded')) {
                $(this).parents('.explore__applications').addClass('explore__expanded');
            } else {
                $(this).parents('.explore__applications').removeClass('explore__expanded');
            }
        } else if (!$(this).parents('.explore__applications').hasClass('explore__expanded')) {
			$('.explore__applications').removeClass('explore__expanded');
			$(this).parents('.explore__applications').addClass('explore__expanded');
		}
	});

	$('.explore__filtericon').on('click', function(){
		$('.search--locations .explore__left').show();
		scrollPos = window.pageYOffset;
	});

	$('.explore__filterback').on('click', function(){
		$('.search--locations .explore__left').hide();
	});

	$('.explore__checkbox').on('click', function(){
		var elementId = $(this).attr('id');
		if ($(this).prop('checked')) {
			var filterText = $(this).parents('.explore__checkboxcont').find('.explore__label').text();
			var filterHtml = '<button dataparam='+elementId+' id="checkedFilter'+elementId+'" class="explore__filters"><span class="explore__filterselectedtext">'+filterText+'</span>';
			filterHtml += '<span class="jmicon jmicon--close"></span></button>';
			$('.explore__selectedfilter').append(filterHtml);
		} else {
			$('#checkedFilter'+elementId).remove();
		}

		if ($('.explore__filters').length) {
			$('.explore__selectedfilter').show();
		} else {
			$('.explore__selectedfilter').hide();
		}
	});

	$(document).on('click', '.jmicon--close', function(){
		var elementId = $(this).parents('.explore__filters').attr('dataparam');
		$('#'+elementId).click();
	});

	var scrollPos = 0;
	var scrollEventHandler = function() {
		if ($('.explore__left').is(':visible') && window.innerWidth <= 834) {
			window.scroll(0, scrollPos);
		}
	}

	window.addEventListener("scroll", scrollEventHandler, false);

	$('.explore__checkbox').each(function(){
		var elementId = $(this).attr('id');
		if ($(this).prop('checked')) {
			var filterText = $(this).parents('.explore__checkboxcont').find('.explore__label').text();
			var filterHtml = '<button dataparam='+elementId+' id="checkedFilter'+elementId+'" class="explore__filters"><span class="explore__filterselectedtext">'+filterText+'</span>';
			filterHtml += '<span class="jmicon jmicon--close"></span></button>';
			$('.explore__selectedfilter').append(filterHtml);
		} else {
			$('#checkedFilter'+elementId).remove();
		}

		if ($('.explore__filters').length) {
			$('.explore__selectedfilter').show();
		} else {
			$('.explore__selectedfilter').hide();
		}
	});

	$('.explore__filterclear').on('click', function(){
		$('.explore__checkbox').each(function(){
			$(this).attr('checked', false);
		});
	});
});
</script>
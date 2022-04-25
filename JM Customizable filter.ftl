<#assign assetVocabLocalService = serviceLocator.findService('com.liferay.asset.kernel.service.AssetVocabularyLocalService')/>
<#assign assetCatLocalService = serviceLocator.findService('com.liferay.asset.kernel.service.AssetCategoryLocalService')/>

<#assign config = customFilterDisplayContext.getHeading()?eval />
<#assign configJson = jsonFactoryUtil.createJSONObject() />

<#assign sink = configJson.put("title", config.title) />
<#assign sink = configJson.put("operator", config.operator) />
<#assign sink = configJson.put("selectWithinGroup", config.selectWithinGroup) />
<#assign sink = configJson.put("catTree", jsonFactoryUtil.createJSONArray()) />

<#list config.cats as cat>

    <#assign category = assetCatLocalService.getAssetCategory(cat.id) />

    <#assign catTree = jsonFactoryUtil.createJSONObject() />
    <@buildCategoryTree category=category depth=cat.depth include=cat.include exclude=cat.exclude input=catTree />

    <#assign sink = configJson.catTree.put(catTree) />

</#list>

<#macro buildCategoryTree category depth include exclude input >

    <#assign sink = input.put("id", category.getCategoryId()) />
    <#assign sink = input.put("name", category.getTitle(locale)) />
    <#assign sink = input.put("depth", depth) />
    <#assign sink = input.put("children", jsonFactoryUtil.createJSONArray()) />

    <#if (depth > 0) >
        <#assign childrenCats = assetCatLocalService.getChildCategories(category.getCategoryId()) />

        <#list childrenCats as childCat>
            <#if (include?size == 0 || include?seq_contains(childCat.getCategoryId())) 
                    && (exclude?size == 0 || !exclude?seq_contains(childCat.getCategoryId())) >
                <#assign child = jsonFactoryUtil.createJSONObject() />
                <#assign sink = input.children.put(child) />
                <@buildCategoryTree category=childCat depth=(depth -1) include=[] exclude=exclude input=child />
            </#if>
        </#list>
    </#if>

</#macro>

<div class="hide">
    <@liferay_aui["input"]
        cssClass="custom-filter-value-input hide"
        data\-qa\-id="customFilterValueInput"
        disabled=customFilterDisplayContext.isImmutable()
        id="${namespace}customFilterValueInput"
        label=""
        name="${htmlUtil.escapeAttribute(customFilterDisplayContext.getParameterName())}"
        useNamespace=false
        value="${htmlUtil.escapeAttribute(customFilterDisplayContext.getFilterValue())}"
        wrapperCssClass="form-group-item"
    />

    <@clay["button"]
        ariaLabel='${languageUtil.get(request, "apply")}'
        disabled=customFilterDisplayContext.isImmutable()
        elementClasses="btn-secondary hide"
        label='${languageUtil.get(request, "apply")}'
        type="submit"
        id="${namespace}customFilterSubmitBtn"
    />
</div>

<div class="search__filters search--locations hide" id="${namespace}search__filters">
    <input class="hide" value="${config.operator}" id="${namespace}operator" />
    <div class="explore__left">
        <div class="explore__leftinner">
            <div class="explore__filteroptions">
                <h1 class="explore__filtertext">
                    <span class="explore__filterback"></span>
                    <span id="${namespace}filterTitle">  </span>
                    <span class="explore__filterclear">Clear All</span>
                </h1>
            </div>
            <div class="explore__selectedfilter"></div>
        </div>
    </div>
</div>

<script>
    var updateFilter_${namespace} = function() {
        var newFilterValue = [];
        var operator = $('#${namespace}operator').val();

        $('#${namespace}search__filters .explore__checkbox:checked').each(function() {
            var termId = $(this).data('term-id');
            if(termId && termId != -1) {
                newFilterValue.push(termId);
            }
        });

        $('#${namespace}customFilterValueInput').val(newFilterValue.join(' ' + operator + ' '));
        console.log($('#${namespace}customFilterValueInput').val());
        $('#${namespace}customFilterSubmitBtn').click();
    }

    $(function() {
        var filterConfig = ${configJson};
        var filterValue = $('#${namespace}customFilterValueInput').val();
        var selectedFilters = [];
        if(filterValue) {
            selectedFilters = filterValue.split(" " + filterConfig.operator + " ");
        }

        $('#${namespace}filterTitle').html(filterConfig.title);

        var renderCategoryTree = function(category) {

            if(category.depth >= 2) {
                var childCategoryHTML = '';
                $.each(category.children, function(index, category) {
                    childCategoryHTML += renderCategoryTree(category);
                });
                return /*'<h4 class="my-2">' + category.name + '</h4>' + */ childCategoryHTML;
            } else if (category.depth == 1) {
                var childCategoryHTML = '';
                if(filterConfig.selectWithinGroup == 'single') {
                    category.children.unshift({'id': -1, 'name': 'All', 'depth': 0});
                }
                $.each(category.children, function(index, category) {
                    childCategoryHTML += renderCategoryTree(category);
                });
                return '<div class="explore__categoryfilter">'
                    +    '<div class="explore__applications explore__expanded">'
                    +       '<h1 class="explore__apptext">'
                    +           '<span class="explore__filtercategory">'+ category.name +'</span>'
                    +           '<span class="explore__arrowicon"></span>'
                    +       '</h1>'
                    +       '<div class="explore__accordian">'
                    + childCategoryHTML
                    +       '</div>'
                    +     '</div>'
                    + '</div>';
            } else if (category.depth == 0) {
                return '<div class="explore__checkboxcont">'
                    +    '<input type="checkbox"'
                    +       'class="facet-term explore__checkbox"'
                    +       'data-term-id="' + category.id + '"'
                    +       'onChange="updateFilter_${namespace}()"'
                    +       'name=""'
                    +       (selectedFilters.includes(category.id) ? 'checked ' : '')
                    +       'id="' + category.id + '">'
                    +    '<label class="explore__checkboxlabel"></label>'
                    +    '<label class="explore__label" for="' + category.id + '">' + category.name + '</label>'
                    + '</div>';
            } else {
                return '<div class="explore__checkboxcont">'
                    +    '<input type="radio"'
                    +       'class="facet-term explore__checkbox"'
                    +       'data-term-id="' + category.id + '"'
                    +       'onChange="updateFilter_${namespace}()"'
                    +       'name=""'
                    +       (selectedFilters.includes(category.id) ? 'checked ' : '')
                    +       'id="' + category.id + '">'
                    +    '<label class="explore__radiolabel"></label>'
                    +    '<label class="explore__label" for="' + category.id + '">' + category.name + '</label>'
                    + '</div>';
            }
        };

        $.each($(filterConfig.catTree), function(index, catTree){
            var catTreeHTML = renderCategoryTree(catTree);
            $('#${namespace}search__filters .explore__leftinner').append(catTreeHTML);
        });

        $('.explore__accordian').each((index, ele) => { 
            if($(ele).html().trim() == '') {
                $(ele).parent().hide();
            }
        });

        $('.explore__apptext').on('click', function(){
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
            $('.explore__left').show();
            scrollPos = window.pageYOffset;
        });

        $('.explore__filterback').on('click', function(){
            $('.explore__left').hide();
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

        $('#${namespace}search__filters').removeClass('hide');
    });
</script>
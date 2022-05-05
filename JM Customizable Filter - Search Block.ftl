<#assign assetVocabLocalService = serviceLocator.findService('com.liferay.asset.kernel.service.AssetVocabularyLocalService')/>
<#assign assetCatLocalService = serviceLocator.findService('com.liferay.asset.kernel.service.AssetCategoryLocalService')/>

<#assign config = customFilterDisplayContext.getHeading()?eval />
<#assign configJson = jsonFactoryUtil.createJSONObject() />

<#assign sink = configJson.put("title", config.title!'Filters') />
<#assign sink = configJson.put("operator", config.operator!"AND") />
<#assign sink = configJson.put("contextual", config.contextual!true) />
<#assign sink = configJson.put("sort", config.sort!false) />
<#assign sink = configJson.put("selectWithinGroup", config.selectWithinGroup!"multiple") />
<#assign sink = configJson.put("accordion", config.accordion!true) />
<#assign sink = configJson.put("showl2label", config.showl2label!true) />
<#assign sink = configJson.put("catTree", jsonFactoryUtil.createJSONArray()) />

<#list config.cats as cat>
    <#attempt>
        <#assign category = assetCatLocalService.getAssetCategory(cat.id) />

        <#assign catTree = jsonFactoryUtil.createJSONObject() />
        <@buildCategoryTree category=category depth=cat.depth include=cat.include exclude=cat.exclude input=catTree />

        <#assign sink = configJson.catTree.put(catTree) />
    <#recover>
    </#attempt>
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

<#assign pInstanceId = themeDisplay.portletDisplay.instanceId />
<#assign pNameCustomFilter = "com_liferay_portal_search_web_internal_custom_filter_portlet_CustomFilterPortlet" />
<#assign pNameCategoryFacet = "com_liferay_portal_search_web_category_facet_portlet_CategoryFacetPortlet" />
<#assign pNameSearchResults = "com_liferay_portal_search_web_search_results_portlet_SearchResultsPortlet" />
<#assign pNameSort = "com_liferay_portal_search_web_internal_sort_portlet_SortPortlet" />

<div class='jm__search__continer' id='jm__search__continer-${namespace}'>
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

    <div class="row">
        <div class='col-md-4'>
            <#if config.contextual!true>
            <@liferay_portlet["runtime"]
                instanceId="${pInstanceId}"
                portletName=pNameCategoryFacet
            />
            </#if>
            <@renderFilters />
            <#if config.sort!false>
                <@liferay_portlet["runtime"]
                    instanceId="${pInstanceId}"
                    portletName=pNameSort
                />
            </#if>
        </div>
        <div class='col-md-8'>
            <@liferay_portlet["runtime"]
                instanceId="${pInstanceId}"
                portletName=pNameSearchResults
            />
        </div>
    </div>
</div>

<#macro renderFilters>

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
    var updateFilter_${namespace} = function(additionalQuery) {
        var newFilterValue = [];
        var operator = $('#${namespace}operator').val();

        $('#${namespace}search__filters .explore__checkbox:checked').each(function() {
            var termId = $(this).data('term-id');
            if(termId && termId != -1) {
                newFilterValue.push(termId);
            }
        });

        var newFilter = newFilterValue.join(' ' + operator + ' ');
        var searchParams = new URLSearchParams(window.location.search);
        searchParams.set("${htmlUtil.escapeAttribute(customFilterDisplayContext.getParameterName())}", newFilter);

        searchParams.delete("delta");
        searchParams.delete("start");
        var additionalSearchParams = new URLSearchParams(additionalQuery||'');
        additionalSearchParams.forEach(function(value, key) {
            searchParams.set(key, value);
        });

        var sort = $('input[name="_${pNameSort}_INSTANCE_${pInstanceId}_sortSelectionRadio"]:checked').val();
        if(sort) {
            searchParams.set("sort", sort);
        }

        var searchQuery = searchParams.toString();

        var ppid = '${pNameCustomFilter}_INSTANCE_${pInstanceId}';
        var searchReloadUrl = '/c/portal/render_portlet?p_l_id=' + ${themeDisplay.layout.plid}
                            + '&p_p_id=' + ppid
                            + '&p_p_action=0&p_p_state=normal&p_p_mode=view&' + searchQuery;

        $('#p_p_id_' + ppid + "_").load(searchReloadUrl);
        history.pushState(null, document.title, '?' + searchQuery);

        $('html, body').animate({
            scrollTop: $('#p_p_id_' + ppid + "_").offset().top - 30
        }, 500);
    }

    $(function() {
        var filterConfig = ${configJson};
        var filterValue = $('#${namespace}customFilterValueInput').val();
        var availableFilters = filterConfig.contextual ? 
            (availableCategories__${pNameCategoryFacet}_INSTANCE_${pInstanceId}_ || [])
            : [];
        var singleSelect = (filterConfig.selectWithinGroup == 'single');
        var selectedFilters = [];
        if(filterValue) {
            selectedFilters = filterValue.split(" " + filterConfig.operator + " ");
        }

        $('#${namespace}filterTitle').html(filterConfig.title);

        var renderCategoryTree = function(category, groupId) {

            if(category.depth >= 2) {
                var childCategoryHTML = '';
                $.each(category.children, function(index, child) {
                    childCategoryHTML += renderCategoryTree(child, category.id);
                });
                return '<div class="explore__categoryfilter">'
                    +     (filterConfig.showl2label ? ('<h4 class="my-2">' + category.name + '</h4>') : '')
                    +     childCategoryHTML
                    +  '</div>';
            } else if (category.depth == 1) {
                var childCategoryHTML = '';
                if(singleSelect) {
                    category.children.unshift({'id': '-1', 'name': 'All', 'depth': 0});
                }
                $.each(category.children, function(index, child) {
                    childCategoryHTML += renderCategoryTree(child, category.id);
                });
                return '<div class="explore__applications ' + (filterConfig.accordion ? '':'explore__expanded') +'">' 
                    +       '<h1 class="explore__apptext">'
                    +           '<span class="explore__filtercategory">'+ category.name +'</span>'
                    +           '<span class="explore__arrowicon"></span>'
                    +       '</h1>'
                    +       '<div class="explore__accordian">'
                    +           childCategoryHTML
                    +       '</div>'
                    +  '</div>';
            } else if (category.depth == 0) {
                if(filterConfig.contextual
                    && availableFilters.length != 0 
                    && !availableFilters.includes(category.id)
                    && category.id != '-1') {
                    return '';
                }
                return '<div class="explore__checkboxcont">'
                    +    '<input type="'+(singleSelect ? 'radio':'checkbox')+'"'
                    +       'class="facet-term explore__checkbox"'
                    +       'data-term-id="' + category.id + '"'
                    +       'onChange="updateFilter_${namespace}()"'
                    +       'name="'+(singleSelect ? (''+groupId) : '')+'"'
                    +       (selectedFilters.includes(category.id) ? 'checked ' : '')
                    +       'id="' + category.id + '">'
                    +    '<label class="'+(singleSelect ? 'explore__radiolabel':'explore__checkboxlabel')+'"></label>'
                    +    '<label class="explore__label" for="' + category.id + '">' + category.name + '</label>'
                    + '</div>';
            }
        };

        $.each($(filterConfig.catTree), function(index, catTree){
            var catTreeHTML = renderCategoryTree(catTree, -999);
            $('#${namespace}search__filters .explore__leftinner').append(catTreeHTML);
        });

        $('.explore__accordian').each((index, ele) => { 
            if($(ele).html().trim() == '') {
                $(ele).parent().hide();
            }
        });
        $('.explore__categoryfilter').each(function () {
            var $main = $(this),
            $allChildren = $main.find('.explore__accordian');
            $allEmptyChildren = $allChildren.filter(':empty');
            $main.toggle($allChildren.length !== $allEmptyChildren.length);
        });


        $(".pagination .page-link:not('.dropdown-toggle'), a.dropdown-icon").off('click');
        $(".pagination .page-link:not('.dropdown-toggle'), a.dropdown-icon").on('click', function(e){
            e.preventDefault();
            var pageLink = new URL($(this).attr('href'));
            var pageSearchParams = new URLSearchParams(pageLink.search);
            var delta = pageSearchParams.get('delta')||10;
            var start = pageSearchParams.get('start')||1;
            updateFilter_${namespace}('delta=' + delta + '&start=' + start);
        });

        $('._${pNameSort}_INSTANCE_${pInstanceId}_sortSelectionRadio').off('change');
        $('._${pNameSort}_INSTANCE_${pInstanceId}_sortSelectionRadio').on('change', function () {
            updateFilter_${namespace}();
        });

        $('.explore__apptext').off('click');
        $('.explore__apptext').on('click', function(){
            var initiallyOpen = $(this).parents('.explore__applications').hasClass('explore__expanded');
            <#--
            if (window.innerWidth > 834) {
                if(filterConfig.accordion) {
                    $('.explore__applications').removeClass('explore__expanded');
                }
                if (!initiallyOpen) {
                    $(this).parents('.explore__applications').addClass('explore__expanded');
                } else {
                    $(this).parents('.explore__applications').removeClass('explore__expanded');
                }
            } else if (initiallyOpen) {
                $('.explore__applications').removeClass('explore__expanded');
                $(this).parents('.explore__applications').addClass('explore__expanded');
            }
            -->
        });

        $('.explore__filtericon').off('click');
        $('.explore__filtericon').on('click', function(){
            $('.explore__left').show();
            scrollPos = window.pageYOffset;
        });

        $('.explore__filterback').off('click');
        $('.explore__filterback').on('click', function(){
            $('.explore__left').hide();
        });

<#--
        $('.explore__checkbox').off('click');
        $('.explore__checkbox').on('click', function(){
            var elementId = $(this).attr('id');
            if ($(this).prop('checked') && elementId != "-1") {
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
-->

        $(document).off('click', '.jmicon--close');
        $(document).on('click', '.jmicon--close', function(e){
            e.preventDefault();
            var elementId = $(this).parents('.explore__filters').attr('dataparam');
            $('#'+elementId).prop('checked', false);
            $('#'+elementId).change();
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

        $('.explore__filterclear').off('click');
        $('.explore__filterclear').on('click', function(){
            $('.explore__checkbox').each(function(){
                $(this).attr('checked', false);
            });
        });

        $('#${namespace}search__filters').removeClass('hide');
    });
</script>

<style>
    .taglib-empty-result-message {
        margin-top: 86px;
    }
</style>

</#macro>
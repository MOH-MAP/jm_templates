<div class="search__filters my-0 search--sort">
    <div class="explore__left">
        <div class="explore__leftinner">
            <div class="explore__categoryfilter">
                <div class="explore__applications explore__expanded">
                    <h1 class="explore__apptext">
                        <span class="explore__filtercategory">Sort</span>
                        <span class="explore__arrowicon"></span>
                    </h1>
                    <div class="explore__accordian">
                        <div class="explore__options">
                			<#if entries?has_content>
                                <@liferay_aui.select
                        			cssClass="sort-term hide"
                        			label=""
                        			name="sortSelection"
                        		>
                    				<#list entries as entry>
                    					<@liferay_aui.option
                    						label="${entry.getLanguageLabel()}"
                    						selected=entry.isSelected()
                    						value="${entry.getField()}"
                    					/>
                    				</#list>
                        		</@liferay_aui.select>
                				<#list entries as entry>
                					<@liferay_aui.input
                					    type="radio"
                            			cssClass="sort-term ${renderResponse.getNamespace()}sortSelectionRadio"
                            			label="${entry.getLanguageLabel()}"
                            			name="sortSelectionRadio"
                            			checked=entry.isSelected()
                            			value="${entry.getField()}"
                            		/>
                				</#list>
                			</#if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<@liferay_aui.script use="liferay-search-sort-util"> 
    AUI().ready('aui-base', 'node', 'event', 'node-event-simulate', function (A) {
    	A.all('.${renderResponse.getNamespace()}sortSelectionRadio').on('change', function () {

    		var sortSelect = A.one('#${renderResponse.getNamespace()}sortSelection');
    		sortSelect.val(A.one("input[name=${renderResponse.getNamespace()}sortSelectionRadio]:checked").val());
    		sortSelect.simulate('change');
    
    	});
    });
</@liferay_aui.script>
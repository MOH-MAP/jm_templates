<#--
Web content templates are used to lay out the fields defined in a web
content structure.

Please use the left panel to quickly add commonly used variables.
Autocomplete is also available and can be invoked by typing "${".
-->

<div class="container-fluid">
    <div id="SlideShowWithPagination" class="carousel slide" data-ride="carousel" data-wrap="false">
        <#if Slides.getSiblings()?has_content>
            <div class="carousel-inner" id="carousel-inner">
        	    <#list Slides.getSiblings() as cur_Slides>
        	        <#if cur_Slides?index == 0>
                        <div class="carousel-item active">
                    <#else>
                        <div class="carousel-item">
                    </#if>
            	        <#assign webContentData = jsonFactoryUtil.createJSONObject(cur_Slides.getData())/>
                        <@liferay_asset["asset-display"]
                            className = webContentData.className
                            classPK = getterUtil.getLong(webContentData.classPK, 0)
                        />
                    </div>
        	    </#list>
    	    </div>
        </#if>
    
        <!-- Left and right controls -->
        <a class="carousel-control-prev" onclick="SyncIndicatorPrev()" href="#SlideShowWithPagination" data-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </a>
        
        <a class="carousel-control-next" onclick="SyncIndicatorNext()" href="#SlideShowWithPagination" data-slide="next">
            <span class="carousel-control-next-icon"></span>
        </a>
    </div>
</div>

<div class="jm_slideshow-pagination">
    <ol class="carousel-linked-nav pagination">
  
    </ol
</div>

<style>
.carousel-indicators li {
    border:1px solid red;
    display:inline;
    border-radius:0px;
    padding:2px;

}

.jm_slideshow-pagination {
    display: flex;
    justify-content: center;
    margin-top: 3%;
}

#SlideShowWithPagination .carousel-control-prev-icon {
    background-color: grey;
}

#SlideShowWithPagination .carousel-control-next-icon {
    background-color: grey;
}
</style>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>

<script>

    $( document ).ready(function() {

        var total = $('.carousel-item').length;
    
        for(var i = 1; i <= total; i++) {
            if(i == 1) {
                $(".carousel-linked-nav").append('<li class="page-item active"><a class="page-link" href=#' + i + '>' + i + '</a></li>');
            } else {
                $(".carousel-linked-nav").append('<li class="page-item"><a class="page-link" href=#' + i + '>' + i + '</a></li>');
            }
        }
        
        $('.jm_slideshow-pagination .carousel-linked-nav > li > a').click(function() {

            var item = Number($(this).attr('href').substring(1));
        
            $('#SlideShowWithPagination').carousel(item - 1);
        
            $('.jm_slideshow-pagination .carousel-linked-nav .active').removeClass('active');
    
            $(this).parent().addClass('active');
    
            return false;
        });
        
    });
    
    function SyncIndicatorNext() {
        $('.jm_slideshow-pagination .carousel-linked-nav .active').removeClass('active');
        var idx = $('#SlideShowWithPagination .carousel-item.active').index() + 1;
        $('.carousel-linked-nav li:eq(' + idx + ')').addClass('active');
    }
    
    function SyncIndicatorPrev() {
        $('.jm_slideshow-pagination .carousel-linked-nav .active').removeClass('active');
        var idx = $('#SlideShowWithPagination .carousel-item.active').index() - 1;
        $('.carousel-linked-nav li:eq(' + idx + ')').addClass('active');
    }
</script>
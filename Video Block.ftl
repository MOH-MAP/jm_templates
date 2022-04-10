<#assign namespace = randomNamespace >

<div class="container-fluid jmvideotempl" id="video-block-${namespace}">
    <#if (ImageLarge.getData())?? && ImageLarge.getData() != "">
    	<img alt="${ImageLarge.getAttribute("alt")}" data-fileentryid="${ImageLarge.getAttribute("fileEntryId")}" src="${ImageLarge.getData()}" />
    </#if>
    
    <div class="jmvideotempl__content">
        <div class="container">
            <div class="jmvideotempl__innercont" id="jmvideotempl__innercont-${namespace}">
                <h5 class="jmvideotempl__heading">${Title.getData()}</h5>
                <h2 class="jmvideotempl__slogan-text"><span>${Summary.getData()}</span></h2>
                <button id="modalbutton-${namespace}" class="btn btn-info btn-lg modalbutton jmvideotempl__info-btn"
                		data-toggle="modal" data-target="#exampleModal-${namespace}">
            		Play Video
            		<span class="jmvideo--play-icon"></span>
        		</button>
            </div>
        </div>
    </div>

    <div class="modal modal-fullscreen" id="exampleModal-${namespace}" tabindex="-1" 
    	role="dialog" aria-labelledby="exampleModalLabel-${namespace}" aria-hidden="true" style="display:none">
    	<div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel-${namespace}">${Title.getData()}</h5>
                <button id="closebtn-${namespace}" type="button" class="close" data-dismiss="modal" aria-label="Close">
                	<span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div id="player-${namespace}"/>
            </div>
            <div class="modal-footer">
                <div class="controls">
                    <button id="play-${namespace}" type="button" class="btn btn-primary">Play</button>
                    <button id="pause-${namespace}" type="button" class="btn btn-primary">Pause</button>
                    <button id="stop-${namespace}" type="button" class="btn btn-primary">Stop</button>
                </div>
            </div>
        </div>
    </div>

</div>

<script>
    function loadVideo_${namespace}() {
	    var player;
	    window.YT.ready(function() {
	        player = new YT.Player('player-${namespace}', {
	            height: '390',
	            width: '640',
	            videoId: '${YoutubeID.getData()}',
	            playerVars: {
	                'playsinline': 1,
	                'controls': 0
	            },
	        });
	    });

	    $("#play-${namespace}").click(function() {
	        player.playVideo();
	    });

	    $("#pause-${namespace}").click(function() {
	        player.pauseVideo();
	    });

	    $("#stop-${namespace}").click(function() {
	        player.stopVideo();
	    });

	    $("#modalbutton-${namespace}").click(function() {
	        player.playVideo();
	    });

	    $("#closebtn-${namespace}").click(function() {
	        player.stopVideo();
	    });
	}

	$(document).ready(function () {
	    $.getScript("https://www.youtube.com/iframe_api", function() {
	        loadVideo_${namespace}();
	    });

	    $('.jmvideotempl__innercont-${namespace}').each(function(){
            $(this).css({'margin-top': '-' + $(this).height()/2 + 'px'});
        });
	});
</script>
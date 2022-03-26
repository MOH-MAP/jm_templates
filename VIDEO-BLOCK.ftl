<div class="container">
	<picture>
        <source media="(min-width: 1480px)" srcset="${ImageLarge.getData()}">
        <source media="(min-width: 1024px)" srcset="${ImageMedium.getData()}">
            <#if (ImageLarge.getData())?? && ImageLarge.getData() != "">
            <img 
            <#if ImageLarge.getAttribute("alt")??> alt="${ImageLarge.getAttribute("alt")}" </#if>
            <#if ImageLarge.getAttribute("fileEntryId")??> data-fileentryid="${ImageLarge.getAttribute("fileEntryId")}" </#if>
            src="${ImageLarge.getData()}" />
            </#if>
    </picture>
		
    <div class="top-left">
        <h5>${Title.getData()}</h5>
    </div>
    <div class="centered">
        <h2><span>${Summary.getData()}</span></h2>
    </div>
    <button class="btn btn-info btn-lg modalbutton" data-toggle="modal" data-target="#exampleModal">Launch Video</button>
    <div class="modal modal-fullscreen" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="display:none">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button id="closebtn" type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div id="player"></div>
                    <div class="modal-footer">
                        <div class="controls">
                            <button id="play" type="button" class="btn btn-primary">Play</button>
                            <button id="pause" type="button" class="btn btn-primary ">Pause</button>
                            <button id="stop" type="button" class="btn btn-primary ">Stop</button>
                            <a class="ytp-watermark yt-uix-sessionlink" target="_blank" aria-label="Watch on www.youtube.com" data-sessionlink="feature=player-watermark" href="https://www.youtube.com/watch?v=${YoutubeID.getData()}" data-layer="8">
                              <button id="" type="button" class="btn btn-primary">Watch on Youtube</button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

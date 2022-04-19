<div class="container-fluid jmvideotempl">
    <picture>
        <source media="(min-width: 1480px)" srcset="${ImageLarge.getData()}">
        <source media="(min-width: 1024px)" srcset="${ImageMedium.getData()}">
        <#if (ImageLarge.getData())?? && ImageLarge.getData() !="">
            <img 
                <#if ImageLarge.getAttribute("alt")??> alt="${ImageLarge.getAttribute("alt")}" </#if>
                <#if ImageLarge.getAttribute("fileEntryId")??> data-fileentryid="${ImageLarge.getAttribute("fileEntryId")}" </#if>
            src="${ImageLarge.getData()}" />
        </#if>
    </picture>
    <div class="jmvideotempl__content">
        <div class="container">
            <div class="jmvideotempl__innercont">
                <h5 class="jmvideotempl__heading">${Title.getData()}</h5>
                <h2 class="jmvideotempl__slogan-text"><span>${Summary.getData()}</span></h2>
                <button class="btn btn-info btn-lg modalbutton jmvideotempl__info-btn" data-toggle="modal"
                    data-target="#exampleModal">
                    <span>Play Video</span>
                    <span class="jmvideo--play-icon"></span>
                </button>
            </div>
        </div>
    </div>

    <div class="modal modal-fullscreen" id="exampleModal" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalLabel" aria-hidden="true" style="display:none">
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
                            <a class="ytp-watermark yt-uix-sessionlink" target="_blank"
                                aria-label="Watch on www.youtube.com" data-sessionlink="feature=player-watermark"
                                href="https://www.youtube.com/watch?v=${YoutubeID.getData()}" data-layer="8"><button
                                    id="" type="button" class="btn btn-primary">Watch on Youtube</button></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function loadVideo() {
        var player;
        window.YT.ready(function () {
            player = new YT.Player('player', {
                height: '390',
                width: '640',
                videoId: '${YoutubeID.getData()}',
                playerVars: {
                    'playsinline': 1,
                    'controls': 0
                },
            });
        });

        $('#play').click(function () { player.playVideo(); });

        $('#pause').click(function () { player.pauseVideo(); });

        $('#stop').click(function () { player.stopVideo(); });

        $('.modalbutton').click(function () {
            player.playVideo();
        });

        $("#closebtn").click(function () {
            player.stopVideo();
        });
    }

    $(document).ready(function () {
        $.getScript("https://www.youtube.com/iframe_api", function () {
            loadVideo();
        });

        $('.jmvideotempl__innercont').each(function () {
            $(this).css({ 'margin-top': '-' + $(this).height() / 2 + 'px' });
        });
    });
</script>
<div class="container-fluid jmvideo--main-container">
  <div class="jm-video-image-container">
    <#if (ImageLarge.getData())?? && ImageLarge.getData() !="">
      <img alt="${ImageLarge.getAttribute(" alt")}" data-fileentryid="${ImageLarge.getAttribute(" fileEntryId")}"
        src="${ImageLarge.getData()}" />
    </#if>
    <div class="container-fluid jmvideo--content">
      <div class="container">
        <div class="centered-with-text">
          <p class="jm-image-slogan-text">Here at Johnson Matthey</p>
          <p class="jm-image-text-heading"> Our vision is for a world that's cleaner and healthier, today and for future
            generations </p>
        </div>
        <div class="centered">
          <button class="btn btn-info btn-lg modalbutton jm-info-btn" data-toggle="modal" data-target="#exampleModal">
            Play Video
            <img src="/o/jm-platinum-theme/images/new__jm__images/play-white-icon.svg" alt="forward"
              class="jm-video-play-icon">
          </button>
        </div>
      </div>
    </div>
  </div>

  <div class="modal modal-fullscreen" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true" style="display:none">
    <div class="modal-dialog jm-video-modal-dialog" role="document">
      <div class="modal-content jm-video-modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel"></h5>
          <button id="closebtn" type="button" class="close close-modal-block" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true" class="video-close-icon">Close <i class="svg-property">
                <img src="/o/jm-platinum-theme/images/new__jm__images/x-circle.svg" alt="close button">
              </i>
            </span>
          </button>
        </div>
        <div class="modal-body jm-video-modal-body">
          <div id="player"></div>
          <div class="modal-footer">
            <div class="controls jm-video-controls">
              <div class="jm-video-button1">
                <button id="play" type="button" class="btn btn-primary play-button">Play</button>
              </div>
              <div class="jm-video-button2">
                <button id="pause" type="button" class="btn btn-primary pause-button">PAUSE VIDEO <img
                    src="/o/jm-platinum-theme/images/new__jm__images/pause.svg" alt="forward">
                </button>
              </div>
              <div class="jm-video-button3">
                <button id="stop" type="button" class="btn btn-primary jm-video-btn-block stop-button">STOP VIDEO <img
                    src="/o/jm-platinum-theme/images/new__jm__images/stop.svg" alt="forward">
                </button>
              </div>
              <div class="jm-video-button4">
                <a class="ytp-watermark yt-uix-sessionlink youtube-button-alignment" target="_blank"
                  aria-label="Watch on www.youtube.com" data-sessionlink="feature=player-watermark"
                  href="https://www.youtube.com/watch?v=${YoutubeID.getData()}" data-layer="8">
                  <button id="" type="button" class="btn btn-primary jm-video-btn-block">OPEN IN YOUTUBE <img
                      src="/o/jm-platinum-theme/images/new__jm__images/arrow__forward.svg" alt="forward">
                  </button>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="container">
	<div class="jm-video-image-container">
        <img src="${ImageLarge.getData()}" alt="background Img" />
        <div class="centered-with-text">
            <p class="jm-image-slogan-text">Here at Johnson Matthey</p>
            <p class="jm-image-text-heading"> Our vision is for a world that's cleaner and healthier, today and for future generations </p>
        </div>
        <div class="centered">
            <button class="btn btn-info btn-lg modalbutton jm-info-btn" data-toggle="modal" data-target="#exampleModal"> Play Video  
                <img src="/o/jm-platinum-theme/images/new__jm__images/play-white-icon.svg" alt="forward" class="jm-video-play-icon">
            </button>
        </div>
    </div>
    
    <div class="modal modal-fullscreen" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="display:none">
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
              <button id="pause" type="button" class="btn btn-primary pause-button">PAUSE VIDEO <img src="/o/jm-platinum-theme/images/new__jm__images/pause.svg" alt="forward">
              </button>
            </div>
            <div class="jm-video-button3">
              <button id="stop" type="button" class="btn btn-primary jm-video-btn-block stop-button">STOP VIDEO <img src="/o/jm-platinum-theme/images/new__jm__images/stop.svg" alt="forward">
              </button>
            </div>
            <div class="jm-video-button4">
              <a class="ytp-watermark yt-uix-sessionlink youtube-button-alignment" target="_blank" aria-label="Watch on www.youtube.com" data-sessionlink="feature=player-watermark" href="https://www.youtube.com/watch?v=${YoutubeID.getData()}" data-layer="8">
                <button id="" type="button" class="btn btn-primary jm-video-btn-block">OPEN IN YOUTUBE <img src="/o/jm-platinum-theme/images/new__jm__images/arrow__forward.svg" alt="forward">
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


<script>
    $(document).ready(function() {
        $.getScript("https://www.youtube.com/iframe_api", function() {
            loadVideo();
        });
    });

    function loadVideo() {
      var player;
      window.YT.ready(function() {
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
    
        $('#play').click(function(){ player.playVideo(); });

        $('#pause').click(function(){ player.pauseVideo(); });

        $('#stop').click(function(){ player.stopVideo(); });
    
        $('.modalbutton').click(function(){
            player.playVideo();
        });
      
        $("#closebtn").click(function(){
            player.stopVideo();
        });
    }
</script>


<style>
.container {
position: relative;
text-align: center;
color: white;
}
.top-left {
position: absolute;
top: 60px;
left: 126px;
}
.centered {
position: absolute;
top: 35%;
left: 335px;
transform: translate(-50%, -50%);
position: absolute;
top: 65%;
left: 17%;
transform: translate(-50%, -50%);
width: 82%;
}
.centered h2 span {
display: flex;
margin-left: 150px;
}
.player:hover .controls {
opacity: 1;
}
player:focus .controls {
opacity: 1;
}
video {
width: 100%;
height: 100%;
}
.modal-dialog {
position: relative;
}
iframe {
height: 721px;
width: 100%;
}
.jm-video-modal-body {
padding: 0;
}
.modal-header {
background-color: #f2f2f2;
color: #1e22aa;
}
.modal-header .close-modal-block {
width: 5rem;
opacity: 0.9;
}
.jm-video-play-icon {
width: 25px !important;
height: auto !important;
}
.video-close-icon {
color: #1e22aa;
font-size: 18px;
font-family: JMSansMedium;
}
.modal-footer {
background-color: #1e22aa;
}
.modal-footer > .controls {
width: 100%;
margin-right: 6%;
margin-left: 6%;
}
.controls > .play-button {
display: none;
float: left;
border-radius: 0px;
margin-right: 4px;
background-color: transparent;
}
.controls > .pause-button {
background-color: transparent;
}
.controls > .stop-button {
background-color: transparent;
}
.controls > .youtube-button-alignment {
float: right;
border-radius: 0px;
margin-right: 4px;
border-color: transparent;
background-color: transparent;
border-color: 1px solid #fff;
}
.controls .btn {
border-radius: 0px;
margin-right: 4px;
border-color: 1px solid #fff;
background-color: transparent;
opacity: 0.9;
}
.controls .btn-primary {
border-radius: 0px;
margin-right: 4px;
color: #fff;
border-color: #0062cc;
background-color: transparent;
}
.pause-button {
float: left;
border-radius: 0px;
margin-right: 4px;
background-color: transparent;
}
.stop-button {
float: left;
border-radius: 0px;
margin-right: 4px;
background-color: transparent;
}
.svg-property {
background-color: #1e22aa;
height: 20px;
width: 20px;
border-radius: 50%;
display: inline-block;
opacity: 0.9;
}
.jm-video-modal-content {
border: 0px;
}
.jm-video-button1 {
display: none;
}
.jm-video-button4 {
float: right;
}
.jm-video-image-container {
padding: 2%;
text-align: center;
color: white;
position: relative;
}
.jm-video-image-container img {
width: 100%;
height: 600px;
}
.centered-with-text {
position: absolute;
top: 40%;
left: 34%;
transform: translate(-50%, -50%);
width: 44%;
}
.jm-image-text-heading {
color: white;
font-size: 32px;
line-height: 40px;
text-align: left;
letter-spacing: 0px;
color: #fff;
text-shadow: 0px 0px 6px #000;
opacity: 1;
font-family: JMSansRegular;
}
.jm-image-slogan-text {
text-align: left;
letter-spacing: 0px;
color: #fff;
text-shadow: 0px 0px 6px #000;
opacity: 0.8;
font-family: JMSansMedium;
}
.jm-info-btn {
border-radius: 0%;
background-color: #1e22aa;
color: #fff;
letter-spacing: 0px;
color: #fff;
text-transform: uppercase;
opacity: 1;
font-size: 16px;
line-height: 20px;
font-family: JMSansMedium;
}
@media (min-width: 576px) {
.jm-video-modal-dialog {
margin-left: 0.5rem;
}
}
@media (max-width: 768px) {
.modal-footer > .controls {
width: 100%;
margin-right: 4%;
margin-left: 4%;
}
.jm-video-modal-dialog {
width: 95%;
}
.jm-video-controls {
display: flex;
flex-wrap: wrap;
}
.jm-video-button1 {
display: none;
}
.jm-video-button2 {
order: 2;
width: 50%;
}
.jm-video-button3 {
order: 3;
width: 50%;
}
.jm-video-button4 {
order: 4;
width: 100%;
margin: 12px 0 4px;
}
.jm-video-btn-block {
display: block;
width: 100%;
}
.jm-video-image-container {
padding: 0%;
}
.jm-video-image-container img {
width: 100%;
height: 600px;
object-fit: cover;
object-position: bottom;
}
.jm-info-btn {
display: block;
width: 100%;
border-radius: 0%;
background-color: #1e22aa;
color: #fff;
text-transform: uppercase;
opacity: 1;
font-size: 16px;
line-height: 20px;
font-family: JMSansMedium;
}
.centered-with-text {
position: absolute;
top: 35%;
left: 50%;
transform: translate(-50%, -50%);
width: 82%;
}
.centered {
position: absolute;
top: 65%;
left: 50%;
transform: translate(-50%, -50%);
width: 82%;
}
}
</style>
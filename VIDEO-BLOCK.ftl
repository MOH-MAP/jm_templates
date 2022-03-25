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
		
		<div class="top-left"><h5>${Title.getData()}</h5></div>
		<div class="centered"><h2><span>${Summary.getData()}</span></h2></div>
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
      <a class="ytp-watermark yt-uix-sessionlink" target="_blank" aria-label="Watch on www.youtube.com" data-sessionlink="feature=player-watermark" href="https://www.youtube.com/watch?v=${YoutubeID.getData()}" data-layer="8"><button id="" type="button" class="btn btn-primary">Watch on Youtube</button></a>
  </div>
      </div>
    </div>
  </div>
</div>
</div>
	

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
	
	.container .modalbutton {
		position: absolute;
		top: 70%;
		left: 15%;
		transform: translate(-50%, -50%);
		-ms-transform: translate(-50%, -50%);
		background-color: #555;
		color: white;
		font-size: 16px;
		padding: 12px 24px;
		border: none;
		cursor: pointer;
		border-radius: 0px;
		text-align: center;
		background-color: blue;
	}

	.centered {
		position: absolute;
		top: 35%;
		left: 335px;
		transform: translate(-50%, -50%);
	}

	.centered h2 span {
		display: flex;
		margin-left : 150px;
	}
	
	.player:hover .controls, player:focus .controls {
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
        height : 721px;
        width:100%;
    }
</style>

<script>
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

    $(document).ready(function() {
      $.getScript("https://www.youtube.com/iframe_api", function() {
        loadVideo();
      });
    });
</script>
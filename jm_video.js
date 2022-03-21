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
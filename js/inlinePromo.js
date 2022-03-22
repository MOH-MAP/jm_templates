$(".jm-inline-promo picture").each(function(){
    var imgPath = $(this).find('img').attr("src");
    $(this).css({'background-image': 'url('+imgPath+')'});
});
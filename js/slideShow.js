$(document).ready(function($) {
    var autoPlaySpeed = 7000;
    $("#owl-slideshow").owlCarousel({
        loop: false,
        items: 1,
        autoplay: false,
        autoplayTimeout: autoPlaySpeed,

        dots: true,
        dotsData: true,
        nav: true,
        dotsContainer: '#carousel-custom-dots',
        navText: ["<span class='previous__icon'></span>","<span class='next__icon'></span>"]
    });
});
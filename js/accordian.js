$(document).ready(function () {	
	$(".jmfooter__heading").click(function(){
		$(this).parents(".jmfooter__lists").toggleClass("open"); 
 	});
 
 	$('.footer__container .jmfooter__lists:nth-last-child(2) .jmfooter__heading').click(function(){
	 	$(".footer__container .jmfooter__lists:last-child").toggleClass("open");
 	});
		
	$(".jmalign--container-temp .hidden__overlay").click(function(){
		$('.jmheader__navlist').hide();
		$(this).parents(".jmheader__navlist").addClass('jmshow--submenu'); 
	   	$(this).parents(".jmheader__navlist").find(".submenu__mb").toggle(); 
	});
	
	$(".jmalign--container-temp .submenu__mb .back__arrow").click(function(){
		$('.jmheader__navlist').show();
		$(this).parents(".jmheader__navlist").removeClass('jmshow--submenu'); 
	   	$(this).parents(".submenu__mb").toggle(); 
	});
	
	$(".nav__toggler").click(function(){
		$(this).toggleClass("active");	
		$(".jmheader__navbar").toggleClass("open");
		
		if ($(".jmheader__navbar").hasClass("open")) {
			$(".jmheader__navbar").css({'max-height': $(".jmheader__navbar")[0].scrollHeight + "px"});
		} else {
			$(".jmheader__navbar").removeAttr("style");
		}
	});	

	var scrollPos = 0;
	var scrollEventHandler = function() {
		if (jQuery('body').hasClass('ovfl--hdn') && window.innerWidth <= 834) {
			window.scroll(0, scrollPos);
		}
	}
});
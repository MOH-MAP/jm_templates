$(document).ready(function () {	
	$(".jmfooter__heading").click(function(){
	   	$(this).parent(".jmfooter__lists").toggleClass("open"); 
	});
		
	$(".hidden__overlay").click(function(){
	   	$(this).parents(".jmheader__navlist").find(".submenu__mb").toggle(); 
	});
	
	$(".submenu__mb .back__arrow").click(function(){
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
});
AUI().ready(function () {});
Liferay.Portlet.ready(function (_portletId, _node) {});
Liferay.on('allPortletsReady', function () {
	jQuery('.jmaccrdn__title').each(function(){
		if (jQuery(this).parent().find('.jmaccrdn__body').hasClass('show')) {
			jQuery(this).parent().find('.jmaccrdn__arrow').addClass('arrow--animate');
		}
	});
	
	jQuery('.jmaccrdn__title').click(function(e){
		e.preventDefault();
		if (jQuery(this).parent().find('.jmaccrdn__arrow').hasClass('arrow--animate')) {
			jQuery('.jmaccrdn__arrow').removeClass('arrow--animate');
		} else {
			jQuery('.jmaccrdn__arrow').removeClass('arrow--animate');
			jQuery(this).parent().find('.jmaccrdn__arrow').addClass('arrow--animate');
		}
	});

	jQuery('.career__dropdown').click(function () {
		jQuery(this).toggleClass('active'); 
	});
});

jQuery(document).ready(function(){	
	jQuery('.career__option div').on('click', function(){
		let selectedValue = jQuery(this).text();
		jQuery('.textBox').val(selectedValue);
	})
	
	jQuery('#jmsearch').on('click', function(){
		jQuery(this).hide();
		jQuery('.jmheader__srchcontainer').css({'display': 'flex'});
        if (jQuery(window).width() <= 834) {
        	jQuery('.jmheader__headerbtn, .jmheader__logocont').hide();
        }
    });

	jQuery('.jmheader__srchcloseicon').on('click', function(){
    	jQuery('.jmheader__srchinput').val('');
    	jQuery('.jmheader__srchcontainer').hide();
    	jQuery('#jmsearch').show();
        if (jQuery(window).width() <= 834) {
        	jQuery('.jmheader__headerbtn, .jmheader__logocont').show();
        }
    });

	$('sup').each(function(){
		if ($(this).text().length > 5) {
			$(this).addClass('normal--txt');
		}
	});
});
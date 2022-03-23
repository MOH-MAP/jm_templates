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
});

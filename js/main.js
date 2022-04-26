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

	jQuery('div.portlet-forms').addClass('jmdot--digital-temp');

    function hideAddress(){
        jQuery('.portlet-forms label').each(function(){
           if (jQuery(this).text() === 'AddressId') {
               jQuery(this).parents('.form-group').hide();
                    if (jQuery(this).parents('.form-group').is(':visible')) 
                    hideAddress();
                }
        });
    }

    jQuery('div.portlet-forms').addClass('jmdot--digital-temp');

    function hideAddress(){
        jQuery('.portlet-forms label').each(function(){
           if (jQuery(this).text() === 'AddressId') {
               jQuery(this).parents('.form-group').hide();
                    if (jQuery(this).parents('.form-group').is(':visible')) 
                    hideAddress();
                }
        });
    }

    setTimeout(function(){
       	hideAddress();
       	$('.portlet-forms.jmdot--digital-temp .form-builder-select-field').parents('.ddm-field').addClass('jmhide--label');
       	$('.portlet-forms.jmdot--digital-temp .form-control').on('focus', function(){
    		$(this).parents('.ddm-field').addClass('jminput--focus');
    	});

    	$('.portlet-forms.jmdot--digital-temp .form-control').on('blur', function(){
    		$(this).parents('.ddm-field').removeClass('jminput--focus');
    		if (!$(this).parents('.form-group').hasClass('has-error') && $(this).val()) {
    			$(this).parents('.ddm-field').addClass('jminput--complete');
    		} else {
    			$(this).parents('.ddm-field').removeClass('jminput--complete');
    		}
    	});
    	
    	$('.jmdot--digital-temp label.ddm-label').on('click', function(){
    		$(this).parent('.form-group').find('.form-control').focus();
    	});

		$('.jmdot--digital-temp label.ddm-label').on('focus', function(){
    		$(this).parent('.form-group').find('.form-control').focus();
    	});
    }, 1000);

    setTimeout(function () {
        jQuery("a.select-arrow-down-container").replaceWith(
          '<div class="select-chevron-down-container"></div>'
        );
    }, 3000);

	$(".jmrich--text-inner p a span[class^='btn--style'], .jmpromoblock p a span[class^='btn--style']").each(function(){
		$(this).text($(this).text().replace('>>', ''));
	});

	$('.jmrich--text-inner form input').on('focus', function(){
		$(this).parent('div').addClass('jminput--focus');
	});

	$('.jmrich--text-inner form input').on('blur', function(){
		$(this).parent('div').removeClass('jminput--focus');
		if (!$(this).parent('div').hasClass('has-error') && $(this).val()) {
			$(this).parent('div').addClass('jminput--complete');
		} else {
			$(this).parent('div').removeClass('jminput--complete');
		}
	});

	$('.jmrich--text-inner form input').on('focus', function(){
		$(this).parent('td').addClass('jminput--focus');
	});

	$('.jmrich--text-inner form input').on('blur', function(){
		$(this).parent('td').removeClass('jminput--focus');
		if (!$(this).parent('td').hasClass('has-error') && $(this).val()) {
			$(this).parent('td').addClass('jminput--complete');
		} else {
			$(this).parent('td').removeClass('jminput--complete');
		}
	});

	$('.jmrich--text-inner form input[type="submit"]').each(function(){
		$(this).parent().append('<span></span>');
	});

	$('.jmrich--text-inner form input[type="checkbox"]').each(function(){
		$(this).parent().append('<span></span>');
	});

	$('.search__filters').parents('.col.col-lg-3.col-sm-3.col-3.col-md-3').parent().find('.col.col-lg-5.col-sm-5.col-5.col-md-5').removeClass('col-lg-5 col-sm-5 col-5 col-md-5').addClass('col-lg-7 col-sm-7 col-7 col-md-7');

	$('.search__filters').parents('.col.col-lg-3.col-sm-3.col-3.col-md-3').parent().find('.col.col-lg-2.col-sm-2.col-2.col-md-2').removeClass('col-lg-2 col-sm-2 col-2 col-md-2').addClass('col-lg-1 col-sm-1 col-1 col-md-1');
	
	$('.search__filters').parents('.col.col-lg-3.col-sm-3.col-3.col-md-3').parent().addClass('search__mob-view');

	var scrollPos = 0;
	var scrollEventHandler = function() {
		if ($('.explore__left').is(':visible') && window.innerWidth <= 834) {
			window.scroll(0, scrollPos);
		}
	}

	$('.explore__filtericon').on('click', function(){
		$('.explore__left').show();
		scrollPos = window.pageYOffset;
	});

	jQuery(window).on('scroll', function(){
	    if (jQuery(window).scrollTop() >= 82) {
	    	jQuery('#banner').addClass('jmheader--fixed');
	    } else {
	    	jQuery('#banner').removeClass('jmheader--fixed');
	    }
	});
	
	$('.jmheader__navlist').each(function(){
	    var menuText = $(this).find('.header__menu span').text().trim();
	    if(menuText === 'About us' || menuText === 'Science and innovation' || menuText === 'Sustainability' || menuText === 'Investors' || menuText === 'Careers' || menuText === 'Media') {
	        $(this).addClass('jmchildmenu--listsnormal');        
	    }
	});

	$('.jmheader__navlist').each(function(){
		if (!$(this).hasClass('jmchildmenu--listsnormal') && $(this).find('.child-header').length%4 !== 0) {
			var rowCount = parseInt($(this).find('.child-header').length/4);
			var addClassStart = rowCount * 4;
			$(this).find('.child-header').each(function(i){
				if (i >= addClassStart) {
					$(this).addClass('bor-bot--0');
				}
			});
		} 
	});

	$('.tabbed-article-heading').parents('.col.col-lg-6.col-sm-6.col-6.col-md-6').parent().addClass('container jmtabbed');
	$('.tabbed-article-heading').parents('.col.col-lg-6.col-sm-6.col-6.col-md-6')
	.removeClass('col col-lg-6 col-sm-6 col-6 col-md-6')
	.addClass('col col-lg-9 col-sm-9 col-9 col-md-9');
	$('.jmtabbed .panel-collapse.collapse').addClass('show');
	$('.jmtabbed').find('.col.col-lg-6.col-sm-6.col-6.col-md-6')
	.removeClass('col col-lg-6 col-sm-6 col-6 col-md-6')
	.addClass('col col-lg-3 col-sm-3 col-3 col-md-3');

	addModalClass = function() {
		if ($('.modal-backdrop').length) {
			$('.modal-backdrop').parent().addClass('jmgetintouchmodal');
			$('.jmgetintouchmodal .form-control').on('focus', function(){
				$(this).parents('.form-group').addClass('jminput--focus');
			});
	
			$('.jmgetintouchmodal .form-control').on('blur', function(){
				$(this).parents('.form-group').removeClass('jminput--focus');
				if (!$(this).parents('.form-group').hasClass('has-error') && $(this).val()) {
					$(this).parents('.form-group').addClass('jminput--complete');
				} else {
					$(this).parents('.form-group').removeClass('jminput--complete');
				}
			});
			
			$('.jmgetintouchmodal label').on('click', function(){
				$(this).parent('.form-group').find('.form-control').focus();
			});
	
			$('.jmgetintouchmodal label').on('focus', function(){
				$(this).parent('.form-group').find('.form-control').focus();
			});

			$('.jmgetintouchmodal .form-group input-select-wrapper').addClass('jminput--complete');
		} else {
			setTimeout(function(){
				addModalClass();
			}, 100);
		}
	}
	
	$('.jmtwo--person-temp .btn-person_link').on('click', function(){
		addModalClass();
	});
});
// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// Flash
$(function() {
	if ($("#flash:has(*)").length) {
  	$('#flash').delay(500).fadeIn('normal', function() {
    	$(this).delay(5500).fadeOut();
  	});
	}
});

// DatePicker
$(function() {
	$("input.date_picker").datepicker( { 
// FIXME: tomar la fecha de local en yaml
		dateFormat: 'dd/mm/yy', 
		autoSize: true, 
		showOn: "button",
		showAnim: 'slide',
		buttonImage: "/images/calendar.gif",
		buttonImageOnly: true,
		onClose: function(dateText, inst) { $(inst.input).change().focusout(); }
	});
});	

// Tabs
$(function() {
	$( "#tabs" ).tabs();
});

// button
$(function() {
	$( "input:submit").button();
});

// Tooltips
$(function() {
	$('img[title]').qtip({
		position: {
			my: 'top center',
			at: 'bottom center'
		},
		style: {
			classes: 'ui-tooltip-shadow ui-tooltip-dark'
		}
	});
});

// User Box
$(function() {
	if ($('#user').html().trim()) {
			$('#user').show();
	  }
	  else
	  {
			$('#user').hide();
	  }	
});

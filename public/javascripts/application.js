// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
	if ($("#flash:has(*)").length) {
  	$('#flash').delay(500).fadeIn('normal', function() {
    	$(this).delay(2500).fadeOut();
  	});
	}
});

$(function() {
	$('#profile_birthday').datepicker( { 
		dateFormat: 'dd/mm/yy', 
		autoSize: true, 
		showOn: "button",
		showAnim: 'slide',
		buttonImage: "/images/calendar.gif",
		buttonImageOnly: true
	});
});	

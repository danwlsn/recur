// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
// = require jquery
// = require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){
/****************************************
*						$Select hiding on log form
*****************************************/
	// Set strength inputs to none
	$('.strength').css('display', 'none');
	// On select change..
	$('#fitness_log_type').change(function() {
		opt = $(this).val(); // Get the values
		if (opt=="cardio") { // If it's cardio
			$('.cardio').css('display', 'block'); // Hide strength inputs
			$('.strength').css('display', 'none');
		}
		else {
			$('.cardio').css('display', 'none'); // Else hide cardio inputs
			$('.strength').css('display', 'block');
		}
	})

	// Goals AJAX
	$(".goals--checks").bind('change', function(){
		if (this.checked){
			$.ajax({
				url: '/goals/'+this.value+'/complete',
				type: 'GET',
				data: {"completed": this.checked}
			});
			$(this).parent().delay(1000).fadeOut();
		}
		else {
			 alert("no");
		}
	});

	// Burger menu
	$('.burger-icon').on("click", function(){
		$('.mobile').slideToggle();
	});

	// Show completed goals
	$('.show--more').on("click", function(){
		if($(this).html() == 'Show more')
			$(this).html('Hide');
		else
			$(this).html('Show more');
		$('.completed--goals').slideToggle();
	})
});
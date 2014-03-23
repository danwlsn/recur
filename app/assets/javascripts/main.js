$(document).ready(function(){


// // Display message to first time users
// if(!window.localStorage.isReturningVisitor) {
// 	$('.howto').html('<h2>Welcome. Click on the headers to edit the cards. Good luck, and have fun!</h2>');
// 	window.localStorage.isReturningVisitor = true;
// }


	// Select hiding on log form
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

	// Fitness log charts
	// Hide charts
	$('#dead--chart').css('display', 'none');
	$('#squat--chart').css('display', 'none');
	// On tab click
	$('.tab').on("click", function(){
		$(window).trigger('resize'); // trigger resize to fix chart bugg
		$('.tab').removeClass('selected'); // Remove seleted class from all tabs
		$(this).addClass('selected'); // Apply selected class to click tab
		var choice = $(this).html(); // Get tab selected HTML

		if (choice == "Bench press") // If bench press
		{
			// Show bench press chart, hide others
			$('#bench--chart').css('display', 'block');
			$('#dead--chart').css('display', 'none');
			$('#squat--chart').css('display', 'none');
		}
		else if (choice == "Deadlift") // If deadlift
		{
			// Show deadlift chart, hide others
			$('#bench--chart').css('display', 'none');
			$('#dead--chart').css('display', 'block');
			$('#squat--chart').css('display', 'none');
		}
		else // Else squat
		{
			// Show squat chart, hide others
			$('#bench--chart').css('display', 'none');
			$('#dead--chart').css('display', 'none');
			$('#squat--chart').css('display', 'block');
		}
	})
});

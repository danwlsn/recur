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

	// Tab bar
	$('#dead--chart').css('display', 'none');
	$('#squat--chart').css('display', 'none');
	$('.tab').on("click", function(){
		$(window).trigger('resize');
		$('.tab').removeClass('selected');
		$(this).addClass('selected');
		var choice = $(this).html();

		if (choice == "Bench press")
		{
			$('#bench--chart').css('display', 'block');
			$('#dead--chart').css('display', 'none');
			$('#squat--chart').css('display', 'none');
		}
		else if (choice == "Deadlift")
		{
			$('#bench--chart').css('display', 'none');
			$('#dead--chart').css('display', 'block');
			$('#squat--chart').css('display', 'none');
		}
		else
		{
			$('#bench--chart').css('display', 'none');
			$('#dead--chart').css('display', 'none');
			$('#squat--chart').css('display', 'block');
		}
	})
});
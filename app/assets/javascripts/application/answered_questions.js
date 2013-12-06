$(document).ready(function(){
	$(".answered_unviewed").on('click', function(event){
		event.preventDefault();
	// 	event.preventDefault();
	// 	var link = $(event.currentTarget).attr("href")
	// 	$.get(link, function(data){
	// 		var answers = $(data).find('.col-md-12');
	// 		var slider = $('#slide_info');
	// 		$(slider).html(answers)
	// 		$(slider).slideDown(2000, function(){
	// 			$(this).show();
				$(".answered_unviewed").hide(1000, "easeInCirc");

				// this seems very wrong.
				// $("#slide_info").on('click',"#slide_info", function(e){
				// 	$(slider).slideUp();


				// });
	// });


	// 	});

	});
});
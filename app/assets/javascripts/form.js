$(document).ready(function(){
	$(".answer_button").on('submit', function(event){
			event.preventDefault();
	$.get("/answers/new?utf=✓&question=2&commit=Answer.html", function(data){
			$(data).find("form").dialog({title: "Answer Question", modal: true});
	});

	});




});
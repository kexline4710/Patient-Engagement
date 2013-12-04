$(document).ready(function(){
	$(".answer_button").on('submit', function(event){
			event.preventDefault();
			console.log(event)
			debugger
	// $.get("/answers/new?utf=✓&question=2&commit=Answer.html", function(data){
	// 		$(data).find("form").dialog({title: "Answer Question", modal: true, height: "auto", width: "auto"});
	// });

	});




});
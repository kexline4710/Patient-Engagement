$(document).ready(function(){
	$(".answer_button").on('submit', function(event){
			event.preventDefault();
		var num = $(event.target.outerHTML).find('input[name=question]').val()
	$.get("/answers/new?utf=✓&question=" + num + "&commit=Answer.html", function(data){
			$(data).find("form").dialog({title: "Answer Question", modal: true, height: "auto", width: "auto"});
		});
	});
});
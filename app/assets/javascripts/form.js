$(document).ready(function(){
	$(".answer_button").on('submit', function(event){
			event.preventDefault();
		var num = $(event.target.outerHTML).find('input[name=question]').val();
	$.get("/answers/new?utf=✓&question=" + num + "&commit=Answer.html", function(data){
			$(data).find("form").dialog({title: "Answer Question", modal: true, height: "auto", width: "auto"});
		});
	});

	$("#ask_question").on( 'click', function(event){
			event.preventDefault();
			var link = $(event.currentTarget).attr("href")
	$.get(link, function(data){
			$(data).find("#question_form").dialog({title: "Ask a Question", modal: true, height: "auto", width: "auto"});
			$('#img').hide()
			$()
			
		});
	});

});
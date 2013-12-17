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
		var link = $(this).attr("href");
		var original = $("#pending_questions").css('background');
		$.get(link, function(data){
			var questionForm = $(data).find("#question_form");
			var dialog = $("#dialog");
			dialog.html(questionForm);

			questionForm.submit(function(e){
				e.preventDefault();
				var url = $(this).attr("action")
				var data = $(this).serialize();
				$('#gif_in_form').show();
				$.post(url, data, function(){
					$('#gif_in_form').hide();
					dialog.dialog("destroy");
					$("#pending_questions").animate({backgroundColor:'#b2d271'},3000, function(){
						$(this).animate({backgroundColor: original},3000);
					});
				});
			});

			dialog.dialog({title: "Ask a Question", modal: true, height: "auto", width: "auto"});
		});
	});
});

// break this into various functions instead of one //
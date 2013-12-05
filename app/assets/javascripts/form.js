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
			var original = $("#pending_questions").css('background');
			$.get(link, function(data){
			$(data).find("#question_form").dialog({title: "Ask a Question", modal: true, height: "auto", width: "auto"});
			$('#gif_in_form').hide();
			$('#question_form').submit(function(e){
				e.preventDefault();
			var url = $(this).attr("action")
			var data = $(this).serialize();
			$('#gif_in_form').show();
			$.post(url, data, function(){ 
				$("#question_form").dialog("close");
			$("#pending_questions").animate({backgroundColor:'#b2d271'},3000, function(){
					$(this).animate({backgroundColor: original},3000);
					});
					});
				});
			});
		});
	});


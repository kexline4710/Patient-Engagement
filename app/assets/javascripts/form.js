$(document).ready(function(){
	$(".answer_button").on('submit', function(event){
			event.preventDefault();
	$.get("/answers/new?utf=✓&question=2&commit=Answer.html", function(data){
			var page = $(data);
			var contents = page.filter('#id');
			console.log(contents);
			debugger

			$(contents.prevObject).dialog();
	});

	});




});
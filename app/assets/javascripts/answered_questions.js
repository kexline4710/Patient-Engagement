$(document).ready(function(){
	$("#answered_unviewed").on('click', function(event){
		event.preventDefault();
		var link = $(event.currentTarget).attr("href")
			$.get(link, function(data){
				var answers = $(data).find('.col-md-8')
				var slider = ('#slide_info')
				$(slider).html(answers).hide()
				console.log("here")
				$(slider).slideDown("slow", function(){
					console.log("and here")
					$(slider).show();
					$(document).on('click', function(){
						$(slider).hide();
						$("#answered_unviewed").hide();
					});
				
				});	

			});

		});
	});
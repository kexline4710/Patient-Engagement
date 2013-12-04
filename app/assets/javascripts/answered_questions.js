$(document).ready(function(){
	$(".answered_unviewed").on('click', function(event){
		event.preventDefault();
		var link = $(event.currentTarget).attr("href")
			$.get(link, function(data){
				var answers = $(data).find('.col-md-8')
				var slider = ('#slide_info')
				$(slider).html(answers).hide()
				$(slider).slideDown("slow", function(){
					$(slider).show();
					$(".answered_unviewed").hide(1000, "easeInCirc");
					$(document).on('click', function(e){
						$(slider).slideUp();
						
							
					});
				
				});	

			});

		});
	});
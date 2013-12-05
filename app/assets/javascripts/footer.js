$(document).ready(function() {
    var height_diff = $(window).height() - $('body').height();
    if ( height_diff > 0 ) {
        $('#footer').css( 'margin-top', height_diff + 50 );
    }
});


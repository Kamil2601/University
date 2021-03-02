var number = 0;
var photos = 5;
var show_time = 5;
var fade_time = 300;
var timer;
var stop = false;


function next_slide() {
    if (stop == false) {
        number++; if (number > 5) number = 1;
        var file = "photos/" + number + ".jpg";
        $("#photo").attr('src', file);
        
    }
    $("#photo").fadeIn(fade_time);
    $("#photo").mouseover(function () { stop = true; clearTimeout(timer)});
    
    
    if (stop==false)
        timer = setTimeout('$("#photo").fadeOut(fade_time);',show_time*1000-fade_time);

    $("#photo").mouseout(function () { stop = false;$("#photo").fadeOut(fade_time); });
    setTimeout('next_slide();',show_time*1000);
}


$(document).ready(function () {
    $( "#slider" ).slider({
        value:5,
        min: 1,
        max: 5,
        step: 1,
        slide: function( event, ui ) {
         show_time = ui.value;
        }
      });
    next_slide();
});
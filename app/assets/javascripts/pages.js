$(document).ready(function(){
  if ( window.location.hash === "#calendar" ) {
    $(".calendar").toggle();
  }


$( ".show-calendar" ).on("click", function() {
  $(".calendar").toggle();
});


});
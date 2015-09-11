$(document).ready(function(){
  if ( window.location.hash === "#calendar" ) {
    $(".calendar").toggle();
  }

   if ( window.location.hash === "#checklist" ) {
    $(".checklist").toggle();
  }


$( ".show-calendar" ).on("click", function() {
  $(".calendar").toggle();
});


$( ".show-checklist" ).on("click", function() {
  $(".checklist").toggle();
});


});
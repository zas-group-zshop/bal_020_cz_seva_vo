$('.main_slider').slick({
  dots: true,
  infinite: true,
  speed: 3000,
  slidesToShow: 1,
  adaptiveHeight: true,
  autoplay:true,
  autoplaySpeed: 4000,
  fade: true
});

var openBox = {
  init: function() {

    $(".checkPromo").each( function(){
      const input = $(this).find("input");
      $("." + input.attr("data-open")).hide();
    });

    $(".checkPromo").click( function() {

      const input = $(this).find("input");
      if( input.attr("checked") ) {
        $("." + input.attr("data-open")).fadeIn();
      } else {
        $("." + input.attr("data-open")).fadeOut();
      }
    });
  }
}
$(document).ready( function () {

  $(".modal-popup").hide();
  console.log("test3");

  openBox.init();

  $(".loginPanel input").keydown(function(event) {
    if (event.keyCode === 13) {
      event.preventDefault();
      window.location = $(".loginPanel").find(".btn").attr("href");
    }
  });

});

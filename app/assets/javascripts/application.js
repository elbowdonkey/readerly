//= require jquery
//= require jquery_ujs
//= require jquery.mobile.custom.min
//= require jquery.scrollTo.min
//= require modernizr.custom.98349
//= require mousetrap.min
//= require humane.js
//= require bacon.min.js
//= require module
//= require_tree .

// as soon the dom is ready, queue the
// humanize messages
$(function() {
  window.scrollPosition = 0;
  if ($("article").not(".read").size() > 1) {
    if (bacon.isMobile() === true) {
      return humane.log("Swipe → to see the next article");
    } else {
      return humane.log("Press 'space' to see the next article");
    }
  }
});

// when all articles are loaded,
// initialize the application
$(window).load(function() {
  $("#loader").remove();
  app = Readerly.Application();
  if (bacon.isMobile() === false) {
    Mousetrap.unpause();
  }
});


Module("Readerly.Application", function(Application) {
  Application.fn.initialize = function() {
    window.article = Readerly.Article();
    window.article.show();
    if (bacon.isMobile() === false) {
      $('#help-icon').show();
    }
  };
});

// animate help layer
$(function() {
  $('#help-icon').click(function() {
    $('#help').slideToggle(300, "swing");
  });
});

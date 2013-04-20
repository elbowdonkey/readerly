//= require jquery
//= require jquery_ujs
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
  app = Readerly.Application();
  if (bacon.isMobile() === false) { Mousetrap.unpause(); }
});


Module("Readerly.Application", function(Application) {
  Application.fn.initialize = function() {
    window.article = Readerly.Article();
    window.article.next();
    $("#loader").hide();
  };
});

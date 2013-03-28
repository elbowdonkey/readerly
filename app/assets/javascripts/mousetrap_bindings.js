Mousetrap.bind('ctrl+space', function(e){
  e.preventDefault();
  window.scrollPosition = 0;
  $.scrollTo(0);
  previousArticle();
});

Mousetrap.bind('space', function(e){
  e.preventDefault();
  $.scrollTo("+=200px");

  if (document.body.scrollTop == window.scrollPosition) {
    window.scrollPosition = 0;
    $.scrollTo(0);
    nextArticle();
  }

  window.scrollPosition = document.body.scrollTop;
});

Mousetrap.pause();
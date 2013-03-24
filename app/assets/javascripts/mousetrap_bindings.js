Mousetrap.bind('j', function(){
  window.scrollPosition = 0;
  $.scrollTo(0);
  previousArticle();
});

Mousetrap.bind('k', function(){    
  $.scrollTo("+=200px");

  if (document.body.scrollTop == window.scrollPosition) {
    window.scrollPosition = 0;
    $.scrollTo(0);
    nextArticle();
  }

  window.scrollPosition = document.body.scrollTop;
});
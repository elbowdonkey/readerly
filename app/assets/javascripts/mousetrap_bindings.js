Mousetrap.bind(['ctrl+space', 'k'], function(e){
  e.preventDefault();
  window.scrollPosition = 0;
  $.scrollTo(0);
  previousArticle();
});

Mousetrap.bind(['shift+space', 'shift+j'], function(e){
  e.preventDefault();
  window.scrollPosition = 0;
  $.scrollTo(0);
  nextArticle();
});

Mousetrap.bind(['space', 'j'], function(e){
  e.preventDefault();
  $.scrollTo("+=200px");

  if (document.body.scrollTop == window.scrollPosition) {
    window.scrollPosition = 0;
    $.scrollTo(0);
    nextArticle();
  }

  window.scrollPosition = document.body.scrollTop;
});

Mousetrap.bind('1', function(){
  openCurrentLink();
})

Mousetrap.pause();
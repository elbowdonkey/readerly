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

  // using setTimeout to ensure safari reacts to the scroll
  setTimeout(function() {
    if (document.body.scrollTop == window.scrollPosition || document.body.scrollTop < 10) { 
      window.scrollPosition = 0;
      $.scrollTo(0);
      nextArticle(); 
    } else{ window.scrollPosition = document.body.scrollTop; }
  }, 10);
});

Mousetrap.bind('1', function(){
  openCurrentLink();
})

Mousetrap.pause();
Mousetrap.bind(['ctrl+space', 'k', 'shift+k'], function(e){
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
  
  setTimeout(function() {
    current_position = $(window).scrollTop();
    // alert("before:" + current_position + ":" + window.scrollPosition);
    if (current_position == window.scrollPosition || current_position < 10) { 
      window.scrollPosition = 0;
      $.scrollTo(0);
      nextArticle(); 
    } else{ window.scrollPosition = current_position; }    
    // alert("after:" + current_position + ":" + window.scrollPosition);
  }, 10);
});

Mousetrap.bind('1', function(){
  openCurrentLink();
});

Mousetrap.bind('m', function(){
  $.get('/article/read/?all=true');
  window.location.href=window.location.href;
});

Mousetrap.pause();
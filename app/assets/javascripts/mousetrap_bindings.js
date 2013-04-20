// next article binding
Mousetrap.bind(['shift+space', 'shift+j'], function(e){
  e.preventDefault();
  window.scrollPosition = 0;
  $.scrollTo(0);
  article.next();
});


// previous article binding
Mousetrap.bind(['ctrl+space', 'k', 'shift+k'], function(e){
  e.preventDefault();
  window.scrollPosition = 0;
  $.scrollTo(0);
  article.previous();
});


// scroll + next binding
Mousetrap.bind(['space', 'j'], function(e){
  e.preventDefault();
  $.scrollTo("+=200px");
  
  setTimeout(function() {
    current_position = $(window).scrollTop();
    // alert("before:" + current_position + ":" + window.scrollPosition);
    if (current_position == window.scrollPosition || current_position < 10) { 
      window.scrollPosition = 0;
      $.scrollTo(0);
      article.next(); 
    } else{ window.scrollPosition = current_position; }    
    // alert("after:" + current_position + ":" + window.scrollPosition);
  }, 10);
});

// open article
Mousetrap.bind('1', function(){
  article.open();
});

// mark all as rea
Mousetrap.bind('m', function(){
  $.get('/read/?all=true');
  window.location.href=window.location.href;
});

Mousetrap.pause();
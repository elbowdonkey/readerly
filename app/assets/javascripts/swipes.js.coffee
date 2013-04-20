$ ->
  if bacon.isMobile() == true 
    $.extend $.event.special.swipe,
      scrollSupressionThreshold: 100
      durationThreshold: 1000
      horizontalDistanceThreshold:  Math.min($(document).width() / 2, 160)
      verticalDistanceThreshold: 75

    $(document).on "swipeleft", (e) ->
      window.article.previous()

    $(document).on "swiperight", (e) ->
      window.article.next()
Module "Readerly.Article", (Article) ->
  Article.fn.next = ->
    if $("article").not(".read").size() > 1
      window.scrollPosition = 0
      $.scrollTo(0)
      current_article = $("article").not(".read").first().attr('id')

      # show message if required
      if $("article.read").size() is 1 and (typeof window.done_helping is "undefined")
        if bacon.isMobile() == true
          humane.log "Swipe ← to get back to last one"
        else
          humane.log "Press 'ctrl + space' to get back to last one"

        window.done_helping = true
      # go to next article
      $("article").not(".read").first().hide()
      $("article").not(".read").first().addClass "seen"
      $("article").not(".read").first().addClass "read"

      this.show()

      # mark as read
      $.get('/read/'+current_article)
    return true

  Article.fn.previous = ->
    window.scrollPosition = 0
    $.scrollTo(0)
    $("article").not(".read").first().hide()
    $("article.read").last().removeClass "read"
    $("article").not(".read").first().show()  
    return true

  Article.fn.show = ->
    target = $("article").not(".read").first()
    target.show()

    if $("article").not(".read").first().hasClass('seen') or bacon.isMobile() == true
      target.find('.article-container').show()
      window.resizeArticleImages()
    else
      setTimeout ->
        target.find('.article-container').animate({
          opacity: "show", marginTop: "-=5px"}, {duration: 150, step: ->( window.article.prepare()) })
      ,100

    return true

  Article.fn.open = ->
    url = $("article").not(".read").first().find('h2 a').attr('href')
    window.open(url, '_blank');

  Article.fn.prepare = -> 
    $("article").not(".read").first().find("img").each ->
      image = $(this)

      if image.width() >= 500
        image.width "100%"
        image.height "auto"

      if image.width() >= 100
        image.css("display", "block")
        image.css("margin", " 0 auto auto")
      else
        image.hide()
    return true
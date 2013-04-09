# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# as soon the document is ready,
# queue the human.log message
$ ->
  window.scrollPosition = 0
  if $("article").not(".read").size() > 1
    if bacon.isMobile() == true
      humane.log "Swipe → to see the next article"
    else
      humane.log "Press 'space' to see the next article"

# after all content is loaded, do this
$(window).load ->
  $("#loader").hide()
  @showArticle()
  if bacon.isMobile() == false
    Mousetrap.unpause();

@nextArticle =  ->
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

    @showArticle()

    # mark as read
    $.get('/read/'+current_article)
  return true

@previousArticle = ->
  window.scrollPosition = 0
  $.scrollTo(0)
  $("article").not(".read").first().hide()
  $("article.read").last().removeClass "read"
  $("article").not(".read").first().show()  
  return true

@openCurrentLink = ->
  url = $("article").not(".read").first().find('h2 a').attr('href')
  window.open(url, '_blank');

@resizeArticleImages = ->
  $("article").not(".read").first().find("img").each ->
    image = $(this)

    if image.width() >= 500
      image.width "100%"
      image.height "auto"

    if image.width() >= 100
      image.css("display", "block")
      image.css("margin", " 0 auto auto")

  return true

@showArticle = ->
  target = $("article").not(".read").first()
  target.show()

  unless $("article").not(".read").first().hasClass('seen')
    setTimeout ->
      target.find('.article-container').animate({
        opacity: "show", marginTop: "-=5px"}, {duration: 150, step: ->( window.resizeArticleImages()) })
    ,100

  return true
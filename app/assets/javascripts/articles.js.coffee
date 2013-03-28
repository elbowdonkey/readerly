# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $("article").hide()
  if $("article").not(".read").size() > 1
    humane.log "Press 'space' to see the next article"
  window.scrollPosition = 0

$(window).load ->
  $("article").first().show()
  $("#loader").hide()
  Mousetrap.unpause();

@nextArticle =  ->
  if $("article").not(".read").size() > 1
    current_article = $("article").not(".read").first().attr('id')
    
    # show message if required
    if $("article.read").size() is 1 and (typeof window.done_helping is "undefined")
      humane.log "Press 'ctrl + space' to get back to last one"
      window.done_helping = true

    # go to next article
    $("article").not(".read").first().hide()
    $("article").not(".read").first().addClass "seen"
    $("article").not(".read").first().addClass "read"
    $("article").not(".read").first().show()

    # mark as read
    $.get('/read/'+current_article)
  return true

@previousArticle = ->
  $("article").not(".read").first().hide()
  $("article.read").last().removeClass "read"
  $("article").not(".read").first().show()
  return true

@openCurrentLink = ->
  url = $("article").not(".read").first().find('h2 a').attr('href')
  window.open(url, '_blank');
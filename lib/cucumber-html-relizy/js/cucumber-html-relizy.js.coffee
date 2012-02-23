class Feature
  constructor: (@index, el) ->
    @name = $(el).children('h2').text().replace "Feature: ", ""
    @tags = []
    @tags.push($(node).text()) for node in $('.tag', el)
    #@file =

jQuery ($) ->
  @active = null

  html = '<div id="relizy-sidebar"></div>'
  $(html).insertAfter "#cucumber-header"

  a = $('<h3><a href="#">all features (toggle)</a></h3>').appendTo("#relizy-sidebar")
  $(a).click (event) =>
    $('.feature').toggle()

  # hide all features
  $(a).trigger('click')

  $('<ul />').appendTo("#relizy-sidebar")

  $.each $('.feature'), (index, item) ->
    feature = new Feature(index, item)
    # console.log feature
    li = $('<li><a href="#">'+ feature.name + '</a></li>').appendTo '#relizy-sidebar ul'
    # console.log li
    $(li).children('a:first').data('feature', feature)

  $('#relizy-sidebar ul a').click (event) =>

    if @active >= 0
      $el = $($('.feature')[@active])
      $el.hide()
      $('#relizy-sidebar ul a').css('font-weight', 'normal')

    # console.log $(event.target).data('feature')
    index = $(event.target).data('feature').index
    @active = index

    $el = $($('.feature')[index])
    $el.show()
    $link = $(event.target)
    $link.css('font-weight', 'bold')


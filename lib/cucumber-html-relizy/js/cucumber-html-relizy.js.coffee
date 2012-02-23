class Feature
  constructor: (@index, el) ->
    @name = $(el).children('h2').text().replace "Feature: ", ""
    @tags = []
    @tags.push($(node).text()) for node in $('.tag', el)
    #@file =

jQuery ($) ->
  @active = null

  html = '<div id="relishy-sidebar"></div>'
  $(html).insertAfter "#cucumber-header"

  a = $('<h3><a href="#">all features (toggle)</a></h3>').appendTo("#relishy-sidebar")
  $(a).click (event) =>
    $('.feature').toggle()

  # hide all features
  $(a).trigger('click')

  $('<ul />').appendTo("#relishy-sidebar")

  $.each $('.feature'), (index, item) ->
    feature = new Feature(index, item)
    # console.log feature
    li = $('<li><a href="#">'+ feature.name + '</a></li>').appendTo '#relishy-sidebar ul'
    # console.log li
    $(li).children('a:first').data('feature', feature)

  $('#relishy-sidebar ul a').click (event) =>

    if @active >= 0
      $el = $($('.feature')[@active])
      $el.hide()
      $('#relishy-sidebar ul a').css('font-weight', 'normal')

    # console.log $(event.target).data('feature')
    index = $(event.target).data('feature').index
    @active = index

    $el = $($('.feature')[index])
    $el.show()
    $link = $(event.target)
    $link.css('font-weight', 'bold')


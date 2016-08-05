# Back button
$(document).on "turbolinks:load", ->
  $('#admin-back-link').hover (->
    $(this).stop().animate 'opacity': 1
    return
  ), ->
    $(this).stop().animate 'opacity': 0.3
    return

$ ->
  # Flash messages
  flashCallback = ->
    $(".alert").fadeOut()
  $(".alert").bind 'click', (ev) =>
    $(".alert").fadeOut()
  setTimeout flashCallback, 3000

$(document).on "turbolinks:load", ->
  $('body').on 'ajax:success', '.like', (e, data, status, xhr) ->
    $(e.target).hide()
    $('.unlike_' + e.target.id).show()
    count = parseInt($('.like_count_' + e.target.id).html())
    $('.like_count_' + e.target.id).html(count + 1)

  $('body').on 'ajax:error', '.like', (e, data, status, xhr) ->
    M.toast({html: 'Falha ao curtir este post', displayLength: 4000, classes: 'red rounded'})

  $('body').on 'ajax:success', '.unlike', (e, data, status, xhr) ->
    $(e.target).hide()
    $('.like_' + e.target.id).show()
    count = parseInt($('.like_count_' + e.target.id).html())
    $('.like_count_' + e.target.id).html(count - 1)

  $('body').on 'ajax:error', '.unlike', (e, data, status, xhr) ->
    M.toast({html: 'Falha ao deixar de curtir este post', displayLength: 4000, classes: 'red rounded'})
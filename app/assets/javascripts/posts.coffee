$(document).on "turbolinks:load", ->
  $(".posts-index").ready ->
    next_page = 2
    finish_posts = false
    loading = false

    reload = (page) ->
      $('.load').show()
      loading = true
      $.get '/posts.js?page=' + page, (data) ->
        loading = false
        $('.load').hide()
        if (data.length == 0)
          finish_posts = true

    $(window).scroll ->
      if $(window).scrollTop() + $(window).height() == $(document).height()
        if (finish_posts == false && loading == false)
          reload(next_page++)
      return

    $(document).on "click", ".reload", (e) ->
      $('#posts').html('')
      reload(1)
      next_page = 2
      finish_posts = false

  $('body').on 'ajax:success', '#new_post', (e, data, status, xhr) ->
    M.toast({html: 'Post criado', displayLength: 4000, classes: 'green rounded'})
    $('#post_body').val('')
    count = parseInt($('#post_count').find('a').html())
    $('#post_count').find('a').html(count + 1)

  $('body').on 'ajax:error', '#new_post', (e, data, status, xhr) ->
    M.toast({html: 'Falha ao criar o Post', displayLength: 4000, classes: 'red rounded'})

  $('body').on 'ajax:success', '.delete_post', (e, data, status, xhr) ->
    M.toast({html: 'Post excluído', displayLength: 4000, classes: 'green rounded'})
    $('#post_' + e.target.id).remove()
    count = parseInt($('#post_count').find('a').html())
    $('#post_count').find('a').html(count - 1)

  $('body').on 'ajax:error', '.delete_post', (e, data, status, xhr) ->
    M.toast({html: 'Falha ao excluir o Post', displayLength: 4000, classes: 'red rounded'})
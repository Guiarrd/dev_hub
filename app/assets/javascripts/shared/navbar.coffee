$(document).on 'ready turbolinks:load', ->
  elem = document.querySelector('.sidenav')
  instance = new M.Sidenav(elem, {})
  $(".dropdown-trigger").dropdown()
  $('.modal').modal()
  $('ul.tabs').tabs()

$(document).on 'ready turbolinks:before-visit', ->
  elem = document.querySelector('.sidenav')
  instance = M.Sidenav.getInstance(elem);
  instance.destroy()
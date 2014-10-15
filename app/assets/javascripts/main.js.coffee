# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@logout = ->
  $.ajax
    url: "/login/srv_logout"
    type: "POST"
    async: false
    success: () ->
      location.replace "/"



$('#login_form').validate
  rules:
    login:
      required: true


    password:
      required: true


  errorClass: 'input_error'
  errorElement: 'em'
  messages:
    login: ""
    password: ""

  submitHandler: (form) ->
    queryString = $('#login_form').serialize()
    $.ajax
      url: '/login/srv_check_login'
      type: 'POST'
      async: false
      data: queryString
      success: (msg) ->
        location.replace '/'

    false
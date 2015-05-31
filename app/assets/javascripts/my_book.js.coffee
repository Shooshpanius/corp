# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



@my_book_new_save = () ->
  $("#my_book_new").validate
    rules:
      org:
        required: true
      phone_1:
        required: false,
        rangelength: [10, 10]
      phone_2:
        required: false,
        rangelength: [10, 10]
      email_1:
        required: false,
        email: true
      email_2:
        required: false,
        email: true
    errorClass: "input_error"
    errorElement: "em"
    messages:
      org: ""
      phone_1: ""
      phone_2: ""
      email_1: ""
      email_2: ""
    submitHandler: (form) ->
      queryString = $("#my_book_new").serialize()
      $.ajax
        url: "/my_book/srv_my_book_new_new_save"
        type: "POST"
        async: false
        data: queryString
        success: (msg) ->
          $("#my_book_new").modal 'hide'
          location.reload()
      false
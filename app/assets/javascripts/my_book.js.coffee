# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@call = (phone) ->
  alert("Вызов абонентов временно недоступен: "+phone)


@change_letter = (letter) ->
  $("#first_letter").val(letter)
  get_my_book()


@get_my_book = () ->
  $.ajax
    url: "/my_book/srv_get_my_book"
    type: "POST"
    async: false
    data: {
      first_letter: $("#first_letter").val()
    }
    success: (msg) ->
      $("#tbody_my_book").html(msg)
  false

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
        url: "/my_book/srv_my_book_new_save"
        type: "POST"
        async: false
        data: queryString
        success: (msg) ->
          $("#my_book_new").modal 'hide'
          location.reload()
      false



@my_book_edit_save = () ->
  $("#my_book_edit").validate
    rules:
      my_book_id:
        required: true
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
      queryString = $("#my_book_edit").serialize()
      $.ajax
        url: "/my_book/srv_my_book_edit_save"
        type: "POST"
        async: false
        data: queryString
        success: (msg) ->
          $("#my_book_edit").modal 'hide'
          location.reload()
      false


@my_book_edit_show = (my_book_id) ->
  $.ajax
    url: '/my_book/srv_my_book_edit_show'
    type: 'POST'
    data: {my_book_id: my_book_id}
    async: false
    success: (msg) ->
      $("#editMyBookModal").html msg
      $('#e_phone_1').mask '(999) 999-99-99'
      $('#e_phone_2').mask '(999) 999-99-99'
    false

  $('#editMyBookModal').modal()



$(document).ready ($) ->

  get_my_book()
  $('#phone_1').mask '(999) 999-99-99'
  $('#phone_2').mask '(999) 999-99-99'
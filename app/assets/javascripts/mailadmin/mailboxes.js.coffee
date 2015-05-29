# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


@change_letter = (letter) ->
  $("#first_letter").val(letter)
  get_users()

@get_users = () ->
  $.ajax
    url: "/mailadmin/mailboxes/srv_get_users"
    type: "POST"
    async: false
    data: {
      domain_id: $("#domain_changer option:selected").val()
      first_letter: $("#first_letter").val()
    }
    success: (msg) ->
      $("#tbody_users").html(msg)
  false

@mailbox_new_save = () ->
  $("#mailbox_new").validate
    rules:
      mailbox:
        required: true,
        remote : {
          url: "/mailadmin/mailboxes/srv_mailbox_check",
          type: "post",
          data: {
            domain_id: $("#domain_user option:selected").val(),
            mailbox: $("#mailbox").val()
          }
        }

    errorClass: "input_error"
    errorElement: "em"
    messages:
      mailbox: ""

    submitHandler: (form) ->
      queryString = $("#mailbox_new").serialize()
      $.ajax
        url: "/mailadmin/mailboxes/srv_mailbox_new_save"
        type: "POST"
        async: false
        data: queryString
        success: (msg) ->
          $("#mailbox_new").modal 'hide'
          location.reload()
      false



@info_pwd = (mailbox_id) ->
  $.ajax
    url: "/mailadmin/mailboxes/srv_get_pwd"
    type: "POST"
    async: false
    data: {
      mailbox_id: mailbox_id
    }
    success: (msg) ->
      $("#pw_"+mailbox_id).html(msg)






$(document).ready ($) ->

  get_users()

  $('#domain_changer').change ->
    get_users()



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



  false



$(document).ready ($) ->

  get_users()

  $('#domain_changer').change ->
    get_users()



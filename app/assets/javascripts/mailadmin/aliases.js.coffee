# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@alias_new_save = () ->
  $("#alias_new").validate
    rules:
      Alias:
        required: true,
        remote : "/mailadmin/aliases/srv_check_alias"
    errorClass: "input_error"
    errorElement: "em"
    messages:
      Alias: ""
    submitHandler: (form) ->
      queryString = $("#alias_new").serialize()
      $.ajax
        url: "/mailadmin/aliases/srv_alias_new_save"
        type: "POST"
        async: false
        data: queryString
        success: (msg) ->
          $("#alias_new").modal 'hide'
          location.reload()
      false
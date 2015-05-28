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



@user_to_alias = (alias_id, user_id) ->
  $.ajax
    url: "/mailadmin/aliases/srv_user_to_alias"
    type: "POST"
    async: false
    data: {
      alias_id: alias_id,
      user_id: user_id,
      is_check: $("#c_"+user_id).is(':checked')
    }
    success: (msg) ->
      if msg == '1'
        $("#r_"+user_id).addClass('success')
      else
        $("#r_"+user_id).removeClass('success')


  false


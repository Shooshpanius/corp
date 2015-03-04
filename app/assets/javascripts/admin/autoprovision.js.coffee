# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@device_delete = (mac) ->
  if confirm('Удалить все записи с данным MAC-адресом?')
    $.ajax
      url: '/admin/autoprovision/srv_device_delete'
      type: 'POST'
      data: {mac: mac}
      async: false
      success: (msg) ->
        location.reload()


@device_edit_show = (device_id) ->
  $.ajax
    url: '/admin/autoprovision/srv_device_edit_show'
    type: 'POST'
    data: {device_id: device_id}
    async: false
    success: (msg) ->
      $("#editDeviceModal").html msg
    false
  $('#editDeviceModal').modal()
  $('#MAC_ed').mask('AA:AA:AA:AA:AA:AA',
    {'translation': {
      A: {pattern: /[A-Fa-f0-9]/}
    }
    })



@device_edit_save = () ->

  $("#device_edit").validate
    rules:
      corp_number_edit:
        required: true
      building_edit:
        required: true
      room_edit:
        required: true
      id:
        required: true
    errorClass: "input_error"
    errorElement: "em"
    messages:
      corp_number_edit: ""
      building_edit: ""
      room_edit: ""
      id: ""
    submitHandler: (form) ->
      queryString = $("#device_edit").serialize()
      $.ajax
        url: "/admin/autoprovision/srv_device_edit_save"
        type: "POST"
        async: false
        data: queryString
        success: (msg) ->
          $("#device_edit").modal 'hide'
          location.reload()
      false




@device_new_save = () ->
  $("#device_new").validate
    rules:
      MAC:
        required: true,
        rangelength: [17, 17],
        remote : "/admin/autoprovision/srv_check_mac"
      phone_model:
        required: true
      building:
        required: true
      room:
        required: true
    errorClass: "input_error"
    errorElement: "em"
    messages:
      MAC: ""
      phone_model: ""
      building: ""
      room: ""
    submitHandler: (form) ->
      queryString = $("#device_new").serialize()
      $.ajax
        url: "/admin/autoprovision/srv_device_new_save"
        type: "POST"
        async: false
        data: queryString
        success: (msg) ->
          $("#device_new").modal 'hide'
          location.reload()
      false




$(document).ready ($) ->

  $('#MAC').mask('AA:AA:AA:AA:AA:AA',
    {'translation': {
      A: {pattern: /[A-Fa-f0-9]/}
    }
    })
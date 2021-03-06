# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@audioModal_show = (uniqueid) ->
  $.ajax
    url: '/stat/call_stat/srv_get_audio_modal'
    type: 'POST'
    data: {uniqueid: uniqueid}
    async: false
    success: (msg) ->
      $("#audioModal").html msg
    false
  $('#audioModal').modal()





$(document).ready ->

  $("#tbl_callstat").tablesorter(
    headers:
      0:
        filter: false
      7:
        sorter: false
    widthFixed : true
    widgets: [
      "zebra"
    ]
    widgetOptions :
      filter_hideFilters: true
      filter_childRows: false
      filter_startsWith: false

  ).tablesorterPager container: $("#pager"), size: 20

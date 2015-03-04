# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@favorite = (address_id) ->
  $.ajax
    url: '/address_book/srv_favorite'
    type: 'POST'
    async: false
    data: {address_id:address_id}
    success: (msg) ->
      if msg is 'r'
        $("#fav_"+address_id).addClass "fa-star-o"
        $("#fav_"+address_id).removeClass "fa-star"
        $("#fav_"+address_id).removeAttr('style')
      else
        $("#fav_"+address_id).removeClass "fa-star-o"
        $("#fav_"+address_id).addClass "fa-star"
        $("#fav_"+address_id).css color: "#F34D59"

  false

@call = (number) ->
  $.ajax
    url: '/address_book/srv_call'
    type: 'POST'
    async: false
    data: {number:number}
#    success: () ->
#      location.replace '/distribution_file'

  false


@info_show = (address_id) ->
  $.ajax
    url: '/address_book/srv_info_show'
    type: 'POST'
    async: false
    data: {address_id:address_id}
    success: (msg) ->
      $("#infoShowModal").html msg
    false
  $('#infoShowModal').modal()



  false


$(document).ready ->

  $("#tbl_adresses").tablesorter(
#    headers:
#      4:
#        filter: false
    widthFixed : true
    widgets: [
      "zebra"
      "filter"
    ]
    widgetOptions :
      filter_hideFilters: true
      filter_childRows: false
      filter_startsWith: false

  )
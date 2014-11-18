# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@call = (number) ->
  $.ajax
    url: '/address_book/srv_call'
    type: 'POST'
    async: false
    data: {number:number}
#    success: () ->
#      location.replace '/distribution_file'

  false
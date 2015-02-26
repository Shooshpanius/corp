# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ($) ->

  $.ajax
    url: '/stat/call_direction/srv_get_cell_k.json'
    type: 'POST'
    async: false
    success: (msg) ->
      data = msg
      cell_k = new Chart($("#cell_k").get(0).getContext("2d")).Bar(data,{
        multiTooltipTemplate: "<%= value %>: <%= datasetLabel %>"
      })



  false


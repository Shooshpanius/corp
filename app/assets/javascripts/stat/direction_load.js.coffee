# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/






$(document).ready ->

  $.ajax
    url: '/stat/direction_load/srv_get_conts.json'
    type: 'POST'
    dataType: 'json',
    async: false
    success: (result) ->
      for n of result

        $.ajax
          url: '/stat/direction_load/srv_get_cont.json'
          type: 'POST'
          data: {
            type_of: 'day',
            cont: result[n].name
          }
          async: false
          success: (msg) ->
            data = msg
            corp_time = new Chart($("#"+result[n].name+"_day").get(0).getContext("2d")).Bar(data,{
              multiTooltipTemplate: "<%= value %>: <%= datasetLabel %>",
              tooltipTemplate: "<%= value %>: <%= datasetLabel %>",
              animation: false
            })

        $.ajax
          url: '/stat/direction_load/srv_get_cont.json'
          type: 'POST'
          data: {
            type_of: 'year',
            cont: result[n].name
          }
          async: false
          success: (msg) ->
            data = msg
            corp_time = new Chart($("#"+result[n].name+"_year").get(0).getContext("2d")).Bar(data,{
              multiTooltipTemplate: "<%= value %>: <%= datasetLabel %>",
              tooltipTemplate: "<%= value %>: <%= datasetLabel %>",
              animation: false
            })


    false
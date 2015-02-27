# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ($) ->

  $.ajax
    url: '/stat/call_direction/srv_get_cell_time.json'
    type: 'POST'
    async: false
    success: (msg) ->
      data = msg
      cell_time = new Chart($("#cell_time").get(0).getContext("2d")).Bar(data,{
        multiTooltipTemplate: "<%= value %>: <%= datasetLabel %>",
        tooltipTemplate: "<%= value %>: <%= datasetLabel %>",
        animation: false
      })

  $.ajax
    url: '/stat/call_direction/srv_get_cell_count.json'
    type: 'POST'
    async: false
    success: (msg) ->
      data = msg
      cell_time = new Chart($("#cell_count").get(0).getContext("2d")).Bar(data,{
        multiTooltipTemplate: "<%= value %>: <%= datasetLabel %>",
        tooltipTemplate: "<%= value %>: <%= datasetLabel %>",
        animation: false
      })



  $.ajax
    url: '/stat/call_direction/srv_get_corp_time.json'
    type: 'POST'
    async: false
    success: (msg) ->
      data = msg
      corp_time = new Chart($("#corp_time").get(0).getContext("2d")).Bar(data,{
        multiTooltipTemplate: "<%= value %>: <%= datasetLabel %>",
        tooltipTemplate: "<%= value %>: <%= datasetLabel %>",
        animation: false
      })

  $.ajax
    url: '/stat/call_direction/srv_get_corp_count.json'
    type: 'POST'
    async: false
    success: (msg) ->
      data = msg
      corp_time = new Chart($("#corp_count").get(0).getContext("2d")).Bar(data,{
        multiTooltipTemplate: "<%= value %>: <%= datasetLabel %>",
        tooltipTemplate: "<%= value %>: <%= datasetLabel %>",
        animation: false
      })



  $.ajax
    url: '/stat/call_direction/srv_get_intercity_time.json'
    type: 'POST'
    async: false
    success: (msg) ->
      data = msg
      corp_time = new Chart($("#intercity_time").get(0).getContext("2d")).Bar(data,{
        multiTooltipTemplate: "<%= value %>: <%= datasetLabel %>",
        tooltipTemplate: "<%= value %>: <%= datasetLabel %>",
        animation: false
      })

  $.ajax
    url: '/stat/call_direction/srv_get_intercity_count.json'
    type: 'POST'
    async: false
    success: (msg) ->
      data = msg
      corp_time = new Chart($("#intercity_count").get(0).getContext("2d")).Bar(data,{
        multiTooltipTemplate: "<%= value %>: <%= datasetLabel %>",
        tooltipTemplate: "<%= value %>: <%= datasetLabel %>",
        animation: false
      })



  $.ajax
    url: '/stat/call_direction/srv_get_city_time.json'
    type: 'POST'
    async: false
    success: (msg) ->
      data = msg
      corp_time = new Chart($("#city_time").get(0).getContext("2d")).Bar(data,{
        multiTooltipTemplate: "<%= value %>: <%= datasetLabel %>",
        tooltipTemplate: "<%= value %>: <%= datasetLabel %>",
        animation: false
      })

  $.ajax
    url: '/stat/call_direction/srv_get_city_count.json'
    type: 'POST'
    async: false
    success: (msg) ->
      data = msg
      corp_time = new Chart($("#city_count").get(0).getContext("2d")).Bar(data,{
        multiTooltipTemplate: "<%= value %>: <%= datasetLabel %>",
        tooltipTemplate: "<%= value %>: <%= datasetLabel %>",
        animation: false
      })



  $.ajax
    url: '/stat/call_direction/srv_get_local_time.json'
    type: 'POST'
    async: false
    success: (msg) ->
      data = msg
      corp_time = new Chart($("#local_time").get(0).getContext("2d")).Bar(data,{
        multiTooltipTemplate: "<%= value %>: <%= datasetLabel %>",
        tooltipTemplate: "<%= value %>: <%= datasetLabel %>",
        animation: false
      })

  $.ajax
    url: '/stat/call_direction/srv_get_local_count.json'
    type: 'POST'
    async: false
    success: (msg) ->
      data = msg
      corp_time = new Chart($("#local_count").get(0).getContext("2d")).Bar(data,{
        multiTooltipTemplate: "<%= value %>: <%= datasetLabel %>",
        tooltipTemplate: "<%= value %>: <%= datasetLabel %>",
        animation: false
      })

  false


# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#visit_master_id').change (e) ->
    masterId = $(e.target).val()

    $.ajax(url: "/select").done (html) ->
      $("#results").append html

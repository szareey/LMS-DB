# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  $('.view-answers').on 'click', (e) ->
    e.preventDefault()
    $(this).closest('.card-action').find('.answers').slideToggle(300)

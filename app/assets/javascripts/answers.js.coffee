# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  mousePress = false

  stroke = 
    x: []
    y: []
  
  solution = []

  $whiteboard = $('#whiteboard')
  context = $whiteboard[0].getContext("2d")

  record_stroke = (e, canvas) ->
    mouseX = e.pageX - canvas.offsetLeft
    mouseY = e.pageY - canvas.offsetTop
    stroke.x.push mouseX
    stroke.y.push mouseY
    return

  # Draw event
  $whiteboard.mousedown (e) ->
    mousePress = true
    record_stroke(e, @)
    return

  $whiteboard.mousemove (e) ->
    if mousePress == true
      record_stroke(e, @)
    return

  $whiteboard.mouseup ->
    mousePress = false
    solution.push stroke
    stroke =
      x: []
      y: []
    return

  $('#testStroke').on 'click', ->
    console.log(solution)
    return

  return
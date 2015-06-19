# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  mousePress = false

  stroke = 
    x: []
    y: []
  
  $whiteboard = $('#whiteboard')
  # console.log $whiteboard.data("points")
  solution = $whiteboard.data("points") || "[]"
  context = $whiteboard[0].getContext("2d")

  initialize_stroke = ->
    context.strokeStyle = "#df4b26"
    context.lineJoin = "round"
    context.lineWidth = 1
    context.beginPath()
    return

  record_stroke = (e) ->
    # Get canvas coordinates of mouse event. 
    # TODO: figure out why coordinate point is offset by about 8px
    mouseX = e.offsetX - 8
    mouseY = e.offsetY - 8

    # record points that make up the stroke
    stroke.x.push mouseX
    stroke.y.push mouseY

    # draw the points on the canvas
    # move the to the previously recorded point
    newPointIndex = stroke.x.length - 1
    prevPointIndex = stroke.x.length - 2
    initialize_stroke()
    context.moveTo(stroke.x[prevPointIndex], stroke.y[prevPointIndex])
    context.lineTo(stroke.x[newPointIndex], stroke.y[newPointIndex])
    context.closePath()
    context.stroke()

  # Draw event
  $whiteboard.mousedown (e) ->    
    mousePress = true 
    # record_stroke draws a line between most recent point and previous point, so the initial click will register two points so that a line can be drawn
    record_stroke(e)
    return

  $whiteboard.mousemove (e) ->
    if mousePress == true
      record_stroke(e)
    return

  $whiteboard.mouseup ->
    mousePress = false
    solution.push stroke
    # point = new ImageData(Uint8ClampedArray.from([stroke.x, stroke.y]), 5, 5)
    # context.putImageData(point, stroke.x, stroke.y)
    stroke =
      x: []
      y: []
    return

  $('#testStroke').on 'click', ->
    console.log(solution)
    return

  saveSuccess = (message) ->
    $('.saveMessage').text('Saved!')
    setTimeout ( ->
      $('.saveMessage').html('&nbsp;')
    ), 1000

  $('#finish').on 'click', ->
    $.ajax
      type: 'POST'
      url: '/questions/' + $whiteboard.attr("data-id") + '/answers'
      data: {solution: JSON.stringify(solution), user_id: $('#user_id').val()}
      success: saveSuccess

  $('#showAnswer').on 'click', ->
    for stroke in solution
      for x, i in stroke.x
        context.moveTo(stroke.x[i], stroke.y[i])
        context.lineTo(stroke.x[i+1], stroke.y[i+1])
        context.closePath()
        context.stroke()
 
    # i = 0
    # while i < solution.length
    #   i++
    #   z = 1  
    #   while z < stroke.x.length
    #     initialize_stroke()
    #     context.moveTo(stroke.x[z - 1], stroke.y[z - 1])
    #     context.lineTo(stroke.x[z], stroke.y[z])
    #     context.closePath()
    #     context.stroke()
    #     z++
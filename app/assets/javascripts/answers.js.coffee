# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  if $("body.answers").length > 0

    mousePress = false

    stroke = 
      x: []
      y: []
    
    $whiteboard = $('#whiteboard')
    solution = $whiteboard.data("points") || []
    context = $whiteboard[0].getContext("2d")

    initialize_stroke = ->  
      context.strokeStyle = stroke.color
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
      stroke =
        x: []
        y: []
        color: "#df4b26"
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
      # Draw the first stroke in the solution
      drawStroke(0)

    drawStroke = (i) ->
      # Only draw strokes while i < the # of strokes in the solution 
      if i < solution.length
        stroke = solution[i]

        # Draw the points in the stroke
        drawPoints(stroke, ->

          # When the points are drawn, draw the next stroke
          drawStroke(i + 1)
        )
    
    drawPoints = (stroke, callback) ->
      context.moveTo(stroke.x[0], stroke.y[0])

      # Draw the first point in stroke
      drawPoint(stroke, callback, 1)

    drawPoint = (stroke, callback, i) ->
      if i < stroke.x.length
        # Delay each point by X miliseconds
        setTimeout ->
          # Draw
          context.lineTo(stroke.x[i], stroke.y[i])
          context.stroke()  

          # Draw the next point in the stroke
          drawPoint(stroke, callback, i + 1)
        , 18
      else
        # If all points are done, call the callback
        # which draws the next stroke
        callback()


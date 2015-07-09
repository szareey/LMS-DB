# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

  if $("body.answers").length > 0

    mousePress = false
    prevPointTime = 0

    colors = {
      eraser: "#FFFFFF",
      pencil: "#C0C0C0"
      blue: "#0000FF"
      green: "#008000"
      orange: "#FFA500"
    }

    stroke = 
      x: []
      y: []
      pointDelay: []
      strokeDelay: 0
      color: colors.pencil
      width: 1
    
    zoom = 1

    # method to draw question on canvas. Get's value from data-question in html view
    draw_question = ->
      question = new Image 
      question.onload = ->
        context.drawImage(question,0,0)
      question.src = $whiteboard.data("question")

    $palette = $('.palette')
    $weight = $('.pencil-weight')
    $zoom = $('.zoom')

    highlightPalette = (element, type = 'palette') ->
      if type == 'palette'
        $palette.removeClass('clicked')
      else if type == 'weight'
        $weight.removeClass('clicked')
      else if type == 'zoom'
        $zoom.removeClass('clicked')
      element.addClass('clicked')
      

    $whiteboard = $('#whiteboard')
    solution = $whiteboard.data("points") || []
    context = $whiteboard[0].getContext("2d")
    draw_question()

    $slider = $('#slider')

    # initialize the playback slider to have max range equal to the number of strokes
    $slider.noUiSlider
      start: [ 0 ]
      step: 1
      range:
        'min': 0
        'max': solution.length

    $slider.on 'slide', ->
      $whiteboard.attr("height", "500px")
      fastRedraw($slider.val())

    $('#eraser').on 'click', ->
      stroke.color = colors.eraser
      stroke.width = 20
      highlightPalette($(this))

    $('#pencil').on 'click', ->
      stroke.color = colors.pencil
      highlightPalette($(this))

    $('#blue-pencil').on 'click', ->
      stroke.color = colors.blue
      highlightPalette($(this))

    $('#green-pencil').on 'click', ->
      stroke.color = colors.green
      highlightPalette($(this))

    $('#orange-pencil').on 'click', ->
      stroke.color = colors.orange
      highlightPalette($(this))

    $('#thin').on 'click', ->
      stroke.width = 1
      highlightPalette($(this), 'weight')

    $('#thick').on 'click', ->
      stroke.width = 10
      highlightPalette($(this), 'weight')

    $('#zoomIn').on 'click', ->
      zoom = 2
      $whiteboard.attr("height", "500px")
      $whiteboard.attr("width", "1000px")
      context.scale(zoom, zoom)
      fastRedraw()
      draw_question()
      highlightPalette($(this), 'zoom')
      
    $('#zoomOut').on 'click', ->
      zoom = 1
      $whiteboard.attr("height", "500px")
      $whiteboard.attr("width", "1000px")
      context.scale(zoom, zoom)
      fastRedraw()
      draw_question()
      highlightPalette($(this), 'zoom')

    initialize_stroke = ->  
      context.strokeStyle = stroke.color
      context.lineJoin = "round"
      context.lineWidth = stroke.width
      context.beginPath()

    record_stroke = (e) ->
      # Get canvas coordinates of mouse event. 
      # TODO: figure out why coordinate point is offset by about 8px
      mouseX = e.offsetX - 8
      mouseY = e.offsetY - 8

      # record points that make up the stroke
      stroke.x.push mouseX
      stroke.y.push mouseY


      # save the time delay between each point
      # If it's the first point save a delay of zero and temporarily save the time. Else, save the time between each point
      # temporaraily save the time of the first point
      if stroke.x.length > 1
        pointTime = Date.now() - prevPointTime
        stroke.pointDelay.push pointTime
        console.log('time between points: ', pointTime)
      # save the time that the point was recorded 
      prevPointTime = Date.now()

      console.log("delay between points", stroke.pointDelay[stroke.pointDelay.length - 1])

      # draw the points on the canvas
      # move the to the previously recorded point
      newPointIndex = stroke.x.length - 1
      prevPointIndex = stroke.x.length - 2
      initialize_stroke()
      context.moveTo(stroke.x[prevPointIndex], stroke.y[prevPointIndex])
      context.lineTo(stroke.x[newPointIndex], stroke.y[newPointIndex])
      context.closePath()
      context.stroke()
      console.log(stroke)

    # Draw event
    $whiteboard.mousedown (e) ->    
      mousePress = true 
      # record the delay in time between the previous stroke and the current stroke, except for the first stroke
      if solution.length >= 1
        stroke.strokeDelay = Date.now() - stroke.strokeDelay

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
      # redraw question to ensure it stays on top
      draw_question()
      stroke =
        x: []
        y: []
        pointDelay: []
        # temporarily save the time when the stroke finished to find the delay when the next stroke begins
        strokeDelay: Date.now() 
      return

    $('#testStroke').on 'click', ->
      drawDelayStroke(0)
      console.log('hi')

    saveSuccess = (message) ->
      $('.saveMessage').text('Saved!')
      setTimeout ( ->
        $('.saveMessage').html('&nbsp;')
      ), 1000

    # Convert dataURL to Blob object
    dataURLtoBlob = (dataURL) ->
      # Decode the dataURL    
      binary = atob(dataURL.split(',')[1])
      # Create 8-bit unsigned array
      array = []
      i = 0
      while i < binary.length
        array.push binary.charCodeAt(i)
        i++
      # Return our Blob object
      return new Blob([ new Uint8Array(array) ], type: 'image/png')

    $('#finish').on 'click', ->
      dataURL = $whiteboard[0].toDataURL("image/png")
      # .replace(/^data:image\/png;base64,/, '')
      # file = dataURLtoBlob(dataURL)
      # fd = new FormData()
      # fd.append("image", file)
      $.ajax
        type: 'POST'
        url: '/questions/' + $whiteboard.attr("data-id") + '/answers'
        data: {solution: JSON.stringify(solution), user_id: $('#user_id').val(), final_answer_img: dataURL}
        success: saveSuccess

    $('#showAnswer').on 'click', ->
      # Draw the first stroke in the solution
      # drawStroke(0)
      drawDelayStroke(0)

    # TODO: Make more efficient. Currently still going though all s in solution values.
    fastRedraw = (sliderValue = -1) ->
     if sliderValue == -1
        sliderValue = solution.length
     for s, ind  in solution
      if ind < sliderValue
        stroke = s
        initialize_stroke()
        for p, i in stroke.x
          context.moveTo(p, stroke.y[i])
          context.lineTo(stroke.x[i + 1], stroke.y[i + 1])
        context.closePath()
        context.stroke()
      draw_question()

    # Animated drawing of student's answer
    drawStroke = (i, timer = 18) ->
      draw_question()
      # Only draw strokes while i < the # of strokes in the solution 
      if i < solution.length
        stroke = solution[i]
        initialize_stroke()
        # Draw the points in the stroke
        drawPoints(stroke, timer, ->
          # When the points are drawn, draw the next stroke
          drawStroke(i + 1, timer)
        )
    
    drawPoints = (stroke, timer, callback) ->
      context.moveTo(stroke.x[0], stroke.y[0])

      # Draw the first point in stroke
      drawPoint(stroke, timer, callback, 1)

    drawPoint = (stroke, timer, callback, i) ->
      if i < stroke.x.length
        # Delay each point by X miliseconds
        setTimeout ->
          # Draw
          context.lineTo(stroke.x[i], stroke.y[i])
          context.stroke()  

          # Draw the next point in the stroke
          drawPoint(stroke, timer, callback, i + 1)
        , timer
      else
        # If all points are done, call the callback
        # which draws the next stroke
        callback()

    # draws the strokes with a time delay reflecting the student's pauses between strokes
    drawDelayStroke = (i)  -> 
      if i < solution.length
        stroke = solution[i]
        initialize_stroke()
        # wait the recorded amount of time before between the strokes before drawing the first line
        # TODO: could change strokeDelay to be the first element in pointDelay.
        setTimeout ->
          drawDelayPoints(stroke, 0)
        , stroke.strokeDelay

    # TODO: refactor to have only one setTimeout method
    drawDelayPoints = (stroke, i) ->
      if i < stroke.x.length
        # draw the first line
        context.moveTo(stroke.x[i], stroke.y[i])
        context.lineTo(stroke.x[i + 1], stroke.y[i + 1])
        context.closePath()
        context.stroke()
        # wait the recorded time before drawing the next line
        setTimeout ->
          drawDelayPoints(stroke, i + 1)
        , stroke.pointDelay[i + 1]
      else
        # if we reach the end of the stroke, load up the next stroke in solution
        nextStrokeIndex = solution.indexOf(stroke) + 1
        if nextStrokeIndex < solution.length
          setTimeout ->   
              drawDelayPoints(solution[nextStrokeIndex], 0)
          , solution[nextStrokeIndex].strokeDelay


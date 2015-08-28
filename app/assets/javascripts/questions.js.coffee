# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

markSaver = ->
  doneTypingInterval = 1000
  typingTimer = null

  saveMark = (val, id, $progress)->
    return unless val && $.isNumeric(val)
    
    $progress.show()
    $.ajax(
      type: 'PUT'
      url:  "/answers/#{id}",
      data: {
        answer: {
          score: val
        }
      }
      success: ->
        $progress.hide()
    )

  $('.answer .mark input').on 'keyup', ->
    $current_input = $(this)

    val = $current_input.val()
    id = $current_input.closest('.answer')
                       .attr('data-id')

    clearTimeout(typingTimer)
    
    typingTimer = setTimeout (->
      saveMark(val, id, $current_input.parent().find('.progress'))
    ), doneTypingInterval if val
  

$ ->
  $('.view-answers').on 'click', (e) ->
    e.preventDefault()
    $(this).closest('.card-action').find('.answers').slideToggle(300)

  readURL = (input) ->
    if input.files and input.files[0]
      reader = new FileReader

      reader.onload = (e) ->
        $('#question_preview').attr 'src', e.target.result
        return

      reader.readAsDataURL input.files[0]
    return

  $('#question_question').change ->
    readURL this
    $('#question_preview').removeAttr('hidden')
    return

  markSaver()
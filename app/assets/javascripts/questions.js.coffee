# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

markSaver = ->
  doneTypingInterval = 500
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
        setTimeout(->
          $progress.hide()
        , 500)
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
  
file_img_input = ->
  $without_button = $('.img-select').first().clone()
  $without_button.find('.add-button').remove()
  $add_button = $('.img-select').first().find('.add-button .btn-floating')
  $container = $('.img-select').parent()

  $add_button.click ->
    $container.append($without_button.clone())

$ ->
  file_img_input()
  markSaver()

'''
  $file_input_html = $('.file-field.input-field')
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

  $('.file-field.input-field input[type="file"]').change ->
    readURL this
    $('#question_preview').removeAttr('hidden')
    $file_input_html.append($file_input_html.html())
    return
'''
  
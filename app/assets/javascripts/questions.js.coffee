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


dragDropFile = ->
  ids = []
  updateInput = ->
    $('#question_image_ids').val(ids.join(','))

  $(".dropzone").dropzone({
    paramName: "image",
    addRemoveLinks: true,
    success: (file, response)->
      ids.push response['id']
      $(file.previewTemplate).find('.dz-remove').attr('id', response.id)
      $(file.previewElement).addClass("dz-success")
      updateInput()
    removedfile: (file) ->
      id = $(file.previewTemplate).find('.dz-remove').attr('id')
      $(file.previewTemplate).remove()
      ids.splice(ids.indexOf(id), 1)
      updateInput()
  });
$ ->
  #file_img_input()
  #markSaver()
  Dropzone.autoDiscover = false
  dragDropFile()


  $('.view-answers').on 'click', (e) ->
    e.preventDefault()
    $(this).closest('.card-action').find('.answers').slideToggle(300)
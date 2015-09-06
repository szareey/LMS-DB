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
  $first_select = $('.img-select').first().clone()
  $add_button = $('.img-select').first().find('.add-button .btn-floating')
  $container = $('.img-select').parent()
  $with_delete = (->
    $temp = $container.find('.img-select').first().clone()
    $temp.find('.add-button').toggleClass('add-button delete-button')
    $temp.find('.delete-button .material-icons').text('delete')
    $temp)()

  deleteInput = ->
    $(this).closest('.img-select').remove()
  addInpit = ->
    $container.append($with_delete.clone())
  loadPreview = (input, $image)->
    reader = new FileReader

    reader.onload = (e) ->
      $image.attr 'src', e.target.result
      $image.show()
      addInpit()

    reader.readAsDataURL input.files[0]

  $add_button.click addInpit
  $container.on 'click', '.delete-button', deleteInput

  $container.on 'change', 'input[type="file"]', ->
    $image = $(this).closest('.img-select').find('img')
    loadPreview(this, $image) if this.files and this.files[0]


  dragDropFile = ->
    $container.find('input')[0].ondrop = ->
      console.log 'tezt'

  dragDropFile()

$ ->
  file_img_input()
  markSaver()

  $('.view-answers').on 'click', (e) ->
    e.preventDefault()
    $(this).closest('.card-action').find('.answers').slideToggle(300)
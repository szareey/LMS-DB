# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


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
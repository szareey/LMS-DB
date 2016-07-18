$(document).ready ->
  $next_btn = $('#outline_next')
  $course_code = $('#course_code_id').val()

  # keep track of which step the user is in
  current_step = 0
  
  $next_btn.on 'click', ->
    if current_step == 0
      current_step ++
      

    $.get('/course_outline/' + $course_code).success (data) ->



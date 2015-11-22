$(document).ready ->
  $next_btn = $('#outline_next')
  $outline_questions = $('[id^=course_outline]')
  $outline_label = $('label[for^=course_outline]')

  # To keep track of which question to display
  # total_questions = $outline_questions.length()
  current_question = 0

  # Start off with everything hidden but the first field
  $outline_questions.hide();
  $outline_label.hide();

  $($outline_questions[0]).fadeIn()
  $($outline_label[0]).fadeIn()

  # Every time next is clicked, show the next question
  $next_btn.on 'click', ->
    # Hide the question just asked
    $($outline_questions[current_question]).hide()
    $($outline_label[current_question]).hide()
    # increment the counter
    current_question++
    # show the next question
    $($outline_questions[current_question]).fadeIn()
    $($outline_label[current_question]).fadeIn()
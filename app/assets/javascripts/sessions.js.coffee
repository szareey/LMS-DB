###*
# Function that gets the data of the profile in case
# thar it has already saved in localstorage. Only the
# UI will be update in case that all data is available
#
# A not existing key in localstorage return null
#
###

$(document).ready ->
  $login = $('#loginContainer')

  $('#showLogin').on 'click', ->
    $('#welcomeMessage').addClass('hide')
    $login.removeClass('hide')
      
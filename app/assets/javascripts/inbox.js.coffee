$ ->
  # Configure infinite messages
  $('.infinite-messages').infinitePages
    # debug: true
    loading: ->
      $(this).text('Loading more messages...')
    error: ->
      $(this).button('There was an error, please try again')

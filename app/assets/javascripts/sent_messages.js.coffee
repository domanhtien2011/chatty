$ ->
  # Configure infinite messages
  $('.infinite-sent-messages').infinitePages
    # debug: true
    loading: ->
      $(this).text('Loading more sent messages...')
    error: ->
      $(this).button('There was an error, please try again')

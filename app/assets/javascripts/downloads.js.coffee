window.prepareDownload = ->
  $('#new_download').hide()
  $('#download_link').show()

$ ->
  $('#download_link').click ->
    $('#new_download').show 'slow'
    $(this).hide 'slow'
    return false
$ ->
  $ '#select_all'
    .click ->
      if this.checked
        $ '.idea_checkbox'
          .each ->
            $(this).prop('checked', true)
      else
        $ '.idea_checkbox'
          .each ->
            $(this).prop('checked', false)

  $ '.idea_checkbox'
    .click ->
      if all_checked()
        $('#select_all').prop('checked', false)
      else
        $('#select_all').prop('checked', true)

all_checked = () ->
  $('.idea_checkbox').each ->
    if $(this).prop('checked') is false
      false
  true

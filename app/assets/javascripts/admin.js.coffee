//= require jquery
//= require jquery_ujs
//= require jquery.ui.autocomplete
//= require bootstrap
//= require turbolinks
//= require_tree ./admin/
//= require autocomplete-rails

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
        $('#select_all').prop('checked', true)
      else
        $('#select_all').prop('checked', false)

all_checked = () ->
  flag = true
  $('.idea_checkbox').each ->
    if $(this).prop('checked') is false
      flag = false
  flag

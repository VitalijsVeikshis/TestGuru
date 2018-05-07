$(document).on 'turbolinks:load', ->
  I18n.locale = $('footer').data('locale')

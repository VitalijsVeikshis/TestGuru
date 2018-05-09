document.addEventListener('turbolinks:load', function() {
  I18n.locale = $('footer').data('locale')
})

document.addEventListener('turbolinks:load', function() {
  $('.form-inline-link').on('click', formInlineLinkHandler)

  var errors = document.querySelector('.resource-errors')
  if (errors) {
    var resourceId = errors.dataset.resourceId
    formInlineHandler(resourceId)
  }
})

function formInlineLinkHandler(event) {
  event.preventDefault()

  var resourceId = this.dataset.resourceId
  formInlineHandler(resourceId)
}

function formInlineHandler(resourceId) {
  console.log(resourceId)
  var link = document.querySelector('.form-inline-link[data-resource-id="' + resourceId + '"]')
  console.log(link)
  if (link) {
    var $resourceTitle = $('.resource-title[data-resource-id="' + resourceId + '"]')
    var $formInline = $('.form-inline[data-resource-id="' + resourceId + '"]')

    $formInline.toggle()
    $resourceTitle.toggle()

    if($formInline.is(':visible')) {
      link.textContent = I18n.t('cancel');
    } else {
      link.textContent = I18n.t('edit');
    }
  }
}

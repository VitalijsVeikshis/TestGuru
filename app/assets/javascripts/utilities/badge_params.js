document.addEventListener('turbolinks:load', function() {
  var badgeType = document.querySelector('.badge-type')

  if (badgeType) {
    var badgeParams = document.querySelectorAll('.badge-params')
    var paramsInputs = document.querySelectorAll('.params-input')

    show_params(badgeType, badgeParams, paramsInputs)

    badgeType.addEventListener('change', function() {
      show_params(badgeType, badgeParams, paramsInputs)
    })
  }
})

function all_hide(badgeParams) {
  for (var i = 0; i < badgeParams.length; i++) {
    badgeParams[i].classList.add('hide')
    badgeParams[i].value = ''
  }
}

function remove_hide(currentBadgeParams) {
  for (var i = 0; i < currentBadgeParams.length; i++) {
    currentBadgeParams[i].classList.remove('hide')
  }
}

function clear_fields(paramsInputs) {
  for (var i = 0; i < paramsInputs.length; i++) {
    paramsInputs[i].value = ''
  }
}

function show_params(badgeType, badgeParams, paramsInputs) {
  var badgeClass = badgeType.options[badgeType.selectedIndex].value.replace(/([a-z])([A-Z])/g, '$1-$2').toLowerCase()
  var currentBadgeParams = document.querySelectorAll('.' + badgeClass)
  all_hide(badgeParams)
  clear_fields(paramsInputs)
  remove_hide(currentBadgeParams)
}

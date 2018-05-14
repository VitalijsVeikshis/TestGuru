document.addEventListener('turbolinks:load', function() {
  var badgeType = document.querySelector('.badge-type')

  if (badgeType) {
    var badgeParams = document.querySelectorAll('.badge-params')

    show_params(badgeType, badgeParams)

    badgeType.addEventListener('change', function() {
      show_params(badgeType, badgeParams)
    })
  }
})

function all_hide(badgeParams) {
  for (var i = 0; i < badgeParams.length; i++) {
    badgeParams[i].classList.add('hide')
  }
}

function remove_hide(currentBadgeParams) {
  for (var i = 0; i < currentBadgeParams.length; i++) {
    currentBadgeParams[i].classList.remove('hide')
  }
}

function show_params(badgeType, badgeParams) {
  var badgeClass = badgeType.options[badgeType.selectedIndex].value.replace(/([a-z])([A-Z])/g, '$1-$2').toLowerCase()
  var currentBadgeParams = document.querySelectorAll('.' + badgeClass)
  all_hide(badgeParams)
  remove_hide(currentBadgeParams)
}

document.addEventListener('turbolinks:load', function() {
  var badgeType = document.querySelector('.badge-type');

  if (badgeType) {
    var badgeParams = document.querySelectorAll('.badge-params');
    var paramsInputs = document.querySelectorAll('.params-input');

    showParams(badgeType, badgeParams, paramsInputs);

    badgeType.addEventListener('change', function() {
      showParams(badgeType, badgeParams, paramsInputs);
    })
  }
})

function allHide(badgeParams) {
  for (var i = 0; i < badgeParams.length; i++) {
    badgeParams[i].classList.add('hide');
    badgeParams[i].value = '';
  }
}

function removeHide(currentBadgeParams) {
  for (var i = 0; i < currentBadgeParams.length; i++) {
    currentBadgeParams[i].classList.remove('hide');
  }
}

function clearFields(paramsInputs) {
  for (var i = 0; i < paramsInputs.length; i++) {
    paramsInputs[i].value = '';
  }
}

function show_params(badgeType, badgeParams, paramsInputs) {
  var badgeClass = badgeType.options[badgeType.selectedIndex].value.replace(/([a-z])([A-Z])/g, '$1-$2').toLowerCase();
  var currentBadgeParams = document.querySelectorAll('.' + badgeClass);
  allHide(badgeParams);
  clearFields(paramsInputs);
  removeHide(currentBadgeParams);
}

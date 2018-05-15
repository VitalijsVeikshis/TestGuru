document.addEventListener('turbolinks:load', function() {
  var badgeForm = document.querySelector('.badge-form');

  if (badgeForm) {
    badgeForm.addEventListener('submit', function() {
      var inputs = badgeForm.querySelectorAll('input');

      for (i = 0; i < inputs.length; i++) {
        if (inputs[i].value === '') {
          inputs[i].parentNode.removeChild(inputs[i]);
        }
      }
    })
  }
})

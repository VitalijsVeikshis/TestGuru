document.addEventListener('turbolinks:load', function() {
  var form = document.forms[0]
  var passwordField = form.elements.namedItem('user_password')
  var passwordConfirmationField = form.elements.namedItem('user_password_confirmation')
  var fields = [passwordField, passwordConfirmationField];

  if (passwordField && passwordConfirmationField) {
    passwordField.oninput = function() { paintFields(fields) }
    passwordConfirmationField.oninput = function() { paintFields(fields) }
  }
})

function paintFields(fields) {
  if (!fields[1].value) {
    removeStyle(fields, 'match')
    removeStyle(fields, 'mismatch')
    document.querySelector('.password-alert').classList.add('hide')
    document.querySelector('.password-verified').classList.add('hide')
  } else if (fields[0].value == fields[1].value) {
    removeStyle(fields, 'mismatch')
    addStyle(fields, 'match')
    document.querySelector('.password-alert').classList.add('hide')
    document.querySelector('.password-verified').classList.remove('hide')
  } else {
    removeStyle(fields, 'match')
    addStyle(fields, 'mismatch')
    document.querySelector('.password-verified').classList.add('hide')
    document.querySelector('.password-alert').classList.remove('hide')
  }
}

function addStyle(fields, style) {
  fields.forEach( function(field) {
    field.classList.add(style)
  })
}

function removeStyle(fields, style) {
  fields.forEach( function(field) {
    field.classList.remove(style)
  })
}

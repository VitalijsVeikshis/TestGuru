document.addEventListener('turbolinks:load', function() {
  var passwordField = document.querySelector('#user_password');
  var passwordConfirmationField = document.querySelector('#user_password_confirmation');
  var fields = [passwordField, passwordConfirmationField];

  if (passwordField && passwordConfirmationField) {
    passwordField.oninput = function() { paintFields(fields) }
    passwordConfirmationField.oninput = function() { paintFields(fields) }
  }
})

function paintFields(fields) {
  var alert = document.querySelector('.password-alert');
  var verified = document.querySelector('.password-verified');

  if (!fields[1].value) {
    none(fields, alert, verified);
  } else if (fields[0].value == fields[1].value) {
    match(fields, alert, verified);
  } else {
    mismatch(fields, alert, verified);
  }
}

function change_style(field, style) {

}

function none(fields, alert, verified) {
  removeStyleFromFields(fields, 'match');
  removeStyleFromFields(fields, 'mismatch');
  alert.classList.add('hide');
  verified.classList.add('hide');
}

function match(fields, alert, verified) {
  removeStyleFromFields(fields, 'mismatch');
  addStyleToFields(fields, 'match');
  alert.classList.add('hide');
  verified.classList.remove('hide');
}

function mismatch(fields, alert, verified) {
  removeStyleFromFields(fields, 'match');
  addStyleToFields(fields, 'mismatch');
  verified.classList.add('hide');
  alert.classList.remove('hide');
}

function addStyleToFields(fields, style) {
  fields.forEach( function(field) {
    field.classList.add(style);
  })
}

function removeStyleFromFields(fields, style) {
  fields.forEach( function(field) {
    field.classList.remove(style);
  })
}

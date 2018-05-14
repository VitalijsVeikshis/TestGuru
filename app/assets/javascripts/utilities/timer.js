document.addEventListener('turbolinks:load', function() {
  var timer = document.querySelector('.timer');

  if (timer) runTimer(timer);
})

function runTimer(timer) {
  var seconds = timer.dataset.timeLeft;

  if (seconds != 'false') {
    var showTimeLeft = function() {
      if (seconds === 0) {
        turnOffTimer(timer, repeater);
        document.forms[0].submit();
      } else {
        seconds--;
      }
      timer.textContent = timeLeftToHhMmSs(seconds);
    }
    var repeater = setInterval(showTimeLeft, 1000);
  } else {
    timer.classList.add('hide');
  }
}

function timeLeftToHhMmSs(seconds) {
  seconds = Number(seconds);

  var hours = Math.floor(seconds / 3600);
  var minutes = Math.floor(seconds % 3600 / 60);
  var seconds = Math.floor(seconds % 3600 % 60);

  return ('0' + hours).slice(-2) + ":" + ('0' + minutes).slice(-2) + ":" + ('0' + seconds).slice(-2);
}

function turnOffTimer(timer, repeater) {
  timer.classList.remove('timer');
  timer.classList.add('ended');
  timer.classList.remove('unended');
  clearInterval(repeater);
}

document.addEventListener('turbolinks:load', function() {
  var timer = document.querySelector('.timer')

  if (timer) { run_timer(timer) }
})

function run_timer(timer) {
  var test_completed = (timer.dataset.testCompleted == 'true')
  var seconds = timer.dataset.timeLeft

  if (seconds < 0) seconds = 0
  if (seconds != 'false') {
    var repeater = setInterval(show_time_left, 1000)
    function show_time_left() {
      if (test_completed || seconds <= 0) {
        turn_off_timer(timer, repeater)
      } else {
        seconds--
      }

      timer.textContent = time_left_to_HH_MM_SS(seconds)
    }
  } else {
    timer.classList.add('hide')
  }
}

function time_left_to_HH_MM_SS(seconds) {
  var date = new Date(null)
  date.setSeconds(seconds)

  return date.toISOString().substr(11, 8)
}

function turn_off_timer(timer, repeater) {
  timer.classList.remove('timer')
  timer.classList.add('ended')
  timer.classList.remove('unended')
  clearInterval(repeater)
}

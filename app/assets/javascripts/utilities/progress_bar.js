document.addEventListener('turbolinks:load', function() {
  var progress_bar = document.querySelector('.progress-bar');

  if (progress_bar) {
    setProgressBar(progress_bar);
  }
})

function setProgressBar(progress_bar) {
  progress = getProgress(progress_bar);

  progress_bar.style.width = progress;
  progress_bar.textContent += progress;
}

function getProgress(progress_bar) {
  var questionNumber = progress_bar.dataset.questionNumber;
  var questionCount = progress_bar.dataset.questionCount;

  return Math.round(questionNumber/questionCount * 100) + '%';
}

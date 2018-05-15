document.addEventListener('turbolinks:load', function() {
  var progressBar = document.querySelector('.progress-bar');

  if (progressBar) {
    setProgressBar(progressBar);
  }
})

function setProgressBar(progressBar) {
  progress = getProgress(progressBar);

  progressBar.style.width = progress;
  progressBar.textContent += progress;
}

function getProgress(progressBar) {
  var questionNumber = progressBar.dataset.questionNumber;
  var questionCount = progressBar.dataset.questionCount;

  return Math.round(questionNumber/questionCount * 100) + '%';
}

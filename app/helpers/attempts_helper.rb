module AttemptsHelper
  def attempt_color(answer, attempt)
    pick_color(answer) if attempt.answer == answer
  end

  def pick_color(answer)
    if answer.correct
      'attempt-success-color'
    else
      'attempt-unsuccess-color'
    end
  end
end

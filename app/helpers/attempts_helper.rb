module AttemptsHelper
  def color(answer, attempt)
    choice_of_color(answer) if answer == attempt.answer
  end

  def choice_of_color(answer)
    if answer.correct
      'attempt-success-color'
    else
      'attempt-unsuccess-color'
    end
  end

  def comment(answer, attempt)
    choice_of_comment(answer) if answer == attempt.answer
  end

  private

  def choice_of_comment(answer)
    if answer.correct
      'Correct'
    else
      'Wrong'
    end
  end
end

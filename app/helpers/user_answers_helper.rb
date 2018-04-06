module UserAnswersHelper
  def color(answer, user_answer)
    choice_of_color(answer) if answer == user_answer.answer
  end

  def choice_of_color(answer)
    if answer.correct
      'user-answer-success-color'
    else
      'user-answer-unsuccess-color'
    end
  end

  def comment(answer, user_answer)
    choice_of_comment(answer) if answer == user_answer.answer
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

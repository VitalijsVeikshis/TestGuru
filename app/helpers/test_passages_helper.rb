module TestPassagesHelper
  SCOPE = %i[helpers test_passages].freeze

  def congratulation(test_passage)
    if test_passage.pass
      I18n.t('.pass', scope: SCOPE)
    else
      I18n.t('.miss', scope: SCOPE)
    end
  end

  def result_color(test_passage)
    if test_passage.pass
      'result-success-color'
    else
      'result-unsuccess-color'
    end
  end

  def timer(test_passage)
    test_passage.time_left&.positive? ? show_time(test_passage) : '00:00:00'
  end

  private

  def show_time(test_passage)
    Time.at(test_passage.time_left).utc.strftime('%H:%M:%S')
  end
end

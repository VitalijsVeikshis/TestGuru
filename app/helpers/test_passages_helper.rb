module TestPassagesHelper
  SCOPE = %i[helpers test_passages].freeze

  def congratulation(test_passage)
    if test_passage.success?
      I18n.t('.pass', scope: SCOPE)
    else
      I18n.t('.miss', scope: SCOPE)
    end
  end

  def result_color(test_passage)
    if test_passage.success?
      'result-success-color'
    else
      'result-unsuccess-color'
    end
  end
end

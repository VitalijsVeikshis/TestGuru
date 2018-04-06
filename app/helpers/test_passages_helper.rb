module TestPassagesHelper
  def congratulation(test_passage)
    if test_passage.success?
      'The test is successfully passed!'
    else
      "The test isn't passed!"
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

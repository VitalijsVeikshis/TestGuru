module TestPassagesHelper

  def congratulation(success)
    if success
      'The test is successfully passed!'
    else
      "The test isn't passed!"
    end
  end

  def result_color(success)
    if success
      'result-success-color'
    else
      'result-unsuccess-color'
    end
  end
end

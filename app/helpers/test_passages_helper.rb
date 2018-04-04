module TestPassagesHelper

  def congratulation(success_minimum = 85)
    if @test_passage.success?(success_minimum)
      'The test is successfully passed!'
    else
      'The test is unsuccessfully passed!'
    end
  end

  def result_color(success_minimum = 85)
    return 'result-success-color' if @test_passage.success?(success_minimum)
    'result-unsuccess-color'
  end
end

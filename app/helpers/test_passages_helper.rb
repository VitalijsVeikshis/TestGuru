module TestPassagesHelper
  def congratulation
    if @test_passage.success?(85)
      'The test is successfully passed!'
    else
      'The test is unsuccessfully passed!'
    end
  end

  def result_color
    return 'success-color' if @test_passage.success?(85)
    'unsuccess-color'
  end
end

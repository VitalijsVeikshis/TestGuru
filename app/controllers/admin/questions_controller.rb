class Admin::QuestionsController < Admin::BaseController
  before_action :set_test, only: %i[index new create]
  before_action :set_question, only: %i[show edit update destroy update_inline]

  def index
    redirect_to test_path(@test)
  end

  def show; end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to admin_test_path(@question.test)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to admin_test_path(@question.test)
    else
      render :edit
    end
  end

  def update_inline
    if @question.update(question_params)
      redirect_to admin_test_path(@question.test)
    else
      render :index
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_test_path(@question.test)
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end

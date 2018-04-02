class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show edit update destroy]
  before_action :find_test

  rescue_from ActiveRecord::RecordNotFound,
              with: :rescue_with_question_not_found

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
      redirect_to @test
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to @test
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    return @test = @question.test if @question.is_a?(Question)
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end

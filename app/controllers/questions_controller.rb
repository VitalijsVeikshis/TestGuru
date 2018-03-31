class QuestionsController < ApplicationController
  before_action :find_test

  rescue_from ActiveRecord::RecordNotFound,
              with: :rescue_with_question_not_found

  def index
    render json: { questions: @test.questions }
  end

  def show
    render json: { question: @test.questions.find(params[:id]) }
  end

  def new; end

  def create
    question = @test.questions.create!(question_params)

    render plain: question.inspect
  end

  def destroy
    Question.find(params[:id]).destroy
  end

  private

  def question_params
    params.require(:question).permit(:test_id, :body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end

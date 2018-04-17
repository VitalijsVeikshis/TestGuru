class QuestionsController < ApplicationController
  before_action :set_test, on: :index

  def index
    redirect_to test_path(@test)
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end
end

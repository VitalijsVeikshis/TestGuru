class TestsController < ApplicationController
  before_action :find_test, only: %i[show edit update destroy]

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
    @author = nil
  end

  def create
    @test = Test.new(complete_test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit
    @author = User.find(@test.author_id)
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def complete_test_params
    author_id = User.by_email(params[:test][:author]).first.id
    test_params.merge(author_id: author_id)
  end
end

class TestsController < ApplicationController
  before_action :set_test, only: %i[show edit update destroy start]

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit
    @author = @test.author
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

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def permit_test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def test_params
    author = User.by_email(params[:test][:author]).first

    return permit_test_params.merge(author_id: author.id) if author
    permit_test_params
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found'
  end
end

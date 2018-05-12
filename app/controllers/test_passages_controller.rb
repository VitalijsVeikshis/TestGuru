class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show
    redirect_to tests_path if empty_test?
  end

  def result; end

  def update
    @test_passage.accept!(Array(params[:answer_ids])) unless @test_passage.completed?

    if @test_passage.completed?
      check_badges
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(question: @test_passage.current_question)
                                .call

    flash_options = if result.is_a?(Sawyer::Resource)
                      create_gist(result)
                      { notice: t('.success_html', url: result.html_url) }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def empty_test?
    @test_passage.test.questions.count.zero?
  end

  def create_gist(gist)
    current_user.gists.create!(url: gist.html_url,
                               question: @test_passage.current_question)
  end

  def check_badges
    Badge.all.each do |badge|
      current_user.badges.push(badge) if badge.pass?(current_user)
      # && !current_user.badges.include?(badge)
    end
  end
end

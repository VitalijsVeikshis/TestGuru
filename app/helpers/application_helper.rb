module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to 'TestGuru', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def question_url_with_test_id(question)
    question_url(question, params: { test_id: question.test.id })
  end

  def edit_question_url_with_test_id(question)
    edit_question_url(question, params: { test_id: question.test.id })
  end
end

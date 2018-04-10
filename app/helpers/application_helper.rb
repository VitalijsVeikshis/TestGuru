module ApplicationHelper
  ALERTS = {
    login: 'Are you a Guru? Verify your Email and Password please'
  }.freeze

  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to 'TestGuru', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def alert_message(alert)
    ALERTS[alert]
  end
end

module ApplicationHelper
  FLASH_MESSAGES = {
    alert: {
      login: 'Are you a Guru? Verify your Email and Password please'
    },
    notice: {
      login: 'Login Sccessful',
      signup: 'Registration Successful'
    }
  }.freeze

  FLASH_STYLES = {
    alert: 'alert alert-danger',
    notice: 'alert alert-success'
  }.freeze

  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to 'TestGuru', "https://github.com/#{author}/#{repo}", target: '_blank', class: 'text-white'
  end

  def flash_message(type, message)
    FLASH_MESSAGES[type][message]
  end

  def flash_style(type)
    FLASH_STYLES[type]
  end
end

class BadgeService
  def initialize(user:)
    @user = user
  end

  def check
    Badge.all.map { |badge| badge if badge.pass?(@user) }.compact
  end
end

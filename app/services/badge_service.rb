class BadgeService
  def initialize(options)
    @current_user = options[:current_user]
  end

  def check
    Badge.all.each do |badge|
      @current_user.badges.push(badge) if badge.pass?(@current_user)
      # && !@current_user.badges.include?(badge)
    end
  end
end

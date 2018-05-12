class Admin < User
  def self.emails
    all.pluck(:email)
  end
end

class Admin < User
  def self.emails
    Admin.all.pluck(:email)
  end
end

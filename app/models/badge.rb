class Badge < ApplicationRecord
  has_many :user_badges
  has_many :users, through: :user_badges

  def self.inherited(child)
    child.instance_eval do
      def model_name
        Badge.model_name
      end
    end
    super
  end

  def self.select_options
    { BadgeForTestAttempt: 'Badge for test attempt',
      BadgeForTestLevel: 'Badge for test level',
      BadgeForTestCategory: 'Badge for test category' }
  end
end

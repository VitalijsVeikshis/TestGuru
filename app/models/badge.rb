class Badge < ApplicationRecord
  has_many :user_badges
  has_many :users, through: :user_badges

  attr_reader :child_classes

  def self.inherited(child)
    child.instance_eval do
      def model_name
        Badge.model_name
      end
    end
    super
  end

  def self.select_options
    load_descendants if descendants.empty?

    Hash[descendants.map(&:to_s).map { |value| [value, value.underscore.humanize] }]
  end

  def self.load_descendants
    Dir["#{Rails.root}/app/models/*.rb"].each do |file|
      require_dependency file
    end
  end
end

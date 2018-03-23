class Test < ApplicationRecord
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages
  belongs_to :category
  has_one :author
  has_one :user, through: :authors

  def self.by_category(category)
    joins(:category).where(categories: { title: category })
                    .order(title: :desc)
                    .pluck(:title)
  end
end

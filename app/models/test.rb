class Test < ApplicationRecord
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages
  belongs_to :category
  belongs_to :author, class_name: 'User'

  validates :title, presence: true
  validates :level, numericality: { greater_than_or_equal_to: 0,
                                    only_integer: true }
  validates :title, uniqueness: { scope: :level }

  scope :easy, -> { where(level: 0..1) }
  scope :normal, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :select_by_category, (lambda do |category|
    joins(:category).where(categories: { title: category })
  end)

  def self.by_category(category)
    select_by_category(category).order(title: :desc).pluck(:title)
  end
end

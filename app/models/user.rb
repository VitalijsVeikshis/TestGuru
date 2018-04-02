class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'

  validates :email, presence: true

  scope :authors, -> { joins(:created_tests) }

  def tests_by_level(level)
    tests.where(level: level)
  end
end

class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :authors
  has_many :created_tests, through: :authors, source: :test

  def tests_by_level(level)
    tests.where(level: level)
  end
end

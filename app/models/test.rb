class Test < ApplicationRecord
  has_many :questions
  belongs_to :category

  def self.tests_by_category(category)
    Test.joins(:category)
        .where('categories.title = :category', category: category)
        .select(:title)
        .map(&:title)
        .sort
        .reverse
  end
end

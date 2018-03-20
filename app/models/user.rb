class User < ApplicationRecord
  has_many :answers

  def tests_by_level(level)
    Test.joins(questions: [:answers])
        .where('answers.user_id = :id AND level = :level', id: id, level: level)
        .select(:title)
        .distinct
        .map(&:title)
  end
end

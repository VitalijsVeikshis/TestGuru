class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_max_answer_quantity, if: :correct

  scope :correct_answers, -> { where(correct: true) }

  private

  def validate_max_answer_quantity
    errors.add(:base) if question.answers.correct_answers.count >= 4
  end
end

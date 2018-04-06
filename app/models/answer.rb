class Answer < ApplicationRecord
  belongs_to :question
  has_many :user_answers

  validates :body, presence: true
  validate :validate_max_answer_quantity, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_max_answer_quantity
    errors.add(:base) if question.answers.count >= 4
  end
end

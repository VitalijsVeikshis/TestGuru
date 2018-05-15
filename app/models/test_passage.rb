class TestPassage < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true
  has_many :user_answers

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_save_next_question
  before_update :pass!, if: :completed?

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    create_user_answers(answer_ids)

    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def pass!(percent = 85)
    self.pass = (current_result >= percent)
  end

  def current_result
    self.correct_questions.to_f * 100 / test.questions.count
  end

  def question_number
    test.questions.order(:id).where('id < ?', current_question&.id).count + 1
  end

  def time_left
    return if test.timer.nil?

    time_left = test.timer - (Time.now.to_i - created_at.to_i)

    time_left.positive? ? time_left : 0
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_save_next_question
    self.current_question = next_question
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def create_user_answers(answer_ids)
    answer_ids.each do |answer_id|
      UserAnswer.create!(test_passage: self, answer: Answer.find(answer_id))
    end
  end
end

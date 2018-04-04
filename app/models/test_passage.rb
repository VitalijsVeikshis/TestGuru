class TestPassage < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true
  has_many :attempts

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_save_next_question, on: :update

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    create_attempts(answer_ids) if answer_ids

    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def success?(percent)
    current_result >= percent
  end

  def current_result
    self.correct_questions.to_f * 100 / test.questions.count
  end

  def question_number
    test.questions.order(:id).where('id < ?', current_question.id).count + 1
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort if answer_ids
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

  def create_attempts(answer_ids)
    answer_ids.each do |answer_id|
      Attempt.create!(test_passage: self, answer: Answer.find(answer_id))
    end
  end
end

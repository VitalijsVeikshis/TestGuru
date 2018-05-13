class TestPassage < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true
  has_many :user_answers

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_time_left, on: :create
  before_update :before_save_next_question
  before_update :pass!, if: :completed?
  before_update :before_update_set_time_left

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    create_user_answers(answer_ids)

    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def pass!(percent = 85)
    update_columns(updated_at: Time.current, pass: current_result >= percent)
  end

  def current_result
    self.correct_questions.to_f * 100 / test.questions.count
  end

  def question_number
    test.questions.order(:id).where('id < ?', current_question.id).count + 1
  end

  def time_left_ended?
    time_left <= 0 if time_left.present?
  end

  private

  def before_update_set_time_left
    update_columns(updated_at: Time.current, time_left: new_time_left)
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_validation_set_time_left
    self.time_left = test.timer if test.present?
  end

  def new_time_left
    time_left - (Time.now.to_i - created_at.to_i) if time_left.present?
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

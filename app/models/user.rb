class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'
  has_many :gists
  has_many :user_badges
  has_many :badges, through: :user_badges

  validates :email,
            presence: true,
            uniqueness: true

  scope :authors, -> { joins(:created_tests) }
  scope :by_email, ->(email) { where(email: email) }

  def tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def admin?
    is_a?(Admin)
  end

  def test_passages_by_pass(pass)
    test_passages.where(pass: pass)
  end

  def tests_by_pass(pass)
    tests.where(test_passages: { pass: pass })
  end

  def tests_by_pass_and_category(pass, category)
    tests.joins(:category)
         .where(categories: { title: category }, test_passages: { pass: pass })
  end

  def test_passages_by_test(test)
    test_passages.where(test: test)
  end

  def tests_by_pass_and_level(pass, level)
    tests.where(level: level, test_passages: { pass: pass })
  end

  def pass_tests

  end

  def last_test_passage
    test_passages.order(id: :asc).last
  end
end

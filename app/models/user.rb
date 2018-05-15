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

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def admin?
    is_a?(Admin)
  end

  def tests_by_pass(pass)
    tests.where(test_passages: { pass: pass })
  end

  def tests_by_pass_and_category(pass, category)
    tests.joins(:category)
         .where(categories: { title: category }, test_passages: { pass: pass })
  end

  def tests_by_pass_and_level(pass, level)
    tests.where(level: level, test_passages: { pass: pass })
  end
end

class Contact < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, 'valid_email_2/email': true
  validates :content, presence: true
end

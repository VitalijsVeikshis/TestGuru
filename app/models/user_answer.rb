class UserAnswer < ApplicationRecord
  belongs_to :test_passage
  belongs_to :answer
end

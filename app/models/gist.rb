class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :user

  def hash
    url.split('/').last
  end
end

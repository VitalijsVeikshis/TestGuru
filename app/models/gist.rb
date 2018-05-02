class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :user

  def hash
    url.split('/').last
  end

  def delete_from_remote(client: nil)
    client ||= Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
    client.delete_gist(hash)
  end
end

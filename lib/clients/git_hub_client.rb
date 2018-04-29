class GitHubClient
  ROOT_ENDPOINT = 'https://api.github.com'
  ACCESS_TOKEN = 'f5674004c0017c629e2a05948d914ff69dbfb13f'

  def initialize
    @http_client = setup_http_client
  end

  def create_gists(params)
    @http_client.post('gists') do |request|
      request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
      request.headers['Content-Type'] = 'application/json'
      request.body = params.to_json
    end
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end
end

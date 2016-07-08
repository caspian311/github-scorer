class GithubDataProvider
  attr_reader :username

  def initialize(username)
    @username = username
  end

  def event_data
    begin
      fetch_event_data
    rescue RestClient::ResourceNotFound => e
      raise GithubError, "#{username} is not a valid username"
    rescue
      raise GithubError, 'Github did not respond well to that reequest'
    end
  end

  private

  def fetch_event_data
    JSON.parse(raw_data).map do |event|
      { type: event['type'] }
    end
  end

  def raw_data
    RestClient.get events_endpoint
  end

  def events_endpoint
    "https://api.github.com/users/#{username}/events"
  end
end


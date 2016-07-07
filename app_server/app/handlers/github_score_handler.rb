class GithubScoreHandler
  attr_reader :username

  def initialize(username)
    @username = username
  end

  def handle
    response.inject(0) do |sum, event|
      sum + event_value(event)
    end
  end

  private

  def response

    response = CachedResponse.find_or_create_by(username: username).tap do |cached_response|
      unless cached_response.response
        cached_response.update response: raw_data
      end
    end.response
    JSON.parse response
  end

  def raw_data
    RestClient.get("https://api.github.com/users/#{username}/events")
  end

  def event_value(event)
    case event['type']
      when 'PushEvent'
        5
      when 'CreateEvent'
        3
      when 'IssuesEvent'
        2
      else
        1
    end
  end
end

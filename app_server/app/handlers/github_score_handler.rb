class GithubScoreHandler
  attr_reader :username

  def initialize(username)
    @username = username
  end

  def handle
    user_data.inject(0) do |sum, event|
      sum + event_value(event)
    end
  end

  private

  def user_data
    JSON.parse response
  end

  def response
    CachedResponse.find_or_create_by(username: username) do |cached_response|
      cached_response.update response: trimmed_data
    end.response
  end

  def trimmed_data
    GithubDataProvider.new(username).event_data.to_json
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


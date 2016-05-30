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
    raw = RestClient.get "https://api.github.com/users/#{username}/events"
    JSON.parse raw
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

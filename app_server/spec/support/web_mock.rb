require 'webmock/rspec'

module MockingWebRequests
  WebMock.disable_net_connect! allow_localhost: true
end

RSpec.configure do |config|
  config.include MockingWebRequests
end
  

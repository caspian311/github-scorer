require 'rails_helper'

describe GithubScoreHandler do

  subject { described_class.new username }

  describe '#handle' do
    let(:username) { 'user1' }
    let(:response) { IO.read(Rails.root.join('spec', 'fixtures', 'api_responses', "#{username}.json")) }

    before do
      stub_request(:get, "https://api.github.com/users/#{username}/events").to_return(:body => response)
    end

    it 'should query endpoint' do
      expect(subject.handle).to eq(11)
    end
  end
end

require 'rails_helper'

describe GithubDataProvider do
  subject { described_class.new username }

  let(:username) { 'foo' }

  describe '#event_data' do
    describe 'when there is no cached response' do
      before do
        stub_request(:get, "https://api.github.com/users/#{username}/events").to_return(status: [404, 'No username'])
      end

      it 'should raise a GithubError' do
        expect { subject.event_data }.to raise_error(GithubError, "#{username} is not a valid username")
      end
    end

    describe 'when any other error occurs' do
      before do
        stub_request(:get, "https://api.github.com/users/#{username}/events").to_return(status: [500, 'Bad thing happened'])
      end

      it 'should raise a GithubError with a generic message' do
        expect { subject.event_data }.to raise_error(GithubError, 'Github did not respond well to that reequest')
      end
    end
  end
end

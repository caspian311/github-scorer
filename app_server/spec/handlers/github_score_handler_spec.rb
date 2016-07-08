require 'rails_helper'

describe GithubScoreHandler do
  subject { described_class.new username }

  let(:response) { IO.read(Rails.root.join('spec', 'fixtures', 'api_responses', "#{username}.json")) }

  describe '#handle' do
    describe 'when there is no cached response' do
      before do
        stub_request(:get, "https://api.github.com/users/#{username}/events").to_return(:body => response)
      end

      describe 'normal case' do
        let(:username) { 'user1' }

        it 'should query endpoint' do
          expect(subject.handle).to eq(11)
        end

        it 'should create cached entry' do
          subject.handle
          
          expect(CachedResponse.count).to eq(1)
        end
      end

      describe 'when the data gets big and messy' do
        let(:username) { 'big_messy' }

        it 'should query endpoint' do
          expect(subject.handle).to eq(48)
        end
      end
    end

    describe 'when there is a cached response' do
      let!(:cached_response) { create :cached_response, username: username, response: response }
      let(:username) { 'user2' }

      it 'should use cached data' do
        expect(subject.handle).to eq(8)
      end

      it 'should not create more cached data' do
        expect(CachedResponse.count).to eq(1)
      end
    end
  end
end

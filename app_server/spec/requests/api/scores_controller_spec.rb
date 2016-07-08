require 'rails_helper'

describe 'ApiScoresController' do
  let(:user1) { 'abc' }
  let(:user2) { 'def' }

  let(:user1_score_handler) { double 'score handler', handle: 5 }
  let(:user2_score_handler) { double 'score handler', handle: 3 }

  describe '#show' do
    describe 'when users exist' do
      before do
        allow(GithubScoreHandler).to receive(:new).with(user1) { user1_score_handler }
        allow(GithubScoreHandler).to receive(:new).with(user2) { user2_score_handler }

        get api_scores_path(users: [user1, user2])
      end

      it 'should give back a 200' do
        expect(response.status).to eq(200)
      end

      it 'should call the handler' do
        expect(user1_score_handler).to have_received(:handle)
        expect(user2_score_handler).to have_received(:handle)
      end

      it 'should compile the results together' do
        expect(user1_score_handler).to have_received(:handle)
      end
    end
  end

  describe 'when users does not exist' do
    let(:error_message) { 'oh noes!' }

    before do
      allow(GithubScoreHandler).to receive(:new).and_raise GithubError, error_message

      get api_scores_path(users: [user1])
    end

    it 'should give back a 404' do
      expect(response.status).to eq(404)
    end

    it 'should give back the error message' do
      expect(JSON.parse(response.body)['error_message']).to eq(error_message)
    end
  end
end

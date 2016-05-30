require 'rails_helper'

describe 'ApiScoresController' do
  let(:user1) { 'abc' }
  let(:user2) { 'def' }

  let(:user1_score_handler) { double 'score handler', handle: 5 }
  let(:user2_score_handler) { double 'score handler', handle: 3 }

  before do
      allow(GithubScoreHandler).to receive(:new).with(user1) { user1_score_handler }
      allow(GithubScoreHandler).to receive(:new).with(user2) { user2_score_handler }

      get api_scores_path(users: [user1, user2])
  end

  describe '#show' do
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

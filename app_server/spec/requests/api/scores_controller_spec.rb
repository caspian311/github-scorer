require 'rails_helper'

describe 'ApiScoresController' do
  let(:score_handler) { double 'score handler' }
  before do
      allow(GithubScoreHandler).to receive(:new) { score_handler }
      allow(score_handler).to receive(:handle)
  end

  describe '#show' do
    it 'should give back a 200' do
      get api_scores_path
      expect(response.status).to eq(200)
    end

    it 'should call the handler' do
      expect(score_handler).to receive(:handle)

      get api_scores_path
    end
  end
end

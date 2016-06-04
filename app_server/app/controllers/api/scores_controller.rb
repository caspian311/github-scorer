class Api::ScoresController < ApplicationController
  def show
    results = []
    params[:users].each do |user|
      results << { username: user, score: GithubScoreHandler.new(user).handle }
    end
    render json: results.sort { |a, b| b[:score] <=> a[:score] }
  end
end

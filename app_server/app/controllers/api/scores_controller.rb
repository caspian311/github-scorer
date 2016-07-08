class Api::ScoresController < ApplicationController
  def show
    begin
      render json: results
    rescue GithubError => e
      render json: { error_message: e.message }, status: 404
    end
  end

  private

  def results
    results = []
    params[:users].each do |user|
      results << { username: user, score: GithubScoreHandler.new(user).handle }
    end
    results.sort { |a, b| b[:score] <=> a[:score] }
  end
end

class Api::ScoresController < ApplicationController
  def show
    results = []
    params[:users].each do |user|
      results << { user => GithubScoreHandler.new(user).handle }
    end
    render json: results
  end
end

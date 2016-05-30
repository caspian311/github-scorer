class Api::ScoresController < ApplicationController
  def show
    GithubScoreHandler.new.handle
    head :ok
  end
end

class MatchesController < ApplicationController
  def index
    ## Array of each game_id
    @matches = Player.distinct.pluck(:game_id)
  end


  def show
    @game_id = params[:game_id]
    @players = Player.where(game_id: params[:game_id]).order(:score => :desc)
  end
end

class MatchesController < ApplicationController
  def index
    ## Array of each game_id
    ## Get each match id and the date it was created, and order it by the dates
    ## Comes out to become an unordered hash and will be converted to array [game_id, min(created_at)]
    ## Need to order it and then give it to instance variable.
    ## Will order in descending order.
    @matches = Player.select(:game_id, :created_at).group(:game_id).minimum(:created_at).to_a.sort! do |match_1, match_2|
      (match_1[1] <=> match_2[1])*-1
    end

  end


  def show
    @game_id = params[:game_id]
    @players = Player.where(game_id: params[:game_id]).order(:score => :desc)
  end
end

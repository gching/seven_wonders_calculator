class PlayersController < ApplicationController
  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to @player, notice: "Success! Created player!"
    else
      render :new
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    if @player.update_attributes(player_params)
      redirect_to @player, notice: "Success! Edited player!"
    else
      render :edit
    end
  end

  def show
    @player = Player.find(params[:id])
  end


  private

  def player_params
    params.require(:player).permit(:game_id, :name, :victories, :coins, :wonders, :blues, :yellows, :purples, :tablets, :compasses, :gears, :leaders, :blacks)
  end
end

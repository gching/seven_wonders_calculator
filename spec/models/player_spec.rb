require 'spec_helper'

describe Player do
  let(:first_player) {build(:player)}


  it "has a valid factory to build a player" do
    expect(first_player).to be_valid
  end

  it "is invalid without a game id" do
    expect(build(:player, game_id: nil)).to have(1).errors_on(:game_id)
  end

  it "is invalid without a player name" do
    expect(build(:player, name: nil)).to have(1).errors_on(:name)
  end

  it "is invalid without the points" do
    expect(build(:player, points: nil)).to have(1).errors_on(:points)
  end

  it "should raise an error if each value is not a number" do
    %w[victories coins wonders blues yellows purples tablets compasses gears leaders blacks].each do |key|
      expect(build(:player, key.to_sym => "string")).to have(1).errors_on(key.to_sym)
    end
  end

  it "should be able to calculate total score of player" do
    ## Calculate the score here!
    total_score = first_player.victories + first_player.coins/3 +first_player.blues + first_player.yellows + first_player.purples + first_player.leaders + first_player.blacks

    ## Greens
    greens = [first_player.tablets, first_player.compasses, first_player.gears]
    total_score += (greens.min*7) + greens[0]**2 + greens[1]**2 + greens[2]**2

  end
end

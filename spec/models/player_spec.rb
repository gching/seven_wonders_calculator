require 'spec_helper'

describe Player do
  let(:first_player) {build(:player)}

  it "has a valid factory to build a player" do
    expect(first_player).to be_valid
  end
  
end

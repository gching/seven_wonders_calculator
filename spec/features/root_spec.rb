require 'spec_helper'


describe "root page" do
  let(:title) {"Seven Wonders Calculator App"}
  before :each do
    @player = create(:player, game_id: 1)
    visit '/'
  end

  it "should have the title of the app" do
    expect(page).to have_content(title)
  end

  it "should have a link to create a new player" do
    expect(page).to have_link("New Player")
  end

  it "should have the link to the match via game ID" do
    expect(page).to have_link("Match 1")
  end
end


describe "match / player page" do
  before :each do
    @player1 = create(:player, game_id: 1, victories: 1000)
    @player2 = create(:player, game_id: 1)
    visit '/'
    click_link("Match 1")
  end

  it "should have the correct ranking" do
    expect(page).to have_selector("ol#players li:nth-child(1)", text: "#{@player1.name} - #{@player1.score}")
    expect(page).to have_selector("ol#players li:nth-child(2)", text: "#{@player2.name} - #{@player2.score}")
  end

end


describe "creating new player" do
  before :each do
    visit '/'
    click_link("New Player")
    ## Fill in
    within("#playerform") do
      fill_in "Game ID", :with => "5"
      fill_in "Name", :with => "Gavin Ching"
      %w[victories coins wonders blues yellows purples tablets compasses gears leaders blacks].each do |attr|
        fill_in attr.capitalize, :with => "20"
      end
    end
    click_button "Submit"
  end

  it "should redirect to the new player page" do
    expect(page).to have_content("Success! Created player!")
    expect(page).to have_content("Gavin Ching")
  end

  it "should have a link to the match via game id" do
    expect(page).to have_link("Match 5")
  end

  it "should have a link to edit" do
    expect(page).to have_link("Edit this player")
  end

  it "should have a link to all the matches" do
    expect(page).to have_link("Go back to all the matches")
  end

end

describe "editing player" do
  before :each do
    @player = create(:player, game_id: 0)
    visit '/'
    click_link("Match 0")
    click_link("#{@player.name} - #{@player.score}")
    click_link("Edit this player")
    within("#playerform") do
      fill_in "Game ID", :with => "5"
    end
    click_button "Submit"
  end

  it "should redirect to the player page" do
    expect(page).to have_content("Success! Edited player!")
    expect(page).to have_content(@player.name)
  end

  it "should have the game_id changed" do
    expect(page).to have_link("Match 5")
  end
end

describe "show player" do
  before :each do
    @player = create(:player, game_id: 0)
    visit '/'
    click_link("Match 0")
    click_link("#{@player.name} - #{@player.score}")
  end

  it "should have a link back to the match page and have this player" do
    click_link("Match 0")
    expect(page).to have_selector("ol#players li:nth-child(1)", text: "#{@player.name} - #{@player.score}")
  end

end

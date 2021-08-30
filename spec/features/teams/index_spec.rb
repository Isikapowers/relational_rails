require 'rails_helper'

RSpec.describe 'the teams index page' do
  before :each do
    @team = Team.create!(name: "New York Knicks", make_playoffs: true, wins: 50)
    @team_2 = Team.create!(name: "Nets", make_playoffs: true, wins: 25)
    @kevin = @team.players.create!(name: "Kevin Durant", number: 25, injured: false)
    @lebron = @team.players.create!(name: "Lebron James", number: 11, injured: false)
  end

  it 'links you to book index' do
    visit '/players'

    click_on "Books"

    expect(current_path).to eq("/books")
  end

  it 'links you to store index' do
    visit '/players'

    click_on "Book Stores"

    expect(current_path).to eq("/stores")
  end

  it 'links you to team index' do
    visit '/players'

    click_on "Teams"

    expect(current_path).to eq("/teams")
  end

  it 'links you to book index' do
    visit '/players'

    click_on "Players"

    expect(current_path).to eq("/players")
  end

  describe "Iteration 1" do
    it 'shows all the teams on index page' do
      visit "/teams"

      expect(page).to have_content("New York Knicks")
      expect(page).to have_content("Nets")
    end

    it 'shows the specific team and its attributes when going to team/team_id' do
      visit "/teams/#{@team.id}"

      expect(page).to have_content("New York Knicks")
      expect(page).to have_content("Wins: 50")
      expect(page).to have_content("Make Playoffs? true")
    end

    it "shows teams by most recently created and their created time" do
      visit "/teams/"

      expect(page).to have_content("New York Knicks")
      expect(page).to have_content("Created at:")
      #need to test if order is working properly
    end
  end

  describe "iteration 2" do
    it "has a Add new team button" do
      visit "/teams/"

      expect(page).to have_content("Add new team")
    end

    it "brings you to a new page to create new team" do
      visit "/teams/"

      click_on "Add new team"

      expect(current_path).to eq("/teams/new")
    end
  end

  it 'lets you click a link to create a new team and brings you to teams/new' do
    visit "/teams"

    click_on "Add new team"
  end
end

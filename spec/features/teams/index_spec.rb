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

    click_on "Book Index"

    expect(current_path).to eq("/books")
  end

  it 'links you to store index' do
    visit '/players'

    click_on "Store Index"

    expect(current_path).to eq("/stores")
  end

  it 'links you to team index' do
    visit '/players'

    click_on "Team Index"

    expect(current_path).to eq("/teams")
  end

  it 'links you to book index' do
    visit '/players'

    click_on "Players Index"

    expect(current_path).to eq("/players")
  end

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

  it 'lets you click a link to create a new teama nd brings you to teams/new' do
    visit "/teams"

    click_on "Add new team"
  end
end
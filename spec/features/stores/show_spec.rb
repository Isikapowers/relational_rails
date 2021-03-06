require "rails_helper"

RSpec.describe "Stores Show Page" do
  before :each do
    @store1 = Store.create!(name: "Barnes and Noble", open_on_weekends: true, inventory: 4739)

    @book1 = @store1.books.create!(title: "Dino Potty Book", price: 13.99, kids_friendly: true)
    @book2 = @store1.books.create!(title: "I Love You to The Moon and Back", price: 29.89, kids_friendly: true)

    @store2 = Store.create!(name: "50/50 Book Store", open_on_weekends: false, inventory: 638)
  end

  describe "Features in Iteration 1" do
    it "shows the store with that id" do
      visit "/stores/#{@store1.id}"

      expect(page).to have_content(@store1.name)
      expect(page).to_not have_content(@store2.name)

      visit "/stores/#{@store2.id}"

      expect(page).to have_content(@store2.name)
      expect(page).to_not have_content(@store1.name)
    end

    it "shows that store's attributes" do
      visit "/stores/#{@store1.id}"

      expect(page).to have_content(@store1.name)
      expect(page).to have_content(@store1.open_on_weekends)
      expect(page).to have_content(@store1.inventory)

      visit "/stores/#{@store2.id}"

      expect(page).to have_content(@store2.name)
      expect(page).to have_content(@store2.open_on_weekends)
      expect(page).to have_content(@store2.inventory)
    end

    it "can disply a form for user to edit" do
      visit "/stores/#{@store1.id}/edit"

      expect(page).to have_field("name")
      expect(page).to have_field("inventory")
      expect(page).to have_field("open_on_weekends")
    end

    it "can take user back to the book index page" do
      visit "/stores"

      click_on "Books"

      expect(current_path).to eq("/books")
    end
  end

  describe "Features in Iteration 2" do
    it "can take user to the books of that store page" do
      visit "/stores/#{@store1.id}"

      click_on "List of Books"

      expect(current_path).to eq("/stores/#{@store1.id}/books")
    end

    it "can take user to the books of that store page" do
      visit "/stores/#{@store2.id}"

      click_on "List of Books"

      expect(current_path).to eq("/stores/#{@store2.id}/books")
    end

    it "can take user to update/edit store's attributes" do
      visit "/stores/#{@store1.id}"

      click_on "EDIT", match: :first

      expect(current_path).to eq("/stores/#{@store1.id}/edit")
    end

    it "displays a form" do
      visit "/stores/#{@store1.id}/edit"

      expect(page).to have_field(:name)
      expect(page).to have_field(:inventory)
      expect(page).to have_field(:open_on_weekends)
    end

    it "allows user to fill out a form and submit" do
      visit "/stores/#{@store1.id}/edit"

      fill_in(:name, with: "50/50 Book Store")
      fill_in(:inventory, with: 72343)

      click_on "SUBMIT"

      expect(current_path).to eq("/stores/#{@store1.id}")
      expect(page).to have_content("50/50 Book Store")
    end
  end

  describe "Features in Iteration 3" do
    it "allows user to delete a store" do
      visit "/stores"

      click_on "DELETE", match: :first

      expect(current_path).to eq("/stores")
      expect(page).to have_no_content(@store1)
      expect(page).to have_no_content(@book1)
      expect(page).to have_no_content(@book2)
    end
  end

  describe "Go Back Home" do
    it "can go back home" do
      visit "/stores/"

      click_link("Go Back Home")

      expect(current_path).to eq("/")
    end
  end
end

require "rails_helper"

RSpec.describe "Store Book Index Page" do
  before :each do
    @store1 = Store.create!(name: "Barnes and Noble", open_on_weekends: true, inventory: 4739)

    @dino = @store1.books.create!(title: "Dino Potty Book", price: 13.99, kids_friendly: true)
    @moon = @store1.books.create!(title: "I Love You to The Moon and Back", price: 29.89, kids_friendly: true)

    @store2 = Store.create!(name: "50/50 Book Store", open_on_weekends: false, inventory: 638)

    @harry = @store2.books.create!(title: "Harry Potter", price: 19.99, kids_friendly: true)
    @rr= @store2.books.create!(title: "Ruby on Rails", price: 39.77, kids_friendly: false)
  end

  it "shows all of the title of the stores" do
    visit "/books"

    expect(page).to have_content(@dino.title)
    expect(page).to have_content(@moon.title)
  end

  it "shows each book's attributes" do
    visit "/stores/#{@store1.id}/books"

    expect(page).to have_content(@dino.title)
    expect(page).to have_content(@dino.price)
    expect(page).to have_content(@dino.kids_friendly)

    expect(page).to have_content(@moon.title)
    expect(page).to have_content(@moon.price)
    expect(page).to have_content(@moon.kids_friendly)

    expect(page).to_not have_content(@harry.title)
    expect(page).to_not have_content(@harry.price)
  end

  describe "Links/Buttons in Iteration 1" do
    it "can go back home" do
      visit "/books/"

      click_link("Go Back Home")

      expect(current_path).to eq("/")
    end

    it "can take user to stores page from every page" do
      visit "/stores/#{@store1.id}/books"

      click_link "Book Stores"

      expect(current_path).to eq("/stores")
    end
  end

  describe "Links/Buttons in Iteration 2" do
    it "can take user to add new book to that store page with form" do
      visit "/stores/#{@store1.id}"

      click_link "Add New Book"

      expect(current_path).to eq("/stores/#{@store1.id}/books/new")

      expect(page).to have_field(:title)
      expect(page).to have_field(:price)
      expect(page).to have_field(:kids_friendly)
    end

    it "can let user fill out the form and submit" do
      visit "/stores/#{@store1.id}/books/new"

      fill_in("Title", with: "Hello Kitty")
      fill_in("Price", with: 12.99)
      # check("Kids friendly", with: true)

      click_on "SUBMIT"
      book_id = Book.last

      expect(current_path).to eq("/stores/#{@store1.id}/books")
      expect(page).to have_content("Hello Kitty")
      # expect(page).to have_content("8888")
      # expect(page).to have_content("Open_on_weekends: true")
    end

    it "can go back home from any page" do
      visit "/books/new"

      click_link("Go Back Home")

      expect(current_path).to eq("/")
    end
  end

end

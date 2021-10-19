require 'rails_helper'

RSpec.describe "The movie show page" do
  it "displays all the attributes of a movie", :vcr do
    visit movie_path(385128)

    expect(page).to have_content("F9")
    expect(page).to have_content("143 minutes")
    expect(page).to have_content("Dominic Toretto and his crew battle the most skilled assassin and high-performance driver they've ever encountered: his forsaken brother.")
    expect(page).to have_content("Genres: Action Crime Thriller")
    expect(page).to have_content("Average Rating: 7.4")
    expect(page).to have_content("Vin Diesel as Dominic Toretto")
    expect(page).to have_content("Michelle Rodriguez as Letty Ortiz")
    expect(page).to have_content("8 Reviews")
    expect(page).to have_content("garethmb - After being delayed from a summer 2020 release by the Pandemic")
  end

  xit "has a button to make a new party", :vcr do
    @rowan = User.create(name: 'Rowan', email: "rowan@test.com", password: "test")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@rowan)

    visit movie_path(385128)

    expect(page).to have_button("New Viewing Party")
    click_on "New Viewing Party"

    expect(current_path).to eq(new_party_path)
  end
end

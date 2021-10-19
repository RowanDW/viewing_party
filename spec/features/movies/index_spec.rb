require 'rails_helper'

RSpec.describe "The movie index page" do
  before :each do
    @rowan = User.create(name: 'Rowan', email: "rowan@test.com", password: "test")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@rowan)
  end
  it "starts out showing the top 40 movies", :vcr do
    visit movies_path

    expect(page).to have_content("Venom: Let There Be Carnage")
    expect(page).to have_content("Free Guy")
    expect(page).to have_content("The Addams Family 2")
  end

  it "has a button to display the top 40 movies", :vcr do
    visit movies_path

    expect(page).to have_button("Find Top Rated Movies")
    click_on "Find Top Rated Movies"

    expect(current_path).to eq(movies_path)
    expect(page).to have_content("Venom: Let There Be Carnage")
    expect(page).to have_content("Free Guy")
    expect(page).to have_content("The Addams Family 2")
  end

  it 'has a search field to find movies', :vcr do
    visit movies_path

    fill_in :query, with: "Princess"
    click_on "Find Movies"

    expect(current_path).to eq(movies_path)
    expect(page).to have_content("Barbie: Princess Adventure")
    expect(page).to have_content("Princess Protection Program")
    expect(page).to have_content("The Princess and the Frog")
  end

  xit "links each movie title to its show page", :vcr do  #
    visit movies_path

    expect(page).to have_link("Venom: Let There Be Carnage")
    click_on "Venom: Let There Be Carnage"

    expect(current_path).to eq(movie_path(580489))
  end

  it "displays text if no search results", :vcr do
    visit movies_path

    fill_in :query, with: "hfjkdhfjskdfhjdks"
    click_on "Find Movies"

    expect(current_path).to eq(movies_path)
    expect(page).to have_content("No movies found")
  end
end
